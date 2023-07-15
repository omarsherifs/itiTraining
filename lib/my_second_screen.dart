import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_sheet_pages/main_screen.dart';
import 'package:flutter_application_1/bottom_sheet_pages/profile_screen.dart';
import 'package:flutter_application_1/bottom_sheet_pages/settings_screen.dart';

class SecondPage extends StatefulWidget {
  final String email;
  const SecondPage({
    super.key,
    required this.email,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedIndex = 0;
  List<Widget> page = [
    MainScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: page[selectedIndex],
      //  Column(
      //   children: [
      //     Text(widget.email),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
        ],
        onTap: (pageIndex) {
          selectedIndex = pageIndex;
          setState(() {});
        },
      ),
    );
  }
}
