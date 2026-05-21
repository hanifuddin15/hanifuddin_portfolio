import 'package:equatable/equatable.dart';

class ExperienceItem extends Equatable {
  final String role;
  final String company;
  final String period;
  final List<String> highlights;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.highlights,
  });

  @override
  List<Object?> get props => [role, company, period];
}
