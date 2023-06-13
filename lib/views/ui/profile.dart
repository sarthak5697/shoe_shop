import 'package:flutter/material.dart';
import 'package:flutter_shop/views/shared/app_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("This is the ProfilePage",style: appstyle(40,Colors.black,FontWeight.bold),),
      ),
    );
  }
}