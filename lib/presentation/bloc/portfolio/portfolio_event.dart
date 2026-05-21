import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

/// Fired once on app start to load all portfolio data.
class LoadPortfolio extends PortfolioEvent {
  const LoadPortfolio();
}

/// Fired when user taps a nav item to scroll to a section.
class ScrollToSection extends PortfolioEvent {
  final String section;

  const ScrollToSection(this.section);

  @override
  List<Object?> get props => [section];
}
