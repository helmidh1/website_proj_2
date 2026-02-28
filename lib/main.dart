import 'package:flutter/material.dart';
import 'package:website_proj_2/theme/app_theme.dart';
import 'package:website_proj_2/widgets/navbar.dart';
import 'package:website_proj_2/sections/introduction_section.dart';
import 'package:website_proj_2/sections/experience_section.dart';
import 'package:website_proj_2/sections/skills_section.dart';
import 'package:website_proj_2/sections/projects_section.dart';
import 'package:website_proj_2/sections/contact_section.dart';
import 'package:website_proj_2/widgets/section_divider.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDark = true;
  final ScrollController _scrollController = ScrollController();

  // Keys for scrolling to sections
  final Map<String, GlobalKey> _sectionKeys = {
    'Introduction': GlobalKey(),
    'Experience': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionName) {
    if (sectionName == 'Introduction') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return;
    }

    final key = _sectionKeys[sectionName];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        alignment:
            0.1, // Offset slightly so it's not stick to the very top behind navbar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helmi Hernandez - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        // Use AnimatedTheme for smooth transitions
        return AnimatedTheme(
          data: _isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
          duration: const Duration(milliseconds: 300),
          child: child!,
        );
      },
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: SelectionArea(
                child: Column(
                  children: [
                    const SizedBox(height: 70), // Space for fixed navbar
                    IntroductionSection(
                      key: _sectionKeys['Introduction'],
                      onNavigate: _scrollToSection,
                    ),
                    const SectionBlurDivider(),
                    ExperienceSection(key: _sectionKeys['Experience']),
                    SkillsSection(key: _sectionKeys['Skills']),
                    ProjectsSection(key: _sectionKeys['Projects']),
                    ContactSection(key: _sectionKeys['Contact']),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavBar(
                isDark: _isDark,
                onThemeToggle: () {
                  setState(() {
                    _isDark = !_isDark;
                  });
                },
                onNavigate: _scrollToSection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
