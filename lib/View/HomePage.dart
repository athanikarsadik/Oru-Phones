import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/HomePageController.dart';
import '../Utils/BrandsWidget.dart';
import '../Utils/CustomBottomSheetWidget.dart';
import '../Utils/HomeAppBar.dart';
import '../Utils/ItemsWidget.dart';
import '../Utils/ShopBy.dart';

class HomePage extends StatelessWidget {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBar(),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 246, 246),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child:const Text(
                      "Buy Top Brands",
                      style: TextStyle(fontSize:21,fontWeight:FontWeight.bold,color: Color(0xFF4C53A5)),
                    )
                  ),
                  BrandsWidget(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,horizontal: 10
                    ),
                    child:const Text(
                      "Shop By",
                      style: TextStyle(fontSize:21,fontWeight:FontWeight.bold,color: Color(0xFF4C53A5)),
                    )
                  ),
                  ShopBy(),
                  //Items
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      children:[
                        Text("Best Deals Near You",style:TextStyle(
                          fontSize:25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)
                        )),
                        SizedBox(width: 4),
                        Text("India",style:TextStyle(
                          fontSize:25,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                          )
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.sort_by_alpha,size:30), onPressed: () { 
                          _showSortOptions(context);
                         },),
                      ]
                    ),
                  ),
                  
                  ItemsWidget(),
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
                BottomSheetWidget(text: "Brands",items: ['All','Apple','Google','Samsung','Realme']),
                BottomSheetWidget(text: "Ram",items: ['All','1 GB','2 GB','3 GB','4 GB']),
                BottomSheetWidget(text: "Storage",items: ['All','64 GB','128 GB','256 GB','512 GB']),
                BottomSheetWidget(text: "Conditions",items: ['All','Like new','Excellent','Good']),
                BottomSheetWidget(text: "Warranty",items: ['All','Brand Warrenty','Seller warrenty']),
                BottomSheetWidget(text: "Brands",items: ['All','Apple','Google','Samsung','Realme']),
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


