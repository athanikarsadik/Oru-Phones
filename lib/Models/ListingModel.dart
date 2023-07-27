class ListingItem {
  String id;
  String deviceCondition;
  String listedBy;
  String deviceStorage;
  List<dynamic> images;
  String listingLocation;
  String make;
  String marketingName;
  String mobileNumber;
  String model;
  bool verified;
  String status;
  String listingDate;
  String deviceRam;
  String createdAt;
  String listingId;
  int listingNumPrice;
  String listingState;
  String image;

  ListingItem({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.listingLocation,
    required this.make,
    required this.marketingName,
    required this.mobileNumber,
    required this.model,
    required this.verified,
    required this.status,
    required this.listingDate,
    required this.deviceRam,
    required this.createdAt,
    required this.listingId,
    required this.listingNumPrice,
    required this.listingState,
    required this.image,
    // Add more named parameters for other fields in the API response
  });

  factory ListingItem.fromJson(Map<String, dynamic> json) {
    return ListingItem(
      id: json["_id"],
      deviceCondition: json["deviceCondition"],
      listedBy: json["listedBy"],
      deviceStorage: json["deviceStorage"],
      images: json["images"],
      image: json["images"][0]["fullImage"],
      listingLocation: json["listingLocation"],
      make: json["make"],
      marketingName: json["marketingName"],
      mobileNumber: json["mobileNumber"],
      model: json["model"],
      verified: json["verified"],
      status: json["status"],
      listingDate: json["listingDate"],
      deviceRam: json["deviceRam"],
      createdAt: json["createdAt"],
      listingId: json["listingId"],
      listingNumPrice: json["listingNumPrice"],
      listingState: json["listingState"],
      // Initialize the additional properties based on the API response
    );
  }
}
