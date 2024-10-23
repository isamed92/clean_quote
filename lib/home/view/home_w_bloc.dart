import 'package:clean_breaking_bad_app/quote/presentation/blocs/quote_bloc/quote_bloc.dart';
import 'package:clean_breaking_bad_app/quote/presentation/views/quote_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWBlocPage extends StatelessWidget {
  const HomeWBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: QuoteBuilder(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () =>
            context.read<QuoteBloc>().add(const GetRandomQuoteEvent()),
      ),
    );
  }
}
