import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
        return Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ResponsiveContainer(
                maxWidth: width,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 2,
                      child: Image.asset(
                        'assets/person_small.png',
                        width: 300.0,
                      ),
                    ),
                    const SizedBox(width: 50.0),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SKILLS',
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28.0,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Proficient in Flutter, Dart, and modern mobile development tools. Experienced with state management, real-time communication, and cloud services.',
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Column(
                            children: state.skills
                                .map(
                                  (skill) => Container(
                                    margin:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            alignment:
                                                Alignment.centerLeft,
                                            height: 38.0,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Text(
                                              skill.name,
                                              style: const TextStyle(
                                                color: kBackgroundColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          flex: 100 - skill.percentage,
                                          child: const Divider(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          '${skill.percentage}%',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
