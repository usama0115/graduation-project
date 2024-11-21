// ignore_for_file: public_member_api_docs, sort_constructors_first
class Building {
  String name;
  int noOfFloors;
  List <String> floorPic;
  Building({
    required this.name,
    required this.noOfFloors,
    required this.floorPic,
  });
}
Building? building;

List <Building> buildings = [
  Building(name: 'مبنى اساسي', noOfFloors: 4, floorPic: ['assets/f1.png', 'assets/f2.png', 'assets/f3.png', 'assets/f4.png']),
  Building(name: 'مبنى شلبي', noOfFloors: 4, floorPic: ['assets/f1.png', 'assets/f2.png', 'assets/f3.png', 'assets/f4.png']),
  Building(name: 'مبنى المعامل', noOfFloors: 4, floorPic: ['assets/f1.png', 'assets/f2.png', 'assets/f3.png', 'assets/f4.png']),
  Building(name: 'مبنى رياضيات', noOfFloors: 4, floorPic: ['assets/f1.png', 'assets/f2.png', 'assets/f3.png', 'assets/f4.png']),
  Building(name: 'مبنى الادارة', noOfFloors: 4, floorPic: ['assets/f1.png', 'assets/f2.png', 'assets/f3.png', 'assets/f4.png']),
];
