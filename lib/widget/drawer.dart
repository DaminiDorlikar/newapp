import 'package:flutter/material.dart';
import 'package:newsapp/commonview/common_heigthconttent.dart';
import 'package:newsapp/constantcontent/constant_color.dart';

class Drawercontent extends StatelessWidget {
  const Drawercontent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appnThemeColor,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/02/93/04/51/360_F_293045172_ClLRhusrMFM4ffWEYb6reigGAjVVU7bW.webp'), // Replace with your image URL
                    ),
                    CommonHeigthContent(
                      height: 10,
                    ),
                    Text('John Smith',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
