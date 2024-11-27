
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grduation_proj/cubit/auth/auth_cubit.dart';
import 'package:grduation_proj/cubit/search/search_cubit.dart';
import 'package:grduation_proj/shared/cache_helper.dart';
import 'package:grduation_proj/shared/enum.dart';
import 'package:grduation_proj/view/buildings/building_model.dart';
import 'package:grduation_proj/view/buildings/building_page.dart';
import 'package:grduation_proj/view/map_page.dart';
import 'package:grduation_proj/view/search_page.dart';
import 'package:grduation_proj/view/user_profile_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()));
                },
                child: Container(
                  height: 7.2.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome   ${AuthCubit.get(context).userModel.name ?? CacheHelper.getString(key: SharedKey.accountName)}',
                        style: TextStyle(
                            fontSize: 16.6.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${AuthCubit.get(context).userModel.email ?? CacheHelper.getString(key: SharedKey.email)}',
                        style: TextStyle(
                            fontSize: 14.sp, color: Colors.indigo),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SearchCubit(buildings),
                        child: SearchPage(),
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: Icon(
                  Iconsax.search_normal_14,
                  color: Colors.black,
                  size: 0.4.dp,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Icon(
              //     Iconsax.support5,
              //     size: 0.24.dp,
              //     color: Colors.black,
              //   ),
              //   style: ButtonStyle(
              //     backgroundColor:
              //         WidgetStateProperty.all<Color>(Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MapPage()));
          },
          icon: Icon(Iconsax.map_1),
          iconSize: 0.5.dp,
        ),
        SizedBox(
          height: 1.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: buildings.length,
            itemBuilder: (context, index) {
              final building = buildings[index];
    
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  minTileHeight: 80,
                  tileColor: Colors.white,
                  title: Text(building.name),
                  trailing: const Icon(Iconsax.arrow_circle_right4),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BuildingPage(building: building)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
