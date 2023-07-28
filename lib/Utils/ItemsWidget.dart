import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ItemController.dart';

class ItemsWidget extends StatelessWidget {
  final ItemController _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_itemController.isLoading.value && _itemController.itemList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            _itemController.fetchItem(1); // Refresh the entire list of items
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _itemController.isAddLoading.value
                ? _itemController.itemList.length + 1
                : _itemController.itemList.length,
            itemBuilder: (context, index) {
              if (index < _itemController.itemList.length) {
                var item = _itemController.itemList[index];
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border_rounded),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.network(
                            item.image, // Use the image URL from the ListingItem
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "₹${item.listingNumPrice}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.marketingName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.deviceStorage,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Condition: ${item.deviceCondition}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            item.listingState,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          Text(
                            item.listingDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              
              } else {
                print("loading.....");
                _itemController.loadMoreItems(); // Fetch more items when reaching the end
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      }
    });
  }
}
