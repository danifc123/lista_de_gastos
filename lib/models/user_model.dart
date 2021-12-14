class User {
  String mail;
  String password;
  bool keepOn;

  User({required this.mail, required this.password, required this.keepOn});

  User.fromJson(Map<String, dynamic> json) {
    mail = json['mail'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }

  String toString(){
    return "\nE-mail: " + this.mail + "\nPassword: " + this.password;
  }

}