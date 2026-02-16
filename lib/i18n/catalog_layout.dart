import 'dart:collection';

/// Default number of hash shards for ARB catalog partitioning.
const int defaultArbCatalogShardCount = 16;

/// Canonical shard representation for an ARB catalog file.
class ArbCatalogShard {
  const ArbCatalogShard({
    required this.shardIndex,
    required this.fileName,
    required this.entries,
  });

  final int shardIndex;
  final String fileName;
  final SplayTreeMap<String, dynamic> entries;
}

/// Merge, hash-partition, and canonically sort multiple ARB maps.
///
/// - `catalogMaps` are merged in-order (last write wins)
/// - keys are partitioned by a deterministic hash of the source key
/// - all JSON objects are recursively key-sorted
/// - output shards are returned in deterministic file-order
Future<List<ArbCatalogShard>> buildArbCatalogShards({
  required String locale,
  required Iterable<Map<String, dynamic>> catalogMaps,
  int shardCount = defaultArbCatalogShardCount,
  bool includeEmptyShards = false,
}) async {
  final merged = mergeArbCatalogMaps(catalogMaps);
  final shardMaps = <int, Map<String, dynamic>>{};

  for (final entry in merged.entries) {
    final shardIndex = arbCatalogShardIndexForKey(
      entry.key,
      shardCount: shardCount,
    );
    final shardMap = shardMaps.putIfAbsent(
      shardIndex,
      () => <String, dynamic>{},
    );
    shardMap[entry.key] = entry.value;
  }

  if (includeEmptyShards) {
    for (int i = 0; i < shardCount; i++) {
      shardMaps.putIfAbsent(i, () => <String, dynamic>{});
    }
  }

  final shardIndexes = shardMaps.keys.toList()..sort();
  final sortingJobs = shardIndexes
      .map((index) => _sortShard(index, shardMaps[index]!))
      .toList();
  final sortedShards = await Future.wait(sortingJobs);

  sortedShards.sort((a, b) => a.shardIndex.compareTo(b.shardIndex));
  return sortedShards
      .map(
        (sorted) => ArbCatalogShard(
          shardIndex: sorted.shardIndex,
          fileName: arbCatalogShardFileName(locale, sorted.shardIndex),
          entries: sorted.entries,
        ),
      )
      .toList(growable: false);
}

/// Merge ARB catalogs with last-write-wins semantics.
Map<String, dynamic> mergeArbCatalogMaps(
  Iterable<Map<String, dynamic>> catalogMaps,
) {
  final merged = <String, dynamic>{};
  for (final catalog in catalogMaps) {
    for (final entry in catalog.entries) {
      merged[entry.key] = entry.value;
    }
  }
  return merged;
}

/// Resolve canonical shard index for an ARB key.
int arbCatalogShardIndexForKey(
  String key, {
  int shardCount = defaultArbCatalogShardCount,
}) {
  if (shardCount <= 0) {
    throw ArgumentError.value(shardCount, 'shardCount', 'must be > 0');
  }

  final sourceKey = key.startsWith('@') && key.length > 1
      ? key.substring(1)
      : key;
  final hash = _fnv1a32(sourceKey);
  return hash % shardCount;
}

/// Canonical filename for a locale + shard.
String arbCatalogShardFileName(String locale, int shardIndex) {
  if (shardIndex < 0) {
    throw ArgumentError.value(shardIndex, 'shardIndex', 'must be >= 0');
  }
  if (shardIndex == 0) return 'app_$locale.arb';
  return 'app_${locale}_part${shardIndex.toString().padLeft(2, '0')}.arb';
}

int _fnv1a32(String input) {
  var hash = 0x811c9dc5;
  for (final codeUnit in input.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * 0x01000193) & 0xffffffff;
  }
  return hash & 0x7fffffff;
}

Future<_SortedShardResult> _sortShard(
  int shardIndex,
  Map<String, dynamic> entries,
) async {
  final sorted = _sortMapRecursively(entries);
  return _SortedShardResult(shardIndex, sorted);
}

SplayTreeMap<String, dynamic> _sortMapRecursively(Map<String, dynamic> source) {
  final result = SplayTreeMap<String, dynamic>();
  final keys = source.keys.toList()..sort();
  for (final key in keys) {
    result[key] = _sortJsonValue(source[key]);
  }
  return result;
}

Object? _sortJsonValue(Object? value) {
  if (value is Map<String, dynamic>) {
    return _sortMapRecursively(value);
  }
  if (value is Map) {
    final normalized = <String, dynamic>{};
    for (final entry in value.entries) {
      normalized[entry.key.toString()] = entry.value;
    }
    return _sortMapRecursively(normalized);
  }
  if (value is List) {
    return value.map(_sortJsonValue).toList(growable: false);
  }
  return value;
}

class _SortedShardResult {
  const _SortedShardResult(this.shardIndex, this.entries);

  final int shardIndex;
  final SplayTreeMap<String, dynamic> entries;
}
