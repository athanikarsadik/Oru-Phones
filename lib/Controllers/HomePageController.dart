import 'package:get/get.dart';

class HomePageController extends GetxController {
  var topBrands = <String>[].obs;
  var shopItems = <String>[].obs;
  var infiniteData = <String>[].obs;

  Future<void> fetchDataFromApi() async {
    await Future.delayed(Duration(seconds: 2));

    topBrands.value = ['Apple', 'Vivo', 'Mi', 'Samsung'];
    shopItems.value = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    infiniteData.value = List.generate(20, (index) => 'Item $index');
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }
}
