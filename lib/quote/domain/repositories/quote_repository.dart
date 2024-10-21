import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<QuoteEntity> getQuote();
}
