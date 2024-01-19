

class UserLocationModel {
  String id;
  String name;
  String long;
  String lat;

  UserLocationModel(
      {required this.name, required this.long, required this.lat, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'long': long,
      'lat': lat
    };
  }

  factory UserLocationModel.fromMap(Map<String, dynamic> map, String id) {
    return UserLocationModel(
        id: id,
        name: map['name'],
        long: map['long'],
        lat: map['lat']);
  }

}


