import 'package:flutter/material.dart';
import 'package:website_proj_2/data/portfolio_data.dart';
import 'package:website_proj_2/widgets/responsive_layout.dart';
import 'package:website_proj_2/theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;
  final Function(String) onNavigate;

  const NavBar({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.backgroundDark.withOpacity(0.8)
            : AppTheme.backgroundLight.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(context),
              if (ResponsiveLayout.isDesktop(context)) _buildNavLinks(context),
              _buildActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return InkWell(
      onTap: () => onNavigate('Introduction'),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.code, color: Colors.white, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              PortfolioData.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context) {
    final navItems = [
      'Introduction',
      'Experience',
      'Skills',
      'Projects',
      'Contact',
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: navItems
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: InkWell(
                onTap: () => onNavigate(item),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildActions(BuildContext context) {
    return IconButton(
      icon: Icon(
        isDark ? Icons.light_mode : Icons.dark_mode,
        color: isDark ? AppTheme.primaryLight : AppTheme.primaryDark,
      ),
      onPressed: onThemeToggle,
      style: IconButton.styleFrom(
        backgroundColor: isDark
            ? const Color(0xFF1E293B)
            : const Color(0xFFE2E8F0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
