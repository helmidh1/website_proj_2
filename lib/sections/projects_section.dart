import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_proj_2/data/portfolio_data.dart';
import 'package:website_proj_2/models/data_models.dart';
import 'package:website_proj_2/theme/app_theme.dart';
import 'package:website_proj_2/widgets/responsive_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF0F172A) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 48),
              _buildProjectsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Flex(
      direction: isTablet || isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isTablet || isMobile
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Projects',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'A selection of projects that showcase my skills in action.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        if (isTablet || isMobile) const SizedBox(height: 24),
        InkWell(
          onTap: () => _launchUrl(PortfolioData.githubUrl),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View all projects',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: AppTheme.primaryLight),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                size: 18,
                color: AppTheme.primaryLight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double spacing = 32.0;
        int crossAxisCount = 3;
        if (constraints.maxWidth < 700) {
          crossAxisCount = 1;
        } else if (constraints.maxWidth < 1000) {
          crossAxisCount = 2;
        }

        final double itemWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: PortfolioData.projects.map((project) {
            return SizedBox(
              width: itemWidth,
              child: _buildProjectCard(context, project),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
    return ProjectCard(project: project);
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF020617) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isDark
                      ? (_isHovered ? 0.4 : 0.2)
                      : (_isHovered ? 0.15 : 0.05),
                ),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryLight.withOpacity(0.5)
                  : (isDark
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFE2E8F0)),
              width: _isHovered ? 2 : 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Placeholder / Image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: isDark
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFF1F5F9),
                    child: widget.project.imagePath != null
                        ? Image.asset(
                            widget.project.imagePath!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Icon(
                              Icons.image,
                              size: 48,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tags
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.tags
                            .map((tag) => _ProjectTag(tag: tag))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.project.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      // Actions
                      Row(
                        children: [
                          _ProjectActionLink(
                            label: 'Live Demo',
                            icon: Icons.visibility,
                            onTap: () => _launchUrl(widget.project.demoUrl),
                          ),
                          const SizedBox(width: 24),
                          _ProjectActionLink(
                            label: 'Code',
                            icon: Icons.code,
                            onTap: () => _launchUrl(widget.project.codeUrl),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $urlString');
    }
  }
}

class _ProjectTag extends StatelessWidget {
  final String tag;

  const _ProjectTag({required this.tag});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color bgColor = AppTheme.primaryLight.withOpacity(0.1);
    Color textColor = AppTheme.primaryLight;

    if (tag.contains('C#')) {
      bgColor = Colors.purple.withOpacity(0.1);
      textColor = isDark ? Colors.purple.shade300 : Colors.purple.shade700;
    } else if (tag.contains('Unity')) {
      bgColor = Colors.grey.withOpacity(0.2);
      textColor = isDark ? Colors.grey.shade300 : Colors.grey.shade800;
    } else if (tag.contains('Flutter')) {
      bgColor = Colors.cyan.withOpacity(0.1);
      textColor = isDark ? Colors.cyan.shade300 : Colors.cyan.shade700;
    } else if (tag.contains('Firebase')) {
      bgColor = Colors.orange.withOpacity(0.1);
      textColor = isDark ? Colors.orange.shade300 : Colors.orange.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: textColor.withOpacity(0.2)),
      ),
      child: Text(
        tag,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ProjectActionLink extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ProjectActionLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
