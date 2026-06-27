class OrderIdAvailabilityResponseModel {
  final bool available;
  final String message;

  OrderIdAvailabilityResponseModel({
    required this.available,
    required this.message,
  });

  factory OrderIdAvailabilityResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderIdAvailabilityResponseModel(
      available: json["available"] ?? false,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"available": available, "message": message};
  }
}
