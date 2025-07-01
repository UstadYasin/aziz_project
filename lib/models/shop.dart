class Shop {
  String id;
  String name;
  bool isRented;
  bool rentPaid;
  bool waterPaid;
  bool electricityPaid;
  double rentAmount;
  double waterAmount;
  double electricityAmount;

  Shop({
    required this.id,
    required this.name,
    required this.isRented,
    required this.rentPaid,
    required this.waterPaid,
    required this.electricityPaid,
    required this.rentAmount,
    required this.waterAmount,
    required this.electricityAmount,
  });

  factory Shop.fromMap(Map<String, dynamic> map, String id) {
    return Shop(
      id: id,
      name: map['name'] ?? '',
      isRented: map['isRented'] ?? false,
      rentPaid: map['rentPaid'] ?? false,
      waterPaid: map['waterPaid'] ?? false,
      electricityPaid: map['electricityPaid'] ?? false,
      rentAmount: (map['rentAmount'] ?? 0).toDouble(),
      waterAmount: (map['waterAmount'] ?? 0).toDouble(),
      electricityAmount: (map['electricityAmount'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isRented': isRented,
      'rentPaid': rentPaid,
      'waterPaid': waterPaid,
      'electricityPaid': electricityPaid,
      'rentAmount': rentAmount,
      'waterAmount': waterAmount,
      'electricityAmount': electricityAmount,
    };
  }
}