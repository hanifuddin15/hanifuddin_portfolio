import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        return ResponsiveContainer(
          maxWidth: width,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              return Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: state.stats.map((stat) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    width: ScreenHelper.isMobile(context)
                        ? constraint.maxWidth / 2.0 - 20
                        : (constraint.maxWidth / 4.0 - 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stat.count,
                          style: GoogleFonts.oswald(
                            fontWeight: FontWeight.w700,
                            fontSize: 32.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          stat.label,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: kCaptionColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}
