import 'dart:convert';

import 'package:get/get.dart';

import '../Models/ListingModel.dart';
import 'Api.dart';

class ItemController extends GetxController {
  var isLoading = true.obs;
  var isAddLoading = false.obs;
  var itemList = List<ListingItem>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchItem(1);
    super.onInit();
  }

  void fetchItem(int start) async {
    try {
      isLoading(true);
      itemList.clear();
      Api api = Api();
      var response = await api.getListings(start);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        List<dynamic> listings = decodedData["listings"];
        itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(int page) async {
    try {
      isAddLoading(true);
      // itemList.clear();
      Api api = Api();
      var response = await api.getListings(page);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        List<dynamic> listings = decodedData["listings"];
        itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
      }
    } finally {
      isAddLoading(false);
    }
  }
}
