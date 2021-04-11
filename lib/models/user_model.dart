import 'dart:io';

class UserModel {
  String uid;
  String username;
  String displayName;
  String email;
  String photoUrl;
  File image;

  UserModel({
    this.uid,
    this.displayName,
    this.username,
    this.email,
    this.photoUrl,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    this.uid = json['uid'];
    this.displayName = json['displayName'];
    this.username = json['username'];
    this.email = json['email'];
    this.photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['displayName'] = this.displayName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    return data;
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, displayName: $displayName, username: $username, email: $email, photoUrl: $photoUrl}';
  }
}
