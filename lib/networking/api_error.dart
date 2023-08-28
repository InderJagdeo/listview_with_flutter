class APIError {
  String? error;
  dynamic responseBody;
  num? statusCode;

  APIError({
    this.error,
    this.responseBody,
    this.statusCode,
  });

  APIError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }
}
