bool isUrl(String path) {
  return path.startsWith('http://') || path.startsWith('https://');
}

String normalizeUrl(String path, String baseUrl) {
  final decodedPath = Uri.decodeComponent(path); 
  return isUrl(decodedPath) ? decodedPath : '$baseUrl$decodedPath';
}
