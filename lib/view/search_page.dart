import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grduation_proj/cubit/search/search_cubit.dart';
import 'package:grduation_proj/cubit/search/search_state.dart';
import 'package:grduation_proj/view/buildings/building_page.dart';
import 'package:grduation_proj/widgets/no_result.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search Buildings...',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                BlocProvider.of<SearchCubit>(context).searchBuilding(query);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  final filteredBuildings = state.filteredBuildings;

                  if (filteredBuildings.isEmpty) {
                    return NoResultsScreen();
                  }

                  return ListView.builder(
                    itemCount: filteredBuildings.length,
                    itemBuilder: (context, index) {
                      final building = filteredBuildings[index];
                      return ListTile(
                        title: Text(building.name),
                        trailing: const Icon(Iconsax.arrow_circle_right4),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuildingPage(
                                building: building,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                }

                return const Center(child: Text('Search for buildings'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
