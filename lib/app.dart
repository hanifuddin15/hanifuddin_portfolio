import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portfolio/core/theme/app_theme.dart';
import 'package:web_portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_event.dart';
import 'package:web_portfolio/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PortfolioBloc(
        repository: PortfolioRepositoryImpl(),
      )..add(const LoadPortfolio()),
      child: MaterialApp(
        title: 'Hanif Uddin – Flutter Developer Portfolio',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        home: HomePage(),
      ),
    );
  }
}
