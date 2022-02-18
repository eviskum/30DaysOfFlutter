import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToApi() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', 'posts');
    final response = await http.get(uri);
    return response.body;
  }
}
