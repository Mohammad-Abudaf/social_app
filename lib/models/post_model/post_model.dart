class PostModel {
  String userName;
  String userImage;
  String uId;
  String image;
  String text;
  String postImage;
  String dateTime;


  PostModel({
    this.uId,
    this.userName,
    this.image,
    this.text,
    this.dateTime,
    this.postImage,
    this.userImage,
  });

  PostModel.fromJson(Map <String, dynamic> json){
    userName = json['user_name'];
    uId = json['uId'];
    image = json['image'];
    postImage = json['post_image'];
    text = json['text'];
    dateTime = json['date_time'];
    userImage = json['user_image'];
  }

  Map <String, dynamic> toMap(){
    return {
      'uId': uId,
      'user_name': userName,
      'image': image,
      'post_image': postImage,
      'text': text,
      'date_time': dateTime,
      'user_image': userImage,
    };
  }
}
