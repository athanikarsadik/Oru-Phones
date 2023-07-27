import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: Get.width * 0.25,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  color: Colors.amber[200],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mobile_friendly_rounded,
                        size: 50, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Bestselling Phones",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.white), maxLines: 2),
                    ),
                  ]),
            ),
            Container(
              height: 120,
              width: Get.width*0.25,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(15)

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified,size: 50,color:Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Verified User only",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500,color:Colors.white),maxLines: 2),
                  ),
              ]),
            ),Container(
              height: 120,
              width: Get.width*0.25,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(15)

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mobile_friendly_outlined,size: 50,color:Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Like new condition",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500,color:Colors.white),maxLines: 2),
                  ),
              ]),
            ),Container(
              height: 120,
              width: Get.width*0.25,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(15)

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user_sharp,size: 50,color:Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Phone with warrenty",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500,color:Colors.white),maxLines: 2),
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
