class Experience {
  final String role;
  final String company;
  final String duration;
  final String description;

  const Experience({
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });
}

class Skill {
  final String name;
  final String icon; // Path to SVG or Material Icon name wrapper
  final String category;

  const Skill({required this.name, required this.icon, required this.category});
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String demoUrl;
  final String codeUrl;
  final String? imagePath;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.demoUrl,
    required this.codeUrl,
    this.imagePath,
  });
}
