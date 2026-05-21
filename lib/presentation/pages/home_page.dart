import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_portfolio/core/constants/app_constants.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_bloc.dart';
import 'package:web_portfolio/presentation/bloc/portfolio/portfolio_state.dart';
import 'package:web_portfolio/presentation/widgets/education_section.dart';
import 'package:web_portfolio/presentation/widgets/experience_section.dart';
import 'package:web_portfolio/presentation/widgets/footer_section.dart';
import 'package:web_portfolio/presentation/widgets/header_section.dart';
import 'package:web_portfolio/presentation/widgets/hero_section.dart';
import 'package:web_portfolio/presentation/widgets/project_showcase_section.dart';
import 'package:web_portfolio/presentation/widgets/services_section.dart';
import 'package:web_portfolio/presentation/widgets/skills_section.dart';
import 'package:web_portfolio/presentation/widgets/stats_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state.status == PortfolioStatus.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        }

        return Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final items = headerItems;
                    return items[index].isButton
                        ? MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kDangerColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: TextButton(
                                onPressed: items[index].onTap ?? () {},
                                child: Text(
                                  items[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : ListTile(
                            title: Text(
                              items[index].title,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10.0);
                  },
                  itemCount: headerItems.length,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(scaffoldKey: _scaffoldKey),
                const HeroSection(),
                const SizedBox(height: 20.0),
                const ServicesSection(),
                const SizedBox(height: 70.0),
                const ProjectShowcaseSection(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 28.0),
                  child: StatsSection(),
                ),
                const SizedBox(height: 50.0),
                const ExperienceSection(),
                const SizedBox(height: 50.0),
                const EducationSection(),
                const SizedBox(height: 50.0),
                const SkillsSection(),
                const SizedBox(height: 50.0),
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
