class UserModel {
  String? uid;
  String? email;
  String? fullName;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
    };
  }
}
