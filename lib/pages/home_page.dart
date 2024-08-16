import 'package:e_mekdep_school_maps/cubits/cubit_map/map_cubit.dart';
import 'package:e_mekdep_school_maps/pages/course_center_page.dart';
import 'package:e_mekdep_school_maps/pages/map_page.dart';
import 'package:e_mekdep_school_maps/pages/schools_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // Just empty column

  late TabController _tabController;
  int _bottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_bottomNavIndex == 1) {
        context.read<MapCubit>().updateMarkers(index: _tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'E-Mekdep',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              _buildTab(Icons.account_balance, "Orta mekdepler"),
              _buildTab(Icons.book, "Kurs Merkezleri"),
            ],
          ),
          Expanded
            child: IndexedStack(
              index: _bottomNavIndex,
              children: [
                TabBarView(
                  controller: _tabController,
                  children: const [
                    SchoolsPage(),
                    CourseCenterPage(),
                  ],
                ),
                const SchoolMapPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            if (index == 1) {
              context.read<MapCubit>().updateMarkers(index: _tabController.index);
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Okuwlar",
            tooltip: "Okuwlar",
            activeIcon: Icon(Icons.school),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work),
            label: "Karta",
            tooltip: "Karta",
            activeIcon: Icon(Icons.maps_home_work),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(IconData icon, String text) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 8.0),
          Text(text),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Just empty column
}
