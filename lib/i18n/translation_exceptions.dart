/// Catalog entries whose runtime values are translated separately.
///
/// These templates contain only input-contract punctuation, numbers, names,
/// or placeholders. Treating the shell as untranslated prose would hide the
/// actual work: dynamic phrases are translated at their insertion points.
const Set<String> structuralTranslationKeys = {
  '{attacker} {attack} {target}!',
  '{first} {last}',
  '{first} {middle} {last}',
  '{key} - {category}:',
  '{lead} {action}.',
  '{lead} {activity}',
  '{name} {escape}',
  '{name1} {versus} {name2}',
  '{subject} {action}.',
  '{subject} {action}...',
  'Enter - {exit}',
  'Enter - {exitText}',
  '3 - Hospital ({hospital})',
  '{first} {middleInitial}. {last}',
  ' ({price})',
  'CEO',
  'Cuba',
  'DNA',
  'DEO VINDICE',
  'KINKY WINKY',
};
