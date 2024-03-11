class UserDetailsModalWithToken {
  String? token;
  String? fname;
  String? lname;
  String? email;
  String? profilePic;

  UserDetailsModalWithToken({this.token, this.fname, this.lname, this.email, this.profilePic});

  UserDetailsModalWithToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    fname = json['details']['fname'];
    lname = json['details']['lname'];
    email = json['details']['email'];
    profilePic = json['details']['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['fname'] = fname;
    data['lname'] = lname;
    data['email'] = email;
    data['profilePic'] = profilePic;
    return data;
  }
}
