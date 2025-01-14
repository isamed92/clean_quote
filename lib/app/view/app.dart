import 'package:clean_breaking_bad_app/home/view/home_w_bloc.dart';
import 'package:clean_breaking_bad_app/l10n/l10n.dart';
import 'package:clean_breaking_bad_app/quote/presentation/blocs/quote_bloc/quote_bloc.dart';
import 'package:clean_breaking_bad_app/quote/presentation/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (_) => getIt.get<QuoteBloc>()..add(const GetRandomQuoteEvent()),
        child: const HomeWBlocPage(),
      ),
    );
  }
}
