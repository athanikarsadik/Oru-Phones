import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingGrid extends StatelessWidget {
  final int itemCount;

  const ShimmerLoadingGrid({Key? key, this.itemCount = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Show shimmer items horizontally
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          height: 180,
          width : Get.width * 0.5,
          padding: EdgeInsets.all(10),
          child: ShimmerLoading(borderRadius: BorderRadius.circular(20)),
        );
        
      },
    );
  }
}


class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Duration duration;

  const ShimmerLoading({
    Key? key,
    this.width = 200,
    this.height = 16,
    this.padding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.duration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: duration,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
