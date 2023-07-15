import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(userEmail),
    );
  }

  getUserEmail() async {
    userEmail = await getEmail();
    setState(() {});
  }
}
