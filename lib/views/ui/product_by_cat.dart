import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/sneakersModel.dart';
import 'package:flutter_shop/services/helper.dart';
import 'package:flutter_shop/views/shared/app_style.dart';
import 'package:flutter_shop/views/shared/product_card.dart';
import 'package:flutter_shop/views/shared/stagger_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 16,
                right: 12,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  FutureBuilder<List<Sneakers>>(
                    future: _male,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error ${snapshot.error}");
                      } else {
                        final male = snapshot.data;
                        return StaggeredGridView.countBuilder(
                            padding: EdgeInsets.zero,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 16,
                            itemCount: male!.length,
                            scrollDirection: Axis.vertical,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.extent(
                                    (index % 2 == 0) ? 1 : 1,
                                    (index % 4 == 1 || index % 4 == 3)
                                        ? MediaQuery.of(context).size.height *
                                            0.35
                                        : MediaQuery.of(context).size.height *
                                            0.3),
                            itemBuilder: (context, index) {
                              final shoe = snapshot.data![index];
                              return StaggerTile(
                                  imageUrl: shoe.imageUrl[1],
                                  name: shoe.name,
                                  price: shoe.price);
                            });
                      }
                    },
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
                  Container(
                    color: Colors.green,
                    height: 500,
                    width: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
