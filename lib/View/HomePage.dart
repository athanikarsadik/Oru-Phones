import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/HomePageController.dart';
import '../Controllers/ItemController.dart';
import '../Utils/BrandsWidget.dart';
import '../Utils/CustomBottomSheetWidget.dart';
import '../Utils/HomeAppBar.dart';
import '../Utils/ItemsWidget.dart';
import '../Utils/ShopBy.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final HomePageController controller = Get.put(HomePageController());
  final ItemController itemController = Get.put(ItemController());

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add the WidgetsBinding observer to listen for lifecycle events
    WidgetsBinding.instance?.addObserver(this);
    // Listen for scroll events
    scrollController.addListener(_listenToScroll);
  }

  @override
  void dispose() {
    // Clean up the WidgetsBinding observer
    WidgetsBinding.instance?.removeObserver(this);
    // Clean up the scroll controller
    scrollController.removeListener(_listenToScroll);
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: HomeAppBar()),
          SliverPadding(
            padding: const EdgeInsets.only(top: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Buy Top Brands",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),
                  BrandsWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: const Text(
                      "Shop By",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),
                  ShopBy(),
                  //Items
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text("Best Deals Near You",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5))),
                        SizedBox(width: 4),
                        Text("India",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent)),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.sort_by_alpha, size: 30),
                          onPressed: () {
                            _showSortOptions(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx( () =>
             SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.58,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildItem(context, index);
                  },
                  childCount: itemController.isAddLoading.value
                      ? itemController.itemList.length + 1
                      : itemController.itemList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
 
  void _listenToScroll() {
    if (scrollController.position.extentAfter == 0) {
      itemController.loadMoreItems();
    }
  }
  
  Widget _buildItem(BuildContext context, int index) {
    final itemController = Get.find<ItemController>();
    if (index < itemController.itemList.length) {
      var item = itemController.itemList[index];
      return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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
      itemController.loadMoreItems(); // Fetch more items when reaching the end
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      );
    }
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.pink[50],
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Filters and Clear Filter row
                Row(
                  children: [
                    Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Add code to clear filters here
                      },
                      child: Text(
                        "Clear Filters",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Brands and MultiSelectListView
                BottomSheetWidget(
                    text: "Brands",
                    items: ['All', 'Apple', 'Google', 'Samsung', 'Realme']),
                BottomSheetWidget(
                    text: "Ram",
                    items: ['All', '1 GB', '2 GB', '3 GB', '4 GB']),
                BottomSheetWidget(
                    text: "Storage",
                    items: ['All', '64 GB', '128 GB', '256 GB', '512 GB']),
                BottomSheetWidget(
                    text: "Conditions",
                    items: ['All', 'Like new', 'Excellent', 'Good']),
                BottomSheetWidget(
                    text: "Warranty",
                    items: ['All', 'Brand Warrenty', 'Seller warrenty']),
                BottomSheetWidget(
                    text: "Brands",
                    items: ['All', 'Apple', 'Google', 'Samsung', 'Realme']),
                SizedBox(height: 16),
                // Submit button
                ElevatedButton(
                  onPressed: () {
                    // Add code to handle the submit button action here
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
