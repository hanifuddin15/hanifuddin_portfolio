import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/core/utils/screen_helper.dart';
import 'package:web_portfolio/domain/entities/project_item.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/responsive_wrapper.dart';

class ProjectShowcaseSection extends StatelessWidget {
  const ProjectShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state.projects.isEmpty) return const SizedBox.shrink();

        // Show first two projects as featured showcases
        return Column(
          children: [
            _ProjectShowcase(
              project: state.projects[0],
              imageFirst: true,
            ),
            const SizedBox(height: 70.0),
            if (state.projects.length > 1)
              _ProjectShowcase(
                project: state.projects[1],
                imageFirst: false,
              ),
          ],
        );
      },
    );
  }
}

class _ProjectShowcase extends StatelessWidget {
  final ProjectItem project;
  final bool imageFirst;

  const _ProjectShowcase({
    required this.project,
    required this.imageFirst,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveContainer(
            maxWidth: width,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: imageFirst
                  ? [
                      _image(constraints),
                      _text(constraints, context),
                    ]
                  : [
                      _text(constraints, context),
                      if (!imageFirst) const SizedBox(width: 25.0),
                      _image(constraints),
                    ],
            ),
          );
        },
      ),
    );
  }

  Widget _image(BoxConstraints constraints) {
    return Expanded(
      flex: constraints.maxWidth > 720.0 ? 1 : 0,
      child: Image.asset(
        project.imagePath,
        width: constraints.maxWidth > 720.0 ? null : 350.0,
      ),
    );
  }

  Widget _text(BoxConstraints constraints, BuildContext context) {
    return Expanded(
      flex: constraints.maxWidth > 720.0 ? 1 : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.category,
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            project.title,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            project.description,
            style: const TextStyle(
              color: kCaptionColor,
              height: 1.5,
              fontSize: 15.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Tech: ${project.techStack}',
            style: TextStyle(
              color: kPrimaryColor.withValues(alpha: 0.8),
              fontSize: 13.0,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 25.0),
          Row(
            children: [
              if (project.playStoreUrl != null)
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
                      child: const Center(
                        child: Text(
                          'PLAY STORE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (project.appStoreUrl != null) ...[
                const SizedBox(width: 10.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    height: 48.0,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'APP STORE',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (!imageFirst) const SizedBox(height: 70.0),
        ],
      ),
    );
  }
}
