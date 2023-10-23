import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/getcategory_model.dart';
import 'package:newsapp/model/newdetails_model.dart';

class AuthAPi {
  Future<GetcategoryModel> getCategoryData() async {
    final response = await http.get(Uri.parse(
        'https://www.abhijeetbharat.com/api/?key=120kngy8ou7LqzXKCzl6zuxxkyszdS5q&getCategories'));

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);

      return GetcategoryModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> getCategoryDataById(int? id) async {
    final response = await http.get(Uri.parse(
        'https://www.abhijeetbharat.com/api/?key=120kngy8ou7LqzXKCzl6zuxxkyszdS5q&getNewsByCatID=11306'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<NewsDetailsModel> getCategoryNews(int? id) async {
    final response = await http.get(Uri.parse(
        'https://www.abhijeetbharat.com/api/?key=120kngy8ou7LqzXKCzl6zuxxkyszdS5q&getNewsByID=$id'));

    if (response.statusCode == 200) {
      return NewsDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
