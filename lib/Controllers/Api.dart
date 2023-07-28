import 'package:http/http.dart' as http; // Import the http package

class Api {
  // For GET: https://dev2be.oruphones.com/api/v1/global/assignment/getListings
 Future<http.Response> getListings(int page) async {
    var url = 'https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=$page&limit=10';

    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      // Error occurred during the request
      throw Exception('Error: $e');
    }
  }

// For GET: https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true
Future<void> getFilters() async {
  String url = 'https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Request successful, handle the response data here
      print(response.body);
    } else {
      // Request failed, handle the error here
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Error occurred during the request
    print('Error: $e');
  }
}

// For POST: https://dev2be.oruphones.com/api/v1/global/assignment/searchModel
// Payload: { "searchModel": "Apple iPhone 12" }
Future<List> searchModel(String query) async {
  String url = 'https://dev2be.oruphones.com/api/v1/global/assignment/searchModel';
  String body = '{"searchModel": "$query"}'; // JSON payload as a string

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, // Set the request headers
      body: body,
    );

    if (response.statusCode == 200) {
      // Request successful, handle the response data here
      print(response.body);
      return response as List;
    } else {
      // Request failed, throw an exception with the error message
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Error occurred during the request
    print('Error: $e');
    throw Exception('Error: $e');
  }
}

}