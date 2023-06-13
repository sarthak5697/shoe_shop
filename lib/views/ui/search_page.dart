import 'package:flutter/material.dart';
import 'package:flutter_shop/views/shared/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("This is the SearchPage",style: appstyle(40,Colors.black,FontWeight.bold),),
      ),
    );
  }
}