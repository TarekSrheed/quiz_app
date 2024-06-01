import 'package:flutter/material.dart';
import 'package:quiz_app/config/get_it_config.dart';
import 'package:quiz_app/model/quiz_model.dart';

import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/res/app_color.dart';
import 'package:quiz_app/res/app_constans.dart';
import 'package:quiz_app/res/app_images.dart';
import 'package:quiz_app/res/app_string.dart';
import 'package:quiz_app/res/app_style.dart';
import 'package:quiz_app/service/get_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ValueNotifier<bool> showIcon = ValueNotifier<bool>(false);
  final PageController controller = PageController(initialPage: 0);
  late double score = 0;
  late int pageNum = 1;

  Future<void> _showResultAndMove() async {
    showIcon.value = true;

    await Future.delayed(const Duration(seconds: 1));

    showIcon.value = false;

    controller.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  TextEditingController question = TextEditingController();
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  TextEditingController correctAnswer = TextEditingController();

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: primaryColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultPadding),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(defaultPadding - 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: question,
                decoration: const InputDecoration(
                  labelText: ADDQUESTION,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TextField(
                  controller: answer1,
                  decoration: const InputDecoration(
                    labelText: ANSWERA,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Expanded(
                child: TextField(
                  controller: answer2,
                  decoration: const InputDecoration(
                    labelText: ANSWERB,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TextField(
                  controller: answer3,
                  decoration: const InputDecoration(
                    labelText: ANSWERC,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Expanded(
                child: TextField(
                  controller: answer4,
                  decoration: const InputDecoration(
                    labelText: ANSWERD,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Expanded(
                child: TextField(
                  controller: correctAnswer,
                  decoration: const InputDecoration(
                    labelText: NUMBEROFCORRECT,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ElevatedButton(
                onPressed: () async {
                  bool status = await postData(
                    QuizModel(
                      question: question.text,
                      answers: [
                        answer1.text,
                        answer2.text,
                        answer3.text,
                        answer4.text,
                      ],
                      indexOfCorrectAnswer:
                          num.tryParse(correctAnswer.text) ?? 0,
                    ),
                  );
                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(OK),
                        backgroundColor: green,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(ERROR),
                        backgroundColor: red,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                },
                child: const Text(CONFIRM),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(defaultPadding2 * 3),
        child: AppBar(
          backgroundColor: scondryColor,
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(appbarphoto3).image,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: elseColor,
            ),
          ),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  appbarphoto1,
                ),
              ),
              Image.asset(
                appbarphoto2,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: scondryColor,
        width: double.maxFinite,
        height: double.maxFinite,
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Scaffold(
                      body: Container(
                        color: scondryColor,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              bottom: defaultPadding,
                              right: 0,
                              child: Image.asset(centerPhoto),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Image.asset(bottomPhoto),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.all(defaultPadding),
                                    alignment: Alignment.center,
                                    width: 281,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(defaultPadding),
                                      gradient: LinearGradient(
                                        colors: [
                                          primaryColor,
                                          elseColor,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                            height: defaultPadding - 5),
                                        Text(
                                          "$QUESTION $pageNum / ${snapshot.data!.length}",
                                          style: titleQuestionStyle,
                                        ),
                                        const SizedBox(height: defaultPadding2),
                                        Text(
                                          snapshot.data![index].question,
                                          style: questionStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultPadding2),
                                Flexible(
                                  child: ListView.builder(
                                    itemCount:
                                        snapshot.data![index].answers.length,
                                    itemBuilder: (context, ind) {
                                      return InkWell(
                                        onTap: () {
                                          pageNum = pageNum + 1;

                                          if (ind ==
                                                  snapshot.data![index]
                                                      .indexOfCorrectAnswer &&
                                              controller.page ==
                                                  snapshot.data!.length - 1) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultPage(
                                                  totalQuestion:
                                                      snapshot.data!.length,
                                                ),
                                              ),
                                            );
                                            _showResultAndMove();
                                            core
                                                .get<SharedPreferences>()
                                                .setDouble("score", score);
                                          } else if (ind ==
                                              snapshot.data![index]
                                                  .indexOfCorrectAnswer) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                    YOURANSWERISCORRECT),
                                                backgroundColor: green,
                                                duration:
                                                    const Duration(seconds: 1),
                                              ),
                                            );

                                            score = score + 1;
                                            _showResultAndMove();
                                          } else if (ind !=
                                                  snapshot.data![index]
                                                      .indexOfCorrectAnswer &&
                                              controller.page ==
                                                  snapshot.data!.length - 1) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(YOURANSWER),
                                                backgroundColor: red,
                                                duration:
                                                    const Duration(seconds: 1),
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultPage(
                                                  totalQuestion:
                                                      snapshot.data!.length,
                                                ),
                                              ),
                                            );
                                            _showResultAndMove();
                                            core
                                                .get<SharedPreferences>()
                                                .setDouble("score", score);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(YOURANSWER),
                                                backgroundColor: red,
                                                duration:
                                                    const Duration(seconds: 1),
                                              ),
                                            );

                                            _showResultAndMove();
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: defaultPadding,
                                              top: defaultPadding / 2,
                                              bottom: 12),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding * 5,
                                              vertical: 8),
                                          width: 240,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                defaultPadding - 5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].answers[ind],
                                                style: answerStyle,
                                              ),
                                              ValueListenableBuilder(
                                                valueListenable: showIcon,
                                                builder:
                                                    (context, value, child) {
                                                  return (showIcon.value ==
                                                          true)
                                                      ? CircleAvatar(
                                                          backgroundColor: (ind ==
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .indexOfCorrectAnswer)
                                                              ? scondryColor
                                                              : red,
                                                          child: (ind ==
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .indexOfCorrectAnswer)
                                                              ? Icon(
                                                                  Icons.check,
                                                                  color: white,
                                                                )
                                                              : Icon(
                                                                  Icons.cancel,
                                                                  color: white,
                                                                ),
                                                        )
                                                      : Container();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: scondryColor,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(context),
        child: Icon(
          Icons.add,
          color: scondryColor,
        ),
      ),
    );
  }
}
