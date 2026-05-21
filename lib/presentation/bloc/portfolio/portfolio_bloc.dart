import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portfolio/domain/repositories/portfolio_repository.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_event.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository repository;

  PortfolioBloc({required this.repository}) : super(const PortfolioState()) {
    on<LoadPortfolio>(_onLoadPortfolio);
    on<ScrollToSection>(_onScrollToSection);
  }

  void _onLoadPortfolio(
    LoadPortfolio event,
    Emitter<PortfolioState> emit,
  ) {
    emit(state.copyWith(status: PortfolioStatus.loading));

    try {
      final services = repository.getServices();
      final projects = repository.getProjects();
      final stats = repository.getStats();
      final education = repository.getEducation();
      final skills = repository.getSkills();
      final contacts = repository.getContacts();
      final experience = repository.getExperience();

      emit(state.copyWith(
        status: PortfolioStatus.loaded,
        services: services,
        projects: projects,
        stats: stats,
        education: education,
        skills: skills,
        contacts: contacts,
        experience: experience,
      ));
    } catch (_) {
      emit(state.copyWith(status: PortfolioStatus.error));
    }
  }

  void _onScrollToSection(
    ScrollToSection event,
    Emitter<PortfolioState> emit,
  ) {
    emit(state.copyWith(activeSection: event.section));
  }
}
