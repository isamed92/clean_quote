import 'package:clean_breaking_bad_app/quote/data/models/quote_response_model.dart';
import 'package:http/http.dart' as http;

mixin QuoteDatasource {
  Future<QuoteResponseModel> getQuote();
}

class QuoteDatasourceImpl implements QuoteDatasource {
  QuoteDatasourceImpl(this._client);

  final http.Client _client;

  @override
  Future<QuoteResponseModel> getQuote() async {
    final url = Uri.https('api.breakingbadquotes.xyz', '/v1/quotes');

    final response = await _client.get(url);

    if (response.statusCode == 200) {
      final quote = QuoteResponseModel.fromRawJson(response.body);
      return quote;
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
