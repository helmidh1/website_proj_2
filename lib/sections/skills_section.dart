import 'package:flutter/material.dart';
import 'package:website_proj_2/data/portfolio_data.dart';
import 'package:website_proj_2/models/data_models.dart';
import 'package:website_proj_2/theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF020617) : AppTheme.backgroundLight,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 48),
              _buildSkillsGrid(context),
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
          'Skills & Expertise',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'The tools and technologies I use to bring ideas to life.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: PortfolioData.skills.map((skill) {
          return _buildSkillCard(context, skill);
        }).toList(),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, Skill skill) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onHover: (hovered) {
            // Apply slight lift animation
          },
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _getIconForSkill(skill.icon, isDark),
                const SizedBox(width: 12),
                Text(
                  skill.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Mapping placeholder string icons to material icons for visual similarity to designs
  // In a real production app, SVG assets from a generated folder should be used.
  Widget _getIconForSkill(String iconName, bool isDark) {
    IconData iconData;
    Color color;

    switch (iconName) {
      case 'html':
        iconData = Icons.html;
        color = Colors.orange;
        break;
      case 'css':
        iconData = Icons.css;
        color = Colors.blue;
        break;
      case 'javascript':
        iconData = Icons.javascript;
        color = Colors.yellow.shade700;
        break;
      case 'flutter':
        iconData = Icons.flutter_dash;
        color = const Color(0xFF02569B);
        break;
      case 'dart':
        iconData = Icons.send;
        color = const Color(0xFF0175C2); // Modern Dart blue
        break;
      case 'firebase':
        iconData = Icons.local_fire_department;
        color = const Color(0xFFFFCA28);
        break;
      case 'gcp':
        iconData = Icons.cloud_done;
        color = const Color(0xFF4285F4);
        break;
      case 'figma':
        iconData = Icons.brush;
        color = const Color(0xFFF24E1E);
        break;
      case 'unity':
        iconData = Icons.view_in_ar;
        color = isDark ? Colors.white : Colors.black87;
        break;
      case 'blender':
        iconData = Icons.threed_rotation;
        color = const Color(0xFFF5792A);
        break;
      case 'git':
        return Image.asset(
          'assets/icons/git_icon.png',
          width: 40,
          height: 40,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          isAntiAlias: true,
        );
      case 'github':
        return Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(0.5), // Tiny padding to soften edges
          alignment: Alignment.center,
          child: Image.asset(
            'assets/icons/github_icon.png',
            fit: BoxFit.contain,
            color: const Color(0xFF9C27B0),
            filterQuality: FilterQuality.medium,
            isAntiAlias: true,
          ),
        );
      case 'sql':
        iconData = Icons.table_chart;
        color = const Color(0xFF4479A1);
        break;
      case 'postgresql':
        iconData = Icons.dns;
        color = const Color(0xFF336791);
        break;
      case 'python':
        iconData = Icons.terminal;
        color = const Color(0xFF3776AB);
        break;
      case 'java':
        iconData = Icons.free_breakfast;
        color = const Color(0xFF007396);
        break;
      case 'cpp':
        iconData = Icons.memory;
        color = const Color(0xFF00599C);
        break;
      case 'csharp':
        iconData = Icons.code;
        color = const Color(0xFF512BD4);
        break;
      default:
        iconData = Icons.code;
        color = AppTheme.primaryLight;
    }

    return Icon(iconData, size: 40, color: color);
  }
}
