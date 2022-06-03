class CustomUser {
  String email;
  String name;
  List<String> favorited;
  Map reserve;

  CustomUser(this.email, this.name, this.favorited, this.reserve);

  void addFavoritedList(String academy) {
    favorited.add(academy);
  }
}