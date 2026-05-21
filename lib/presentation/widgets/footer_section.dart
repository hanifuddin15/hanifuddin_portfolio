import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

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
          child: ResponsiveContainer(
            maxWidth: width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        children: state.contacts
                            .map(
                              (contact) => SizedBox(
                                height: 120.0,
                                width: ScreenHelper.isMobile(context)
                                    ? constraints.maxWidth / 2.0 - 20.0
                                    : constraints.maxWidth / 4.0 - 20.0,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          contact.iconPath,
                                          width: 25.0,
                                        ),
                                        const SizedBox(width: 15.0),
                                        Text(
                                          contact.title,
                                          style: GoogleFonts.oswald(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15.0),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${contact.text1}\n',
                                            style: const TextStyle(
                                              color: kCaptionColor,
                                              height: 1.8,
                                            ),
                                          ),
                                          if (contact.text2.isNotEmpty)
                                            TextSpan(
                                              text: '${contact.text2}\n',
                                              style: const TextStyle(
                                                color: kCaptionColor,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Flex(
                      direction: ScreenHelper.isMobile(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisAlignment: ScreenHelper.isMobile(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '© ${DateTime.now().year} Hanif Uddin. All rights reserved',
                            style: const TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(color: kCaptionColor),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: const Text(
                                '|',
                                style: TextStyle(color: kCaptionColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  'Terms & Conditions',
                                  style: TextStyle(color: kCaptionColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
