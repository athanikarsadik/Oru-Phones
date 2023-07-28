import 'package:http/http.dart' as http; 

class Api {
 Future<http.Response> getListings(int page) async {
    var url = 'https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=$page&limit=10';

    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

Future<http.Response> getFilters() async {
  String url = 'https://dev2be.oruphones.com/api/v1/global/assignment/getFilters?isLimited=true';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Error: ${response.statusCode}'); 
    }
  } catch (e) {
      throw Exception('Error: $e'); 
  }
}

}