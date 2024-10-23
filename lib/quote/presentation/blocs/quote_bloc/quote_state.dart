part of 'quote_bloc.dart';

class QuoteState extends Equatable {
  const QuoteState({
    this.isLoadingQuote,
    this.quote,
  });
  final bool? isLoadingQuote;

  final QuoteEntity? quote;

  QuoteState copyWith({
    bool? isLoadingQuote,
    QuoteEntity? quote,
  }) {
    return QuoteState(
      isLoadingQuote: isLoadingQuote ?? this.isLoadingQuote,
      quote: quote ?? this.quote,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingQuote,
        quote,
      ];
}
