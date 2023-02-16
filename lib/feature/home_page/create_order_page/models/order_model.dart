class SendOrderModel {
  SendOrderModel({
    required this.cityFrom,
    required this.cityTo,
    required this.price,
    required this.date,
    required this.type,
    required this.addressTo,
    required this.addressFrom,
    required this.note,
  });
  late final String cityFrom;
  late final String note;
  late final String cityTo;
  late final int price;
  late final String date;
  late final String type;
  late final String addressTo;
  late final String addressFrom;

  SendOrderModel.fromJson(Map<String, dynamic> json) {
    cityFrom = json['city_from'];
    cityTo = json['city_to'];
    price = json['price'];
    date = json['date'];
    type = json['type'];
    addressTo = json['address_to'];
    addressFrom = json['address_from'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city_from'] = cityFrom;
    _data['city_to'] = cityTo;
    _data['price'] = price;
    _data['date'] = date;
    _data['type'] = type;
    _data['address_to'] = addressTo;
    _data['address_from'] = addressFrom;
    _data['note'] = note;
    return _data;
  }
}
