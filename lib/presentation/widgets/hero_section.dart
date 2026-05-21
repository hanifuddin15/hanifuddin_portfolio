import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    double heroHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildDesktop(context, heroHeight),
        tablet: _buildTablet(context, heroHeight),
        mobile: _buildMobile(context, heroHeight),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context, double height) {
    return Center(
      child: ResponsiveContainer(
        maxWidth: kDesktopMaxWidth,
        child: Row(
          children: [
            Expanded(child: _heroText()),
            Expanded(child: _heroImage()),
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context, double height) {
    return Center(
      child: ResponsiveContainer(
        maxWidth: kTabletMaxWidth,
        child: Row(
          children: [
            Expanded(child: _heroText()),
            Expanded(child: _heroImage()),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context, double height) {
    return Container(
      constraints: BoxConstraints(maxWidth: getMobileMaxWidth(context)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _heroText(),
    );
  }

  Widget _heroText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'MOBILE APP DEVELOPER',
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w900,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 18.0),
        Text(
          'HANIF\nUDDIN',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Flutter Developer, based in Dhaka, Bangladesh',
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Wrap(
          children: [
            const Text(
              '3+ years building scalable mobile apps.',
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.5,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  " Got a project? Let's talk.",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25.0),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 48.0,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'GET IN TOUCH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _heroImage() {
    return Image.asset(
      'assets/person.png',
      fit: BoxFit.contain,
    );
  }
}
