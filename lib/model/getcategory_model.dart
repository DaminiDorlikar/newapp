class GetcategoryModel {
  List<Data>? data;

  GetcategoryModel({this.data});

  GetcategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  int? i0;
  String? s1;
  int? i2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  int? i9;
  int? dcategoryId;
  String? dcategoryName;
  int? iSLastNode;
  String? eNgURL;
  String? templateName;
  String? isMenu;
  String? showNewsDate;
  String? showNewsSource;
  String? externalURL;
  int? level;

  Data(
      {this.i0,
      this.s1,
      this.i2,
      this.s3,
      this.s4,
      this.s5,
      this.s6,
      this.s7,
      this.s8,
      this.i9,
      this.dcategoryId,
      this.dcategoryName,
      this.iSLastNode,
      this.eNgURL,
      this.templateName,
      this.isMenu,
      this.showNewsDate,
      this.showNewsSource,
      this.externalURL,
      this.level});

  Data.fromJson(Map<String, dynamic> json) {
    i0 = json['0'];
    s1 = json['1'];
    i2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    i9 = json['9'];
    dcategoryId = json['DcategoryId'];
    dcategoryName = json['DcategoryName'];
    iSLastNode = json['ISLastNode'];
    eNgURL = json['ENgURL'];
    templateName = json['TemplateName'];
    isMenu = json['IsMenu'];
    showNewsDate = json['ShowNewsDate'];
    showNewsSource = json['ShowNewsSource'];
    externalURL = json['ExternalURL'];
    level = json['Level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.i0;
    data['1'] = this.s1;
    data['2'] = this.i2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.i9;
    data['DcategoryId'] = this.dcategoryId;
    data['DcategoryName'] = this.dcategoryName;
    data['ISLastNode'] = this.iSLastNode;
    data['ENgURL'] = this.eNgURL;
    data['TemplateName'] = this.templateName;
    data['IsMenu'] = this.isMenu;
    data['ShowNewsDate'] = this.showNewsDate;
    data['ShowNewsSource'] = this.showNewsSource;
    data['ExternalURL'] = this.externalURL;
    data['Level'] = this.level;
    return data;
  }
}
