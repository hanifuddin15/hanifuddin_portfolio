import 'package:flutter/material.dart';

// ── Colors ──────────────────────────────────────────────
const Color kPrimaryColor = Color(0xFF15B572);
const Color kBackgroundColor = Color(0xFF07111A);
const Color kDangerColor = Color(0xFFF94D1E);
const Color kCaptionColor = Color(0xFFA6B1BB);
const Color kCardColor = Color(0xFF0D1B2A);
const Color kSurfaceColor = Color(0xFF112240);

// ── Layout Sizes ────────────────────────────────────────
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .9;

// ── Personal Info ───────────────────────────────────────
const String kName = 'Hanif Uddin';
const String kTitle = 'Mobile Application Developer';
const String kEmail = 'hanifuddin.dev@gmail.com';
const String kPhone = '+8801963978074';
const String kAddress = '2no Road, Chad Uddan, Dhaka, Bangladesh';
const String kGitHub = 'https://github.com/hanifuddin15';
const String kLinkedIn = 'https://linkedin.com/in/hanifuddin';
const String kPortfolioUrl = "Hanif's Portfolio";
