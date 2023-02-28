import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'news_data.dart';

class NewsManager with ChangeNotifier {
  NewsManager() {
    getNews();
    print("getnews called");
  }

  List<NEWSDATA> newslist = [];
  List<NEWSDATA> newslist2 = [];
  TextEditingController searchcont = TextEditingController();
  getNews() async {
    await FirebaseFirestore.instance.collection("Newsfeed").get().then((value) {
      print(value.size);
      newslist2 = List.generate(value.size, (index) {
        NEWSDATA newsModel = NEWSDATA.fromMap(value.docs[index].data());
        newsModel.reff = value.docs[index].reference;
        return newsModel;
      });
      newslist.clear();
      newslist = List.from(newslist2);
      notifyListeners();
    });
  }

  searchNews(String? value) {
    if (value!.isEmpty || value == "") {
      newslist = List.from(newslist2);
      notifyListeners();
    } else {
      newslist =
          newslist2.where((element) => element.title!.contains(value)).toList();
      notifyListeners();
    }
  }
}
