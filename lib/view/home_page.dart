import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grduation_proj/shared/enum.dart';
import 'package:grduation_proj/shared/cache_helper.dart';
import 'package:grduation_proj/cubit/auth/auth_cubit.dart';
import 'package:grduation_proj/view/map_page.dart';
import 'package:grduation_proj/view/user_profile_page.dart';
import 'package:grduation_proj/view/login_page.dart';
import 'package:grduation_proj/view/search_page.dart';
import 'package:grduation_proj/cubit/search/search_cubit.dart';
import 'package:grduation_proj/view/buildings/building_model.dart';
import 'package:grduation_proj/view/buildings/building_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()),
                      (route) => true);
                },
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return UserAccountsDrawerHeader(
                      accountEmail: Text(
                          '${AuthCubit.get(context).userModel.email ?? CacheHelper.getString(key: SharedKey.email)}',
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15)),
                      accountName: Text(
                          '${AuthCubit.get(context).userModel.name ?? CacheHelper.getString(key: SharedKey.accountName)}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      currentAccountPicture: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            '${AuthCubit.get(context).userModel.pic ?? CacheHelper.getString(key: SharedKey.userProfileImage)}'),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'My Account',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(Iconsax.personalcard, color: Colors.black),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()),
                      (route) => true);
                },
              ),
              ListTile(
                title: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const Icon(
                  Iconsax.logout,
                  color: Colors.black,
                ),
                onTap: () {
                  CacheHelper.remove();
                  CacheHelper.putBool(key: SharedKey.isLoged, value: false);
                  CacheHelper.putBool(key: SharedKey.isSigned, value: true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
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
                    MaterialPageRoute(builder: (context) => const MapPage()));
              },
              icon: const Icon(Iconsax.map_1),
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
        ),
      ),
    );
  }
}
