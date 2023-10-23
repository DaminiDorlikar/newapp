import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/apiintegration/network.dart';
import 'package:newsapp/commonview/common_heigthconttent.dart';
import 'package:newsapp/constantcontent/constant_color.dart';
import 'package:newsapp/model/getcategory_model.dart';
import 'package:newsapp/model/getcategorybyid_model.dart';
import 'package:newsapp/view/details_screen.dart';
import 'package:newsapp/widget/drawer.dart';
import 'package:newsapp/widget/shimmer_loader.dart';
import 'package:newsapp/widget/imagecontanier.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoding = false;
  GetcategoryModel? getcategoryModel;
  GetcategoryByIdModel? getcategoryByIdModel;
  List<Datum>? dataCat;
  List<Data>? data;
  int selectedIndex = 0;
  bool catLoding = false;
  @override
  void initState() {
    super.initState();
    AuthAPi().getCategoryData().then((value) {
      setState(() {
        isLoding = true;
        getcategoryModel = value;
        data = getcategoryModel?.data;
        _tabController = TabController(length: data!.length, vsync: this);
      });
    });

    _tabController?.addListener(() {
      setState(() {
        selectedIndex = _tabController!.index.toInt();
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding == false
          ? const ShimmerLoader()
          : DefaultTabController(
              length: data!.length,
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: appnThemeColor,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48.0),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      unselectedLabelColor: Colors.white54,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.w600),
                      tabs: data!
                          .map(
                            (title) => Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              //width: 120.0,
                              child: Tab(
                                text: "${title.s3} (${title.s1})",
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                        Icons.menu_sharp), // Replace with your custom icon
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 20, // Adjust the radius as needed
                        backgroundImage: NetworkImage(
                            'https://t4.ftcdn.net/jpg/02/93/04/51/360_F_293045172_ClLRhusrMFM4ffWEYb6reigGAjVVU7bW.webp'), // Replace with your image URL
                      ),
                    ),
                  ],
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: data!.map((title) {
                    return HomePage(
                      title: title,
                    );
                  }).toList(),
                ),
                drawer: const Drawercontent(),
              ),
            ),
    );
  }
}


// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  Data? title;
  HomePage({Key? key, this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetcategoryByIdModel? getcategoryByIdModel;
  List<Datum>? dataCat;
  bool catLoding = false;
  dynamic datvalue;
  String? intValue = '';
  dynamic parsedData;
  @override
  void initState() {
    super.initState();

    fetchDataVAl(widget.title?.dcategoryId);
  }

  Future<http.StreamedResponse> fetchData(int? id) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.abhijeetbharat.com/api/?key=120kngy8ou7LqzXKCzl6zuxxkyszdS5q&getNewsByCatID=$id'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        catLoding = true;
      });
    }

    return response;
  }

  dynamic responseData;
  fetchDataVAl(int? id) async {
    fetchData(id).then((response) async {
      final responseString = await response.stream.bytesToString();
      parsedData = json.decode(responseString);
      return parsedData;
    }).catchError((error) {});
  }

  String dateTimeString = '';

  final dateFormatter = DateFormat("yyyy-MM-dd");
  final timeFormatter = DateFormat("h:mm a");
  @override
  Widget build(BuildContext context) {
    return Container(
        color: headingColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/12/01/18/17/mobile-phone-1875813_640.jpg'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: appButtonColor,
                              shape: BoxShape.rectangle),
                          child: const Text(
                            "TECH",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const CommonHeigthContent(
                          height: 15,
                        ),
                        const Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const CommonHeigthContent(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending",
                      style: TextStyle(
                          color: appnThemeColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: appnThemeColor),
                      child: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const CommonHeigthContent(
                height: 15,
              ),
              parsedData == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: parsedData['data'].length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, i) {
                        final dateTime =
                            DateTime.parse(parsedData['data'][i]['1']['date']);

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      id: parsedData['data'][i]['NewsId'])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ImageContainer(
                                      width: 100,
                                      height: 100,
                                      borderRadius: 5,
                                      imageUrl: parsedData['data'][i]
                                          ['ImageURL'],
                                    ),
                                    const CommonWeigthContent(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            parsedData['data'][i]['NewsTitle'],
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: const TextStyle(
                                                color: appnThemeColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const CommonHeigthContent(height: 10),
                                          Text(
                                            parsedData['data'][i]['2'],
                                            maxLines: 2,
                                            overflow: TextOverflow.clip,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const CommonHeigthContent(height: 10),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.calendar_today,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              const CommonWeigthContent(
                                                  width: 5),
                                              Text(
                                                dateFormatter.format(dateTime),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              const CommonWeigthContent(
                                                  width: 20),
                                              const Icon(
                                                Icons.schedule_outlined,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              const CommonWeigthContent(
                                                  width: 5),
                                              Text(
                                                timeFormatter.format(dateTime),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
            ],
          ),
        ));
  }
}
