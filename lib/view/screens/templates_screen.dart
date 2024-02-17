import 'package:flutter/material.dart';
import 'package:TOIO/config/icons_broken.dart';
import 'package:TOIO/view/widgets/templates/done_tasks.dart';
import '../widgets/templates/all_tasks.dart';
import '../widgets/templates/fav_tasks.dart';

class TemplatesScreen extends StatefulWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  final List screens = [const AllTasks(), const FavTasks(), const DoneTasks()];

  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_selectedScreenIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
            onTap: _selectScreen,
            currentIndex: _selectedScreenIndex,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(IconBroken.Chart),
                label: 'tasks',

              ),
              BottomNavigationBarItem(icon: Icon(IconBroken.Heart), label: 'fav'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Shield_Done), label: 'done'),
            ]),
      ),
    );
  }
}
