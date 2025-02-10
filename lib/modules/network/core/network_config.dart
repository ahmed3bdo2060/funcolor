class NetworkConfig {
  static const String baseUrl = 'YOUR_BASE_URL';
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
