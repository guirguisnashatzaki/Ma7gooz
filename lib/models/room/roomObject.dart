class Room {
  int? id;
  String? name;
  String? building;
  int? capacity;
  bool? hasAirConditioner;
  bool? hasTv;

  Room(
      {this.id,
        this.name,
        this.building,
        this.capacity,
        this.hasAirConditioner,
        this.hasTv});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    building = json['building'];
    capacity = json['capacity'];
    hasAirConditioner = json['has_air_conditioner'];
    hasTv = json['has_tv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['building'] = building;
    data['capacity'] = capacity;
    data['has_air_conditioner'] = hasAirConditioner;
    data['has_tv'] = hasTv;
    return data;
  }
}