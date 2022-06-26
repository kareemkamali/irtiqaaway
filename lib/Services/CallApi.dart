import 'package:http/http.dart' as https;
class CallApi{
  final String _url = 'https://www.lebrawad.com';

  getArticleData(apiUrl) async {

    https.Response response = await https.get(
        Uri.parse(_url+apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    ) ;
    try {
      if (response.statusCode == 200) {
        print("done");
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}