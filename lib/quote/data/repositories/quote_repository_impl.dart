import 'package:clean_breaking_bad_app/quote/data/datasource/quote_datasource.dart';
import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';
import 'package:clean_breaking_bad_app/quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  QuoteRepositoryImpl(this._quoteDatasource);
  final QuoteDatasource _quoteDatasource;

  @override
  Future<QuoteEntity> getQuote() async {
    return _quoteDatasource.getQuote();
  }
}
