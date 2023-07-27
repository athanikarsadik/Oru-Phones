import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ItemController.dart';

class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final ItemController _itemController = Get.find<ItemController>();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _itemController.fetchItem(1); 
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isLoadingMore = false;

  void _scrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0 &&
        !_isLoadingMore) {
      // Scroll is at the bottom, fetch more data
      _isLoadingMore = true;
      _currentPage++;
    _itemController.addItem(_currentPage);      _isLoadingMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (_itemController.isLoading.value && _itemController.itemList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              _itemController.fetchItem(1); // Refresh the entire list of items
            },
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              physics: NeverScrollableScrollPhysics(), 
              itemCount: _itemController.itemList.length + 1,
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
                      return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }));
        }
      }),
    );
  }
}
