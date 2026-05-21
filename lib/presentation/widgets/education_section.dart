import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          child: ResponsiveContainer(
            maxWidth: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'EDUCATION',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5.0),
                Wrap(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500.0),
                      child: const Text(
                        'My academic background in Engineering and Signal Processing provides a strong foundation for building complex mobile applications.',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: state.education.map((education) {
                        double itemWidth = ScreenHelper.isMobile(context)
                            ? constraints.maxWidth
                            : constraints.maxWidth / 2.0 - 20.0;
                        return SizedBox(
                          width: itemWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period,
                                style: GoogleFonts.oswald(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                education.degree,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                education.institution,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                  fontSize: 14.0,
                                ),
                              ),
                              if (education.grade != null) ...[
                                const SizedBox(height: 4.0),
                                Text(
                                  education.grade!,
                                  style: TextStyle(
                                    color: kPrimaryColor.withValues(alpha: 0.9),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                              if (education.description != null) ...[
                                const SizedBox(height: 8.0),
                                Text(
                                  education.description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: kCaptionColor,
                                    height: 1.5,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 30.0),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
