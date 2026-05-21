import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JOB EXPERIENCE',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  constraints: const BoxConstraints(maxWidth: 500.0),
                  child: const Text(
                    'Results-driven Flutter developer with 3+ years of professional experience in developing scalable, maintainable, and high-performance mobile applications.',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                ...state.experience.map(
                  (exp) => Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: kPrimaryColor,
                          width: 3.0,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp.period,
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          exp.role,
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          exp.company,
                          style: const TextStyle(
                            color: kCaptionColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        ...exp.highlights.map(
                          (highlight) => Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    highlight,
                                    style: const TextStyle(
                                      color: kCaptionColor,
                                      height: 1.5,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
