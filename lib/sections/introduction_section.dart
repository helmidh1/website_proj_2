import 'dart:math';
import 'package:flutter/material.dart';
import 'package:website_proj_2/data/portfolio_data.dart';
import 'package:website_proj_2/theme/app_theme.dart';
import 'package:website_proj_2/widgets/responsive_layout.dart';

class IntroductionSection extends StatefulWidget {
  final Function(String) onNavigate;
  const IntroductionSection({super.key, required this.onNavigate});

  @override
  State<IntroductionSection> createState() => _IntroductionSectionState();
}

class _IntroductionSectionState extends State<IntroductionSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate dynamic animated alignments
        final angle1 = _controller.value * 2 * pi;
        final angle2 = (_controller.value + 0.5) * 2 * pi;

        final align1 = Alignment(cos(angle1), sin(angle1));
        final align2 = Alignment(cos(angle2), sin(angle2));

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: align1,
              end: align2,
              colors: isDark
                  ? [
                      const Color(0xFF0F172A),
                      const Color(0xFF1E293B),
                      const Color(0xFF0B1120),
                    ]
                  : [
                      const Color(0xFFF1F5F9),
                      const Color(0xFFE2E8F0),
                      const Color(0xFFFFFFFF),
                    ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: ResponsiveLayout(
                mobile: _buildContent(context, isMobile: true),
                tablet: _buildContent(context, isMobile: false),
                desktop: _buildContent(context, isMobile: false),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, {required bool isMobile}) {
    return Center(
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMainHeading(context, isMobile: isMobile),
          const SizedBox(height: 24),
          _buildSubtitle(context),
          const SizedBox(height: 32),
          _buildActionButtons(context, isMobile: isMobile),
        ],
      ),
    );
  }

  Widget _buildMainHeading(BuildContext context, {required bool isMobile}) {
    final style = isMobile
        ? Theme.of(context).textTheme.displaySmall
        : Theme.of(context).textTheme.displayLarge;

    return RichText(
      textAlign: isMobile ? TextAlign.left : TextAlign.center,
      text: TextSpan(
        style: style?.copyWith(height: 1.1),
        children: [
          TextSpan(text: PortfolioData.heroTitle1),
          TextSpan(
            text: PortfolioData.heroTitleHighlight,
            style: style?.copyWith(color: AppTheme.primaryLight),
          ),
          TextSpan(text: PortfolioData.heroTitle2),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Text(
        PortfolioData.heroSubtitle,
        textAlign: isMobile ? TextAlign.left : TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, {required bool isMobile}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => widget.onNavigate('Projects'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryLight,
            foregroundColor: AppTheme.textPrimaryLight,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
          ),
          child: const Text(
            'View Projects',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        OutlinedButton(
          onPressed: () => widget.onNavigate('Contact'),
          style: OutlinedButton.styleFrom(
            foregroundColor: isDark ? Colors.white : AppTheme.textPrimaryLight,
            side: BorderSide(
              color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: isDark
                ? const Color(0xFF0F172A).withOpacity(0.6)
                : Colors.white,
          ),
          child: const Text(
            'Contact Me',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
