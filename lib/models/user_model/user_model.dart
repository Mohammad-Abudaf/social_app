class UserModel {
  String email;
  String userName;
  String uId;
  String phone;
  String firstName;
  String lastName;
  String password;

  UserModel({
    this.email,
    this.uId,
    this.phone,
    this.firstName,
    this.lastName,
    this.userName,
    this.password
  });

  UserModel.fromJson(Map <String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
    password = json['password'];
  }

  Map <String, dynamic> toMap(){
    return {
      'first_name' : firstName,
      'last_name' : lastName,
      'email' : email,
      'uId' : uId,
      'user_name': userName,
      'phone' : phone,
      'password' : password,
    };
  }
}
