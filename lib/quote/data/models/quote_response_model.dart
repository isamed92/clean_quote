import 'dart:convert';

import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_response_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class QuoteResponseModel extends Equatable implements QuoteEntity {
  const QuoteResponseModel({
    this.quote,
    this.author,
  });
  factory QuoteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseModelFromJson(json);

  factory QuoteResponseModel.fromRawJson(String str) =>
      QuoteResponseModel.fromJson(
        (json.decode(str) as List<dynamic>)[0] as Map<String, dynamic>,
      );

  @override
  final String? quote;

  @override
  final String? author;

  QuoteResponseModel copyWith({
    String? quote,
    String? author,
  }) {
    return QuoteResponseModel(
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }

  @override
  List<Object?> get props => [
        quote,
        author,
      ];
}
