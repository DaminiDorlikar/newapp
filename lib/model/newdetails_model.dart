// ignore_for_file: unnecessary_new

class NewsDetailsModel {
  List<Data>? data;

  NewsDetailsModel({this.data});

  NewsDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? newsId;
  String? newsTitle;
  String? newsText;
  String? newsPlainText;
  String? newsIntroText;
  String? categoryName;
  String? image;

  Data(
      {this.newsId,
      this.newsTitle,
      this.newsText,
      this.newsPlainText,
      this.newsIntroText,
      this.categoryName,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    newsId = json['NewsId'];
    newsTitle = json['NewsTitle'];
    newsText = json['NewsText'];
    newsPlainText = json['NewsPlainText'];
    newsIntroText = json['NewsIntroText'];
    categoryName = json['CategoryName'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewsId'] = this.newsId;
    data['NewsTitle'] = this.newsTitle;
    data['NewsText'] = this.newsText;
    data['NewsPlainText'] = this.newsPlainText;
    data['NewsIntroText'] = this.newsIntroText;
    data['CategoryName'] = this.categoryName;
    data['Image'] = this.image;
    return data;
  }
}
