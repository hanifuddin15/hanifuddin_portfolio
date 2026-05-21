import 'package:equatable/equatable.dart';

class ProjectItem extends Equatable {
  final String category;
  final String title;
  final String description;
  final String imagePath;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String techStack;

  const ProjectItem({
    required this.category,
    required this.title,
    required this.description,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    required this.techStack,
  });

  @override
  List<Object?> get props => [category, title, description, imagePath];
}
