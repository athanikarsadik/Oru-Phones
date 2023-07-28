import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/HomePageController.dart';
import '../Controllers/ItemController.dart';
import '../Utils/BrandsWidget.dart';
import '../Utils/CustomBottomSheetWidget.dart';
import '../Utils/HomeAppBar.dart';
import '../Utils/ShimmerLoading.dart';
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
    WidgetsBinding.instance.addObserver(this);
    scrollController.addListener(_listenToScroll);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
                        const Text("Best Deals Near You",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5))),
                        const SizedBox(width: 4),
                        const Text("India",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent)),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.sort_by_alpha, size: 30),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    if (itemController.itemList.isEmpty) {
        return ShimmerLoadingGrid(itemCount: 2);
      }else{
      if (index < itemController.itemList.length) {
        var item = itemController.itemList[index];
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_border_rounded),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    item.image, // Use the image URL from the ListingItem
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  "₹${item.listingNumPrice}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.marketingName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.deviceStorage,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Condition: ${item.deviceCondition}",
                  style: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    item.listingDate,
                    style: const TextStyle(
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
        return ShimmerLoadingGrid(itemCount: 2);
      }

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
                    const Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Add code to clear filters here
                      },
                      child: const Text(
                        "Clear Filters",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                // Submit button
                ElevatedButton(
                  onPressed: () {
                    // Add code to handle the submit button action here
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
