class ConflictException implements Exception {
  final String message;
  ConflictException(this.message);
}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
