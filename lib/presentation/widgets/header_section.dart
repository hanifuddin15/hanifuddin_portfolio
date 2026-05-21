import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/domain/entities/header_item.dart';

// ── Navigation items ─────────────────────────────────────
List<HeaderItem> headerItems = [
  const HeaderItem(title: 'HOME'),
  const HeaderItem(title: 'ABOUT'),
  const HeaderItem(title: 'SKILLS'),
  const HeaderItem(title: 'PROJECTS'),
  const HeaderItem(title: 'EXPERIENCE'),
  const HeaderItem(
    title: 'CONTACT ME',
    isButton: true,
  ),
];

// ── Logo ─────────────────────────────────────────────────
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'H',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '.',
                style: GoogleFonts.oswald(
                  color: kPrimaryColor,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Desktop Nav Row ──────────────────────────────────────
class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Only visible on tablet & desktop
    if (ScreenHelper.isMobile(context)) {
      return const SizedBox.shrink();
    }

    return Row(
      children: headerItems
          .map(
            (item) => item.isButton
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kDangerColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: TextButton(
                        onPressed: item.onTap ?? () {},
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap: item.onTap ?? () {},
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
          )
          .toList(),
    );
  }
}

// ── Header Section ───────────────────────────────────────
class HeaderSection extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HeaderSection({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _buildHeader(),
      ),
      mobile: _buildMobileHeader(),
      tablet: _buildHeader(),
    );
  }

  Widget _buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
