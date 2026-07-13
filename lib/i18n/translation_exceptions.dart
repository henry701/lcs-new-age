/// Catalog entries whose runtime values are translated separately.
///
/// These templates contain only input-contract punctuation, numbers, names,
/// or placeholders. Treating the shell as untranslated prose would hide the
/// actual work: dynamic phrases are translated at their insertion points.
const Set<String> structuralTranslationKeys = {
  '{key} - {category}:',
  '{subject} {action}...',
  'Enter - {exit}',
  'Enter - {exitText}',
  '3 - Hospital ({hospital})',
  '{first} {middleInitial}. {last}',
  '{lead} {action}.',
  '{name1} {versus} {name2}',
  ' ({price})',
  'DNA',
  'DEO VINDICE',
};
