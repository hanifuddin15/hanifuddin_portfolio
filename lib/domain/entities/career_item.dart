import 'package:equatable/equatable.dart';

class CareerItem extends Equatable {
  final String title;
  final String imagePath;
  final String subtitle;

  const CareerItem({
    required this.title,
    required this.imagePath,
    required this.subtitle,
  });

  @override
  List<Object?> get props => [title, imagePath, subtitle];
}
