// Provides private router path functions

const String separator = '/';
const String paramPrefix = ':';

final fnRootPath = ((param) {
  return '$separator$param';
});
final fParamPath = ((param) {
  return '$paramPrefix$param';
});
final fConcatPath = ((param1, param2) {
  return '$param1$separator$param2';
});
