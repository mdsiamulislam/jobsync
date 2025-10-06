import 'package:flutter/material.dart';
import 'package:jobsync/features/home/screens/home_screen.dart';
import 'package:jobsync/features/profile/screens/profile_screen.dart';
import 'package:jobsync/features/saved_job/screens/saved_jobs_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Job Sync',
    'Saved Jobs',
    'Profile',
  ];

  final List<Widget> _widgetList = const [
    HomeScreen(),
    SavedJobs(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetList[_selectedIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shadowColor: Colors.black12,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _onItemTapped(0),
                icon: Icon(
                  _selectedIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
                  size: 28,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () => _onItemTapped(1),
                icon: Icon(
                  _selectedIndex == 1 ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                  size: 28,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () => _onItemTapped(2),
                icon: Icon(
                  _selectedIndex == 2 ? Icons.person_rounded : Icons.person_outline_rounded,
                  size: 28,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
