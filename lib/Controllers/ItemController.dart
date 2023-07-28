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
        currentPage = page; // Update the current page
      }
    } finally {
      isLoading(false);
    }
  }

  void loadMoreItems() async {
    if (isAddLoading.value || currentPage == 0) {
      // If already loading more items or all items are loaded, return early
      return;
    }
    // Set isAddLoading to true to indicate that we are currently loading more items
    isAddLoading(true);
    try {
      int nextPage = currentPage + 1;
      Api api = Api();
      var response = await api.getListings(nextPage);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        List<dynamic> listings = decodedData["listings"];
        itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
        currentPage = nextPage; // Update the current page
      }
    } finally {
      // Set isAddLoading to false after loading more items is complete
      isAddLoading(false);
    }
  }
}




// import 'dart:convert';

// import 'package:get/get.dart';

// import '../Models/ListingModel.dart';
// import 'Api.dart';

// class ItemController extends GetxController {
//   var isLoading = true.obs;
//   var isAddLoading = false.obs;
//   var itemList = List<ListingItem>.empty(growable: true).obs;

//   @override
//   void onInit() {
//     fetchItem(1);
//     super.onInit();
//   }

//   void fetchItem(int start) async {
//     try {
//       isLoading(true);
//       itemList.clear();
//       Api api = Api();
//       var response = await api.getListings(start);
//       if (response.statusCode == 200) {
//         final decodedData = json.decode(response.body);
//         List<dynamic> listings = decodedData["listings"];
//         itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void addItem(int page) async {
//     try {
//       isAddLoading(true);
//       // itemList.clear();
//       Api api = Api();
//       var response = await api.getListings(page);
//       if (response.statusCode == 200) {
//         final decodedData = json.decode(response.body);
//         List<dynamic> listings = decodedData["listings"];
//         itemList.addAll(listings.map((item) => ListingItem.fromJson(item)));
//       }
//     } finally {
//       isAddLoading(false);
//     }
//   }
// }
