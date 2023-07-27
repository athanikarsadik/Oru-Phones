import 'package:flutter/material.dart';

class BrandsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 5,
              color: Colors.white,
              child: Image.asset(
                "assets/images/Iphone.png",
                width: 60,
                height: 60
              )
            ),
              Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 5,
              color: Colors.white,
              child: Image.asset(
                "assets/images/vivo.png",
                width: 60,
                height: 60
              )
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 5,
              color: Colors.white,
              child: Image.asset(
                "assets/images/samsung.png",
                width: 60,
                height: 60
              )
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 5,
             color: Colors.white,
              child: Image.asset(
                "assets/images/mi.png",
                width: 60,
                height: 60
              )
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 8,
              color: Colors.white,
              child: Image.asset(
                "assets/images/one_plus.jpg",
                width: 70,
                height: 70
              )
            ),
          ],
        ),
      ),
    );
  }
  
}