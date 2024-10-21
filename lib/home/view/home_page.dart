import 'package:clean_breaking_bad_app/quote/data/datasource/quote_datasource.dart';
import 'package:clean_breaking_bad_app/quote/data/repositories/quote_repository_impl.dart';
import 'package:clean_breaking_bad_app/quote/domain/entities/quote_entity.dart';
import 'package:clean_breaking_bad_app/quote/domain/usecases/get_quote_usecase.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getQuote = GetQuoteUsecase(
      QuoteRepositoryImpl(
        QuoteDatasourceImpl(
          http.Client(),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking Bad Quotes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getQuote.call,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: FutureBuilder(
          future: getQuote(),
          builder: (context, AsyncSnapshot<QuoteEntity> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.quote ?? ''),
                    const SizedBox(height: 16),
                    Text(snapshot.data!.author ?? ''),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
