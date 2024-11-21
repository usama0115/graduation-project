import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grduation_proj/view/buildings/building_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<Building> allBuildings;

  SearchCubit(this.allBuildings) : super(SearchInitial());

  void searchBuilding(String query) {
    emit(SearchLoading());

    try {
      if (query.isEmpty) {
        emit(SearchLoaded(allBuildings)); // Show all buildings if search query is empty
      } else {
        final filteredBuildings = allBuildings.where((building) {
          return building.name.contains(query);
        }).toList();
        emit(SearchLoaded(filteredBuildings));
      }
    } catch (e) {
      emit(SearchError('Error occurred while searching: ${e.toString()}'));
    }
  }
}
