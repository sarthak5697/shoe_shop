import 'package:flutter/material.dart';
import 'package:flutter_shop/models/sneakersModel.dart';
import 'package:flutter_shop/services/helper.dart';
import 'package:flutter_shop/views/shared/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_shop/views/shared/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male, _female, _kids;
  // late Future<List<Sneakers>> _female;
  // late Future<List<Sneakers>> _kids;

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
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Athletics Shoes",
                      style: appstyleWithHt(
                          42,
                          const Color.fromARGB(255, 0, 0, 0),
                          FontWeight.bold,
                          1.5),
                    ),
                    Text(
                      "Collections",
                      style: appstyleWithHt(
                          42,
                          const Color.fromARGB(255, 0, 0, 0),
                          FontWeight.bold,
                          1.5),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.405,
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                  price: "\$  200",
                                  category: "Men Shoes",
                                  id: "1",
                                  name: "Adidas",
                                  image:
                                      "https://img.freepik.com/free-photo/pair-trainers_144627-3800.jpg?size=626&ext=jpg&ga=GA1.2.525198010.1685275747&semt=sph");
                            }),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Latest Shoes",
                                  style: appstyle(
                                      24, Colors.black, FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Show All",
                                      style: appstyle(
                                          22, Colors.black, FontWeight.w500),
                                    ),
                                    const Icon(Icons.arrow_right_sharp,
                                        size: 40)
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                              child: FutureBuilder<List<Sneakers>>(
                                  future: _male,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text("Error ${snapshot.error}");
                                    } else {
                                      final male = snapshot.data;
                                      return ListView.builder(
                                          itemCount: male!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final shoe = snapshot.data![index];
                                            return ProductCard(
                                                price: shoe.price,
                                                category: shoe.category,
                                                id: shoe.id,
                                                name: shoe.name,
                                                image: shoe.imageUrl[0]);
                                          });
                                    }
                                  }))
                        ],
                      ),
                    ]),
                    Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.405,
                        color: Colors.amber,
                      ),
                    ]),
                    Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.405,
                        color: Colors.amber,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
