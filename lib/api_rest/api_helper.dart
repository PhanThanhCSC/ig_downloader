import 'package:http/http.dart' as http;
const baseUrl = 'http://psr-api.sotavn.com/';
const baseNailUrl = 'http://nail-api.sotavn.com/';

class AppApiHelper {
  final http.Client httpClient;

  AppApiHelper({required this.httpClient});
}
