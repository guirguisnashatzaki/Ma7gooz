class Order {
  int? id;
  String? servantName;
  String? activity;
  String? serviceName;
  String? date;
  String? timeAccepted;
  String? buildingAccepted;
  String? floorAccepted;
  String? hallAccepted;
  List<String>? times;
  List<String>? buildings;


  Order(
      {this.id,
        this.servantName,
        this.activity,
        this.serviceName,
        this.date,
        this.timeAccepted,
        this.buildingAccepted,
        this.floorAccepted,
        this.hallAccepted,
        this.buildings,
        this.times
      });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servantName = json['servantName'];
    activity = json['activity'];
    serviceName = json['serviceName'];
    date = json['date'];
    timeAccepted = json['timeAccepted'];
    buildingAccepted = json['buildingAccepted'];
    floorAccepted = json['floorAccepted'];
    hallAccepted = json['hallAccepted'];
    buildings = json['buildings'];
    times = json['times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['servantName'] = servantName;
    data['activity'] = activity;
    data['serviceName'] = serviceName;
    data['date'] = date;
    data['timeAccepted'] = timeAccepted;
    data['buildingAccepted'] = buildingAccepted;
    data['floorAccepted'] = floorAccepted;
    data['hallAccepted'] = hallAccepted;
    data['buildings'] = buildings;
    data['times'] = times;
    return data;
  }
}