import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';
import 'package:clean_breaking_bad_app/quote/domain/repositories/quote_repository.dart';

class GetQuoteUsecase {
  GetQuoteUsecase(this._quoteRepository);
  final QuoteRepository _quoteRepository;

  Future<QuoteEntity> call() async {
    return _quoteRepository.getQuote();
  }
}
