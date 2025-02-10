class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      statusCode: json['status_code'],
      data: json['data'] != null ? fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    final Map<String, dynamic> data = {
      'success': success,
      'message': message,
      'status_code': statusCode,
    };
    if (this.data != null) {
      data['data'] = toJson(this.data as T);
    }
    return data;
  }
}
