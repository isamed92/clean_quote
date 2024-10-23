import 'package:clean_breaking_bad_app/quote/data/datasource/quote_datasource.dart';
import 'package:clean_breaking_bad_app/quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_breaking_bad_app/quote/domain/usecases/get_quote_usecase.dart';
import 'package:clean_breaking_bad_app/quote/presentation/blocs/quote_bloc/quote_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void initServices() {
  final http.Client client = getIt.registerSingleton(http.Client());

  final QuoteDatasourceImpl quoteDataSourceImpl =
      getIt.registerSingleton(QuoteDatasourceImpl(client));

  final QuoteRepositoryImpl quoteRepositoryImpl =
      getIt.registerSingleton(QuoteRepositoryImpl(quoteDataSourceImpl));

  final GetQuoteUsecase quoteUsecase =
      getIt.registerSingleton(GetQuoteUsecase(quoteRepositoryImpl));

  getIt.registerFactory(() => QuoteBloc(quoteUsecase));
}
