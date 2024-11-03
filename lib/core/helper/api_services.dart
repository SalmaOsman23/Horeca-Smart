import 'dart:convert';
import 'package:horeca_smart/core/network/end_points.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String? _accessToken;

  // Function to get the access token if it's null or expired
  static Future<void> _initializeAccessToken() async {
    _accessToken ??= await getAccessToken();
  }

  // Function to get access token
  static Future<String?> getAccessToken() async {
    final response = await http.post(
      Uri.parse(EndPoints.tokenURL),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ${base64Encode(utf8.encode("${EndPoints.clientId}:${EndPoints.clientSecret}"))}',
      },
      body: {
        'grant_type': 'client_credentials',
        'scope': EndPoints.scopes,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['access_token'];
    } else {
      print("Failed to retrieve access token: ${response.body}");
      return null;
    }
  }

  static Future<http.Response?> getAllProducts() async {
  await _initializeAccessToken();
  
  try {
    final response = await http.get(
      Uri.parse('${EndPoints.baseURL}/products?filter.term=<String>'),
      headers: {
        'Authorization': 'Bearer $_accessToken',
        'Accept': 'application/json',
      },
    );
    return response;
  } catch (e) {
    print('Error fetching products: $e');
    return null; // Return null in case of error
  }
}

  // Function to search for a product by keyword
  static Future<List<dynamic>?> getSpecificProducts(String query) async {
    await _initializeAccessToken();

    final response = await http.get(
      Uri.parse('${EndPoints.baseURL}/products?filter.term=$query'),
      headers: {
        'Authorization': 'Bearer $_accessToken',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      // Retry with a new token if expired
      _accessToken = await getAccessToken();
      return getSpecificProducts(query);
    } else {
      throw Exception('Failed to search products');
    }
  }
}
