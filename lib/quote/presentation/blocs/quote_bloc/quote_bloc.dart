import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';
import 'package:clean_breaking_bad_app/quote/domain/usecases/get_quote_usecase.dart';
import 'package:equatable/equatable.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this._quoteUsecase) : super(const QuoteState()) {
    on<GetRandomQuoteEvent>(_getQuote);
  }
  final GetQuoteUsecase _quoteUsecase;

  FutureOr<void> _getQuote(
    GetRandomQuoteEvent event,
    Emitter<QuoteState> emit,
  ) async {
    emit(const QuoteState(isLoadingQuote: true));
    final result = await _quoteUsecase();
    emit(state.copyWith(quote: result, isLoadingQuote: false));
  }
}
