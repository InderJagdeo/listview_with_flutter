enum Method { get, post, delete }

extension MethodExtension on Method {
  String get rawValue {
    switch (this) {
      case Method.get:
        return 'GET';
      case Method.post:
        return 'POST';
      case Method.delete:
        return 'DELETE';
    }
  }
}
