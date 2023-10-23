import 'dart:convert';

GetcategoryByIdModel getcategoryByIdModelFromJson(String str) =>
    GetcategoryByIdModel.fromJson(json.decode(str));

String getcategoryByIdModelToJson(GetcategoryByIdModel data) =>
    json.encode(data.toJson());

class GetcategoryByIdModel {
  List<Datum> data;

  GetcategoryByIdModel({
    required this.data,
  });

  factory GetcategoryByIdModel.fromJson(Map<String, dynamic> json) =>
      GetcategoryByIdModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int the0;
  The1 the1;
  String the2;
  String the3;
  String the4;
  String the5;
  int the6;
  int the7;
  int the8;
  dynamic the9;
  The10 the10;
  dynamic the11;
  The12 the12;
  String the13;
  String the14;
  String the15;
  String the16;
  dynamic the17;
  int newsId;
  The1 newsDate;
  String newsIntroTExt;
  String newsUrl;
  String newsTitle;
  String serverPrefix;
  int showAuthor;
  int showAuthorDetails;
  int authorId;
  dynamic authorName;
  The10 categoryName;
  int dCategoryId;
  The12 engUrl;
  String imageUrl;
  String imageCaption;
  String iserverPrefix;
  String smallThumbNail;
  dynamic profileImage;

  Datum({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.the6,
    required this.the7,
    required this.the8,
    required this.the9,
    required this.the10,
    required this.the11,
    required this.the12,
    required this.the13,
    required this.the14,
    required this.the15,
    required this.the16,
    required this.the17,
    required this.newsId,
    required this.newsDate,
    required this.newsIntroTExt,
    required this.newsUrl,
    required this.newsTitle,
    required this.serverPrefix,
    required this.showAuthor,
    required this.showAuthorDetails,
    required this.authorId,
    required this.authorName,
    required this.categoryName,
    required this.dCategoryId,
    required this.engUrl,
    required this.imageUrl,
    required this.imageCaption,
    required this.iserverPrefix,
    required this.smallThumbNail,
    required this.profileImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        the0: json["0"],
        the1: The1.fromJson(json["1"]),
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        the8: json["8"],
        the9: json["9"],
        the10: the10Values.map[json["10"]]!,
        the11: json["11"],
        the12: the12Values.map[json["12"]]!,
        the13: json["13"],
        the14: json["14"],
        the15: json["15"],
        the16: json["16"],
        the17: json["17"],
        newsId: json["NewsId"],
        newsDate: The1.fromJson(json["NewsDate"]),
        newsIntroTExt: json["NewsIntroTExt"],
        newsUrl: json["NewsURL"],
        newsTitle: json["NewsTitle"],
        serverPrefix: json["ServerPrefix"],
        showAuthor: json["ShowAuthor"],
        showAuthorDetails: json["ShowAuthorDetails"],
        authorId: json["AuthorId"],
        authorName: json["AuthorName"],
        categoryName: the10Values.map[json["categoryName"]]!,
        dCategoryId: json["dCategoryID"],
        engUrl: the12Values.map[json["EngURL"]]!,
        imageUrl: json["ImageURL"],
        imageCaption: json["ImageCaption"],
        iserverPrefix: json["IserverPrefix"],
        smallThumbNail: json["SmallThumbNail"],
        profileImage: json["ProfileImage"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1.toJson(),
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "7": the7,
        "8": the8,
        "9": the9,
        "10": the10Values.reverse[the10],
        "11": the11,
        "12": the12Values.reverse[the12],
        "13": the13,
        "14": the14,
        "15": the15,
        "16": the16,
        "17": the17,
        "NewsId": newsId,
        "NewsDate": newsDate.toJson(),
        "NewsIntroTExt": newsIntroTExt,
        "NewsURL": newsUrl,
        "NewsTitle": newsTitle,
        "ServerPrefix": serverPrefix,
        "ShowAuthor": showAuthor,
        "ShowAuthorDetails": showAuthorDetails,
        "AuthorId": authorId,
        "AuthorName": authorName,
        "categoryName": the10Values.reverse[categoryName],
        "dCategoryID": dCategoryId,
        "EngURL": the12Values.reverse[engUrl],
        "ImageURL": imageUrl,
        "ImageCaption": imageCaption,
        "IserverPrefix": iserverPrefix,
        "SmallThumbNail": smallThumbNail,
        "ProfileImage": profileImage,
      };
}

enum The10 { EMPTY }

final the10Values = EnumValues({"दुनिया ": The10.EMPTY});

enum The12 { INTERNATIONAL }

final the12Values = EnumValues({"International": The12.INTERNATIONAL});

class The1 {
  DateTime date;
  int timezoneType;
  Timezone timezone;

  The1({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map[json["timezone"]]!,
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Timezone { ASIA_KOLKATA }

final timezoneValues = EnumValues({"Asia/Kolkata": Timezone.ASIA_KOLKATA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
