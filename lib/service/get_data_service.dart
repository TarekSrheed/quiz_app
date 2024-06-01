import 'package:dio/dio.dart';
import 'package:quiz_app/model/quiz_model.dart';

Future<List<QuizModel>> getData() async {
  Dio req = Dio();
  Response response =
      await req.get("https://6640fd53a7500fcf1a9f426d.mockapi.io/quiz_app");
  // print(response);

  List<QuizModel> quiz = List.generate(
    response.data.length,
    (index) => QuizModel.fromMap(
      response.data[index],
    ),
  );
  return quiz;
}

postData(QuizModel model) async {
  Dio dio = Dio();
  Response response = await dio.post(
      "https://6640fd53a7500fcf1a9f426d.mockapi.io/quiz_app",
      data: model.toMap());
  return response;
}
