import 'package:equatable/equatable.dart';

class EducationItem extends Equatable {
  final String institution;
  final String degree;
  final String period;
  final String? description;
  final String? grade;

  const EducationItem({
    required this.institution,
    required this.degree,
    required this.period,
    this.description,
    this.grade,
  });

  @override
  List<Object?> get props => [institution, degree, period];
}
