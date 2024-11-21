import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grduation_proj/cubit/maps/maps_cubit.dart';
import 'package:grduation_proj/cubit/maps/maps_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map page'),
        
      ),
      body: BlocBuilder<MapsCubit, MapsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MapsCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(30.58542369400568, 31.484342656731837),
                      tilt: 50,
                      bearing: 20,
                      // zoom: 18.5,
                      zoom: 17.3.sp),
                  mapType: context.watch<MapsCubit>().currentMapType,
                  onMapCreated: (GoogleMapController controller) {
                    cubit.setController(controller);
                  },
                  markers: context.watch<MapsCubit>().myMarker,
                  style: context.watch<MapsCubit>().mapStyle,
                ),
                Positioned(
                  bottom: 13.h,
                  right: 2.5.w,
                  child: SizedBox(
                    height: 6.h,
                    width: 12.w,
                    child: FloatingActionButton(
                      onPressed: () {
                        cubit.getCurrentLocation();
                      },
                      child: Icon(
                        Icons.my_location_outlined,
                        color: Colors.red,
                        size: 0.4.dp,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6.h,
                  left: 2.w,
                  child: Visibility(
                    visible: cubit.currentMapType == MapType.satellite,
                    replacement: IconButton(
                      icon: Icon(
                        Icons.satellite,
                        size: 0.4.dp,
                        color: const Color.fromARGB(255, 117, 142, 175),
                      ),
                      onPressed: () {
                        cubit.changeMapType();
                      },
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.map,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        cubit.changeMapType();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
