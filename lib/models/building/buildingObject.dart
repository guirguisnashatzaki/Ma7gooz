import 'floorObject.dart';

class Building{
  String imageUrl;
  String name;
  int noOfFloors;
  int noOfHalls;
  List<Floor> floors;


  Building({required this.name,required this.imageUrl,required this.noOfFloors,required this.noOfHalls,required this.floors});
}