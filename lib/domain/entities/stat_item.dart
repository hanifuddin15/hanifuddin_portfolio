import 'package:equatable/equatable.dart';

class StatItem extends Equatable {
  final String count;
  final String label;

  const StatItem({
    required this.count,
    required this.label,
  });

  @override
  List<Object?> get props => [count, label];
}
