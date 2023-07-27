import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../Controllers/Api.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(135, 115, 48, 153),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(children: [
            Icon(
              Icons.sort_rounded,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "ORU Phones",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            Spacer(),
            Text(
              "India",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)),
            ),
            Icon(
              Icons.location_on,
              color: Color(0xFF4C53A5),
              size: 32,
            ),
            SizedBox(
              width: 10,
            ),
            badges.Badge(
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent:
                  Icon(Icons.notifications, color: Colors.white, size: 30),
              badgeAnimation: badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
            )
          ]),
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomeSearchDelegate(),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomeSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple Iphone 14",
    "Samsung Galaxy m6",
    "MI note 12 pro",
    "realme"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear,color:Colors.black),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back,color:Colors.black),
        onPressed: () {
          close(context, null);
        });
  }

 @override
Widget buildResults(BuildContext context) {
  List<String> matchQuery = [];
  for (var phone in searchTerms) {
    if (phone.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(phone);
    }
  }
  // Call the search API here
  Api api = Api();
  var response = api.searchModel(query);

  return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
  );
}

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var phone in searchTerms) {
      if (phone.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(phone);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

}
