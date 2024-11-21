import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


@immutable
abstract class MapsState {}

final class MapsInitial extends MapsState {}


class MapsInitialState extends MapsState {}

class MapsLocationChangedState extends MapsState {
  final CameraPosition cameraPosition;

  MapsLocationChangedState(this.cameraPosition);
}

class MapsTypeChangedState extends MapsState {
  final MapType mapType;

  MapsTypeChangedState(this.mapType);
}
class MapsMarkersUpdatedState extends MapsState {
  final Set<Marker> markers;

  MapsMarkersUpdatedState(this.markers);
}
class MapsStyleUpdatedState extends MapsState{}