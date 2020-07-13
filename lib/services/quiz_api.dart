import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_covid19/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.googleusercontent.com/macros/echo?user_content_key=p_SHV-y9DuIib9Fp_w7UIZPa3EoccEsPtAtvE43DniKAlvXpJpMvU6uXpSfWDEWwxd8wjAue4OqRfvbFa_95krwM2cXTPNtxm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLmtTavgXqWXyeELmXRb9ZvurCL_FsjE_OrD3yeKLY4hUz0SRt21jV3EvLs_ACBjDXXE9vqSRAli&lib=Mp4fhLrr5N2zIsW20sIBkzNzN4ag7LKMu';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}
