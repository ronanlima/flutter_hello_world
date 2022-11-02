import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class UnoHttpClient extends HttpService {
  final _uno = Uno();

  @override
  Future<HttpResponse> get({required String path}) async {
    try {
      final response = await _uno.get(path);
      print('httpResponse: $response');
      return HttpResponse(
          message: 'Ok', statusCode: response.status, data: response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
