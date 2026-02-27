import 'package:flutter/material.dart';
import 'package:website_proj_2/data/portfolio_data.dart';
import 'package:website_proj_2/models/data_models.dart';
import 'package:website_proj_2/theme/app_theme.dart';
import 'package:website_proj_2/widgets/responsive_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF0F172A) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 48),
              _buildTimeline(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'My Journey',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'A timeline of my professional career and growth.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      children: PortfolioData.experiences.asMap().entries.map((entry) {
        final isLast = entry.key == PortfolioData.experiences.length - 1;
        return _buildTimelineItem(context, entry.value, isLast);
      }).toList(),
    );
  }

  Widget _buildTimelineItem(BuildContext context, Experience exp, bool isLast) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot
          Container(
            width: 48,
            alignment: Alignment.topCenter,
            child: Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? const Color(0xFF0F172A) : Colors.white,
                  width: 4,
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile) ...[
                  Text(
                    exp.role,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildDurationChip(context, exp.duration),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          exp.role,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _buildDurationChip(context, exp.duration),
                    ],
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  exp.company,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.primaryLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  exp.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDurationChip(BuildContext context, String duration) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.primaryLight.withOpacity(0.1)
            : const Color(0xFFF1F5F9), // Slate-100
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        duration,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isDark ? AppTheme.primaryLight : AppTheme.textSecondaryLight,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
