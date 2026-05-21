import 'package:equatable/equatable.dart';

class FooterContact extends Equatable {
  final String iconPath;
  final String title;
  final String text1;
  final String text2;

  const FooterContact({
    required this.iconPath,
    required this.title,
    required this.text1,
    required this.text2,
  });

  @override
  List<Object?> get props => [iconPath, title, text1, text2];
}
