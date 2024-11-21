// search_state.dart
import 'package:grduation_proj/view/buildings/building_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Building> filteredBuildings;

  SearchLoaded(this.filteredBuildings);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
