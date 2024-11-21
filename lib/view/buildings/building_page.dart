import 'package:flutter/material.dart';
import 'package:grduation_proj/view/buildings/building_model.dart'; // Import the model

class BuildingPage extends StatelessWidget {
  final Building building;

  const BuildingPage({
    Key? key,
    required this.building,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(building.name), // Building name in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Floors: ${building.noOfFloors}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30,),
                itemCount: building.floorPic.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.asset(
                      building.floorPic[index],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
