import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        final services = state.services;
        return ResponsiveContainer(
          maxWidth: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WHAT I DO\nBEST',
                    style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      height: 1.8,
                      fontSize: 18.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        'DOWNLOAD CV',
                        style: GoogleFonts.oswald(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: services.map((service) {
                      double itemWidth =
                          ScreenHelper.isMobile(context) ||
                                  ScreenHelper.isTablet(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0;
                      return SizedBox(
                        width: itemWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  service.imagePath,
                                  width: 40.0,
                                ),
                                const SizedBox(width: 15.0),
                                Text(
                                  service.title,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              service.subtitle,
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
