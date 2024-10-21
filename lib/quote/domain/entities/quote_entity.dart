import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  const QuoteEntity({
    this.quote,
    this.author,
  });

  final String? quote;

  final String? author;
  @override
  List<Object?> get props => [
        quote,
        author,
      ];
}
