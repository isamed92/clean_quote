part of 'quote_bloc.dart';

sealed class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

class GetRandomQuoteEvent extends QuoteEvent {
  const GetRandomQuoteEvent();
}
