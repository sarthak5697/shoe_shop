import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/views/shared/app_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/"),
                  //   fit:BoxFit.fill,
                  // ),

                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntIcons.closeOutlined,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            TabBar(
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.white,
                labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                unselectedLabelColor: Colors.grey.withOpacity(0.3),
                tabs: const [
                  Tab(
                    text: "Mens Shoes",
                  ),
                  Tab(
                    text: "Womens Shoes",
                  ),
                  Tab(
                    text: "Kids Shoes",
                  ),
                ]),
            TabBarView(
              children: [
                Container(
                  color: Colors.green,
                  height: 500,
                  width: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 500,
                  width: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 500,
                  width: 300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
