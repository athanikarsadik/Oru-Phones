import 'dart:convert';
import 'package:get/get.dart';
import '../Models/ListingModel.dart';
import 'Api.dart';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var isAddLoading = false.obs;
  var itemList = List<ListingItem>.empty(growable: true).obs;
  int currentPage = 1;

  @override
  void onInit() {
    fetchItem(currentPage);
    super.onInit();
  }

void fetchItem(int page) async {
  try {
    isLoading(true);
    if (page == 1) {
      itemList.clear();
    }
    Api api = Api();
    var response = await api.getListings(page);
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      List<dynamic> listings = decodedData["listings"];
      itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
      currentPage = page; 
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    isLoading(false);
  }
}

  void loadMoreItems() async {
    if (isAddLoading.value || currentPage == 0) {
      return;
    }
    isAddLoading(true);
    try {
      int nextPage = currentPage + 1;
      Api api = Api();
      var response = await api.getListings(nextPage);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        List<dynamic> listings = decodedData["listings"];
        itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
        currentPage = nextPage; 
      }
    } finally {
      isAddLoading(false);
    }
  }
}
