import 'package:equatable/equatable.dart';
import 'package:web_portfolio/domain/entities/career_item.dart';
import 'package:web_portfolio/domain/entities/education_item.dart';
import 'package:web_portfolio/domain/entities/experience_item.dart';
import 'package:web_portfolio/domain/entities/footer_contact.dart';
import 'package:web_portfolio/domain/entities/project_item.dart';
import 'package:web_portfolio/domain/entities/skill_item.dart';
import 'package:web_portfolio/domain/entities/stat_item.dart';

enum PortfolioStatus { initial, loading, loaded, error }

class PortfolioState extends Equatable {
  final PortfolioStatus status;
  final List<CareerItem> services;
  final List<ProjectItem> projects;
  final List<StatItem> stats;
  final List<EducationItem> education;
  final List<SkillItem> skills;
  final List<FooterContact> contacts;
  final List<ExperienceItem> experience;
  final String activeSection;

  const PortfolioState({
    this.status = PortfolioStatus.initial,
    this.services = const [],
    this.projects = const [],
    this.stats = const [],
    this.education = const [],
    this.skills = const [],
    this.contacts = const [],
    this.experience = const [],
    this.activeSection = 'HOME',
  });

  PortfolioState copyWith({
    PortfolioStatus? status,
    List<CareerItem>? services,
    List<ProjectItem>? projects,
    List<StatItem>? stats,
    List<EducationItem>? education,
    List<SkillItem>? skills,
    List<FooterContact>? contacts,
    List<ExperienceItem>? experience,
    String? activeSection,
  }) {
    return PortfolioState(
      status: status ?? this.status,
      services: services ?? this.services,
      projects: projects ?? this.projects,
      stats: stats ?? this.stats,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      contacts: contacts ?? this.contacts,
      experience: experience ?? this.experience,
      activeSection: activeSection ?? this.activeSection,
    );
  }

  @override
  List<Object?> get props => [
        status,
        services,
        projects,
        stats,
        education,
        skills,
        contacts,
        experience,
        activeSection,
      ];
}
