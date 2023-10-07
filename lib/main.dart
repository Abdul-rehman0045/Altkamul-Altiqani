import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertask/controller/home_controller.dart';
import 'package:fluttertask/modals/question_model.dart';
import 'package:fluttertask/stack_exchange_plugin.dart';
import 'package:fluttertask/views/answer_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'database_helper.dart';
import 'widgets/question_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper();
  @override
  void initState() {
    dbHelper.initializeDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            child: Text('press'),
            onPressed: () {
              StackExchangePlugin.fetchQuestions();
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Consumer<HomeController>(
          builder: (context, provider, child) {
            return provider.questions?.items?.length == null
                ? Container()
                : SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: true,
                    onLoading: provider.loadMore,
                    controller: provider.refreshController,
                    child: ListView.builder(
                      itemCount: provider.questions!.items!.length,
                      itemBuilder: (context, index) {
                        Item item = provider.questions!.items![index];
                        return QuestionCard(
                          item: item,
                          title: provider.questions!.items![index].title,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return AnswerView(
                                    arguments: item,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
