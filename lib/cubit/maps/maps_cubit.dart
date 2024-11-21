import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grduation_proj/cubit/maps/maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit() : super(MapsInitialState());

  GoogleMapController? googleMapController;
  MapType currentMapType = MapType.normal;
  String? mapStyle;

  // جعل مجموعة العلامات قابلة للتعديل
  Set<Marker> myMarker = {
    const Marker(
      markerId: MarkerId("L1"),
      position: LatLng(30.585474045422643, 31.48402639743716),
      infoWindow: InfoWindow(
        title: "مبنى الرياضيات",
        snippet: "Faculty of Science",
      ),
    ),
    Marker(
      markerId: const MarkerId("L3"),
      position: const LatLng(30.58511383515811, 31.484447504212778),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: "مبنى اساسي",
        snippet: "Faculty of Science",
      ),
    ),
    const Marker(
      markerId: MarkerId("L4"),
      position: LatLng(30.58581836557683, 31.48472530670777),
      infoWindow: InfoWindow(
        title: "مبنى المعامل",
        snippet: "Faculty of Science",
      ),
    ),
    const Marker(
      markerId: MarkerId("L5"),
      position: LatLng(30.586258880353103, 31.484180165545787),
      infoWindow: InfoWindow(
        title: "مبنى شلبي",
        snippet: "Faculty of Science",
      ),
    ),
    const Marker(
      markerId: MarkerId("L6"),
      position: LatLng(30.585640581291067, 31.485147986522882),
      infoWindow: InfoWindow(
        title: "مبنى الادارة",
        snippet: "Faculty of Science",
      ),
    ),
  };

  void setController(GoogleMapController controller) {
    googleMapController = controller;
    _loadMapStyle(); 
  }

  Future<void> _loadMapStyle() async {
    try {
      mapStyle = await rootBundle.loadString('assets/map_style.json');
      emit(MapsStyleUpdatedState());
    } catch (e) {
      print("Error loading map style: $e");
    }
  }

  // تغيير نوع الخريطة
  void changeMapType() {
    currentMapType = currentMapType == MapType.normal
        ? MapType.satellite
        : MapType.normal;
    emit(MapsTypeChangedState(currentMapType));
  }

  // الحصول على الموقع الحالي وتحديث الكاميرا
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14,
    );

    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );

    // إضافة العلامة الجديدة لموقع المستخدم الحالي
    myMarker.add(
      Marker(
        markerId: const MarkerId("L20"),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(
          title: "My Current Location",
        ),
      ),
    );

    // تحديث حالة العلامات
    emit(MapsMarkersUpdatedState(myMarker));

    // إرسال حالة عند تغيير الموقع
    emit(MapsLocationChangedState(cameraPosition));
  }
  
}
