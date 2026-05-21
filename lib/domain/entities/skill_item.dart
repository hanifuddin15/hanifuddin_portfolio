import 'package:equatable/equatable.dart';

class SkillItem extends Equatable {
  final String name;
  final int percentage;

  const SkillItem({
    required this.name,
    required this.percentage,
  });

  @override
  List<Object?> get props => [name, percentage];
}
