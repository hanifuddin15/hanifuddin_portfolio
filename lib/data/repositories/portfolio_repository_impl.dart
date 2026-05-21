import 'package:web_portfolio/data/datasources/portfolio_local_data.dart';
import 'package:web_portfolio/domain/entities/career_item.dart';
import 'package:web_portfolio/domain/entities/education_item.dart';
import 'package:web_portfolio/domain/entities/experience_item.dart';
import 'package:web_portfolio/domain/entities/footer_contact.dart';
import 'package:web_portfolio/domain/entities/project_item.dart';
import 'package:web_portfolio/domain/entities/skill_item.dart';
import 'package:web_portfolio/domain/entities/stat_item.dart';
import 'package:web_portfolio/domain/repositories/portfolio_repository.dart';

/// Concrete implementation that returns static local data.
class PortfolioRepositoryImpl implements PortfolioRepository {
  @override
  List<CareerItem> getServices() => PortfolioLocalData.services;

  @override
  List<ProjectItem> getProjects() => PortfolioLocalData.projects;

  @override
  List<StatItem> getStats() => PortfolioLocalData.stats;

  @override
  List<EducationItem> getEducation() => PortfolioLocalData.education;

  @override
  List<SkillItem> getSkills() => PortfolioLocalData.skills;

  @override
  List<FooterContact> getContacts() => PortfolioLocalData.contacts;

  @override
  List<ExperienceItem> getExperience() => PortfolioLocalData.experience;
}
