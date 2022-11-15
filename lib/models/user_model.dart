class UserModel
{
  late String uId;
  late String email;
  late String id;
  late String area;
  late String name;
  late String school;
  late String phone;
  late String image;
  late String cover;
  late bool isEmailVerified;

  UserModel({
    required this.uId,
    required this.email,
    required this.id,
    required this.area,
    required this.school,
    required this.name,
    required this.phone,
    required this.image,
    required this.cover,
    required this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json)
  {
    uId = json['uId '];
    email = json['email'];
    id = json['id'];
    area = json['area'];
    school = json['school'];
    name = json['name'];
    phone = json['phone'];
    image = json['image '];
    cover = json['cover '];
    isEmailVerified = json['isEmailVerified '];
  }

  Map<String, dynamic> toMap ()
  {
    return {
      'uId' : uId,
      'id' : id,
      'area' : area,
      'school' : school,
      'email' : email,
      'name' : name,
      'phone' : phone,
      'image' : image,
      'cover' : cover,
      'isEmailVerified' : isEmailVerified,
    };
  }

}