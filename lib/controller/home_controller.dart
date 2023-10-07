import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertask/database_helper.dart';
import 'package:fluttertask/modals/question_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends ChangeNotifier {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  DatabaseHelper dbHelper=DatabaseHelper();
  int pageSize = 10;
  QuestionModel? questions;
  void getQuestions() async {
    final dio = Dio();
    EasyLoading.show();
    final response = await dio.get("https://api.stackexchange.com/2.3/questions?order=desc&pagesize=$pageSize&sort=activity&site=stackoverflow");
    log("$response");
    questions = QuestionModel.fromJson(response.data);
    EasyLoading.dismiss();
    notifyListeners();
  }

  void loadMore() async {
    pageSize = pageSize + 10;
    final dio = Dio();
    final response = await dio.get("https://api.stackexchange.com/2.3/questions?order=desc&pagesize=$pageSize&sort=activity&site=stackoverflow");
    log("$response");
    QuestionModel moreQuestions = QuestionModel.fromJson(response.data);
    questions!.items!.addAll(moreQuestions.items!);
    refreshController.loadComplete();
    notifyListeners();
  }

  HomeController() {
    getQuestions();
  }
}
