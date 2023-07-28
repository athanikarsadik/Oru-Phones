class ListingItem {
  String deviceCondition;
  String deviceStorage;
  String marketingName;
  String listingDate;
  int listingNumPrice;
  String listingState;
  String image;

  ListingItem({
    required this.deviceCondition,
    required this.deviceStorage,
    required this.marketingName,
    required this.listingDate,
    required this.listingNumPrice,
    required this.listingState,
    required this.image,
  });

  factory ListingItem.fromJson(Map<String, dynamic> json) {
    return ListingItem(
      deviceCondition: json["deviceCondition"],
      deviceStorage: json["deviceStorage"],
      image: json["images"][0]["fullImage"],
      marketingName: json["marketingName"],
      listingDate: json["listingDate"],
      listingNumPrice: json["listingNumPrice"],
      listingState: json["listingState"],
    );
  }
}
