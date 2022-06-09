class SimpleAcademy {

  String name;
  dynamic members;
  dynamic reserve;
  dynamic settings;
  dynamic searchlist;

  SimpleAcademy(this.name, this.members, this.reserve, this.settings, this.searchlist);

  Map<String, dynamic> toJson () => {
    'Name' : name,
    'Members' : members,
    'Reserve' : reserve,
    'Settings' : settings,
    'SearchList' : searchlist,
  };

  SimpleAcademy.fromJson(Map<String, dynamic> json)
    : name = json['Name'],
      members = json['Members'],
      reserve = json['Reserve'],
      settings = json['Settings'],
      searchlist = json['SearchList'];
}