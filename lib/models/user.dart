class User {
    int id;
    String email;
    String first_name;
    String last_name;
    String avatar;

  User( this.id, this.email, this.first_name, this.last_name, this.avatar );

  static User fromJson(json) {
    User user = new User(
      json["id"],
      json["email"],
      json["first_name"],
      json["last_name"],
      json["avatar"],
    );
    return user;
  }

}