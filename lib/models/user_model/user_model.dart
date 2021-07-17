class UserModel {
  String email;
  String userName;
  String uId;
  String phone;
  String image;
  String coverImage;
  String bio;
  bool isEmailVerified;

  UserModel({
    this.email,
    this.uId,
    this.phone,
    this.userName,
    this.image,
    this.coverImage,
    this.isEmailVerified,
    this.bio,
  });

  UserModel.fromJson(Map <String, dynamic> json){
    userName = json['user_name'];
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
    image = json['image'];
    bio = json['bio'];
    coverImage = json['cover_image'];
  }

  Map <String, dynamic> toMap(){
    return {
      'email' : email,
      'uId' : uId,
      'user_name': userName,
      'phone' : phone,
      'isEmailVerified': isEmailVerified,
      'image': image,
      'bio' : bio,
      'cover_image': coverImage,
    };
  }
}
