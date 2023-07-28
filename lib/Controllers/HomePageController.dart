import 'dart:convert';
import 'package:get/get.dart';
import 'Api.dart';

class HomePageController extends GetxController {
  var topBrands = <String>[].obs;
  var conditions = <String>[].obs;
  var storageOptions = <String>[].obs;
  var ramOptions = <String>[].obs;
  var searchResults = <String>[].obs;
  var selectedRamIndex = 0.obs;
  var selectedStorageIndex= 0.obs;
  var selectedBrandIndex= 0.obs;
  var selectedConditionIndex= 0.obs;

  Future<void> fetchFilters() async {
    try {
      Api api = Api();
      final response = await api.getFilters(); // Call the getFilters() API
      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final decodedData = json.decode(response.body);

        // Correct the key names based on the API response
        topBrands.addAll(List<String>.from(decodedData['filters']['make']));
        conditions.addAll(List<String>.from(decodedData['filters']['condition']));
        storageOptions.addAll(List<String>.from(decodedData['filters']['storage']));
        ramOptions.addAll(List<String>.from(decodedData['filters']['ram']));

        // Add more lists for other filters as needed
        topBrands.insert(0, 'All');
        conditions.insert(0, 'All');
        storageOptions.insert(0, 'All');
        ramOptions.insert(0, 'All');
      } else {
        // Request failed, handle the error here
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during the request
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFilters();
  }

  void setSelectedBrand(int i) {
    selectedBrandIndex.value = i;
  }

  void setSelectedStorage(int i) {
    selectedStorageIndex.value = i;
  }

  void setSelectedCondition(int i) {
    selectedConditionIndex.value = i;
  }

  void setSelectedRam(int i) {
    selectedRamIndex.value = i;
  }
}
