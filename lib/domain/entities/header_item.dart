import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HeaderItem extends Equatable {
  final String title;
  final VoidCallback? onTap;
  final bool isButton;

  const HeaderItem({
    required this.title,
    this.onTap,
    this.isButton = false,
  });

  @override
  List<Object?> get props => [title, isButton];
}
