import 'package:flutter/material.dart';
import 'package:newsapp/apiintegration/network.dart';
import 'package:newsapp/commonview/common_heigthconttent.dart';
import 'package:newsapp/constantcontent/constant_color.dart';
import 'package:newsapp/model/newdetails_model.dart';
import 'package:newsapp/widget/shimmer_details.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  int? id;
  DetailsScreen({Key? key, this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLoding = false;
  NewsDetailsModel? newsDetailsModel;
  List<Data>? data;
  @override
  void initState() {
    super.initState();
    AuthAPi().getCategoryNews(widget.id).then((value) {
      setState(() {
        isLoding = true;
        newsDetailsModel = value;
        data = newsDetailsModel?.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding == false
          ? const ShimmerListDetailsLoader()
          : SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 300),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      List<String> words = data![index]
                          .newsPlainText
                          .toString()
                          .trim()
                          .split('&nbsp;&nbsp;');

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Stack(
                                fit: StackFit.loose,
                                clipBehavior: Clip.hardEdge,
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                              data![index].image.toString(),
                                              //'https://cdn.pixabay.com/photo/2016/12/01/18/17/mobile-phone-1875813_640.jpg'
                                            ))),
                                  ),
                                  Positioned(
                                    bottom: -20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              'https://t4.ftcdn.net/jpg/02/93/04/51/360_F_293045172_ClLRhusrMFM4ffWEYb6reigGAjVVU7bW.webp'), // Replace with your image URL
                                        ),
                                        const CommonWeigthContent(
                                          width: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Icon(Icons.share_rounded),
                                            ),
                                            const CommonWeigthContent(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons
                                                  .arrow_back_ios_new_outlined)),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 8),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: NetworkImage(
                                                  'https://t4.ftcdn.net/jpg/02/93/04/51/360_F_293045172_ClLRhusrMFM4ffWEYb6reigGAjVVU7bW.webp'), // Replace with your image URL
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "5 min read",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const CommonHeigthContent(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFF4DC9EE),
                                          shape: BoxShape.rectangle),
                                      child: Text(
                                        data![index].categoryName.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const CommonHeigthContent(
                                      height: 5,
                                    ),
                                    Text(
                                      data![index].newsTitle.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const CommonHeigthContent(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              words.join(' '),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const CommonHeigthContent(
                            height: 20,
                          ),
                        ],
                      );
                    }),
                  ),
                )),
              ),
            ),
      bottomSheet: isLoding == false
          ? Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appnThemeColor),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Realted",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: appnThemeColor,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 160,
                                  width: 200,
                                  margin: const EdgeInsets.all(10.0),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://cdn.pixabay.com/photo/2016/12/01/18/17/mobile-phone-1875813_640.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  //   child: child,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "5 min read",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
