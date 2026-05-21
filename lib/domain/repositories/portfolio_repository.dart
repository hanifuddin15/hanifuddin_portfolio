import 'package:web_portfolio/domain/entities/career_item.dart';
import 'package:web_portfolio/domain/entities/education_item.dart';
import 'package:web_portfolio/domain/entities/experience_item.dart';
import 'package:web_portfolio/domain/entities/footer_contact.dart';
import 'package:web_portfolio/domain/entities/project_item.dart';
import 'package:web_portfolio/domain/entities/skill_item.dart';
import 'package:web_portfolio/domain/entities/stat_item.dart';

/// Abstract repository contract for portfolio data.
abstract class PortfolioRepository {
  List<CareerItem> getServices();
  List<ProjectItem> getProjects();
  List<StatItem> getStats();
  List<EducationItem> getEducation();
  List<SkillItem> getSkills();
  List<FooterContact> getContacts();
  List<ExperienceItem> getExperience();
}
