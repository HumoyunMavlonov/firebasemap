

class UserLocationRequest {
  String? name;
  String? long;
  String? lat;

  UserLocationRequest({this.name, this.long, this.lat});

  Map<String, dynamic> toMap() {
    return {'name': name, 'long': long, 'lat': lat};
  }

  factory UserLocationRequest.fromMap(Map<String, dynamic> map) {
    return UserLocationRequest(
        name: map['name'],
        lat: map['lat'],
        long: map['long']
    );
  }
}

