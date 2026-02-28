import 'package:website_proj_2/models/data_models.dart';

class PortfolioData {
  static const String name = 'Helmi Hernandez';
  static const String fullName = 'Helmi D. Hernandez';
  static const String currentRole =
      'Computer Science Student & Software Developer (USMC Veteran)';
  static const String heroTitle1 = 'Crafting digital ';
  static const String heroTitleHighlight = 'experiences';
  static const String heroTitle2 = ' through code and design.';
  static const String heroSubtitle =
      'I am a Computer Science student at Nova Southeastern University (Expected Graduation: Dec 2027) and a USMC Veteran. My technical journey spans building responsive cross-platform applications with Flutter to crafting interactive experiences through game development on the side.';
  static const String availabilityText = 'Available for new projects';

  static const String email = 'helmi.d.hernandez@gmail.com';
  static const String location = 'Florida, USA';

  static const String linkedinUrl =
      'https://www.linkedin.com/in/helmi-d-hernandez/';
  static const String githubUrl = 'https://github.com/helmidh1';
  static const String websiteUrl = 'https://helmidh.dev';

  static const List<Experience> experiences = [
    Experience(
      role: 'Software Intern – Feature Development',
      company: 'Prodia Technologies',
      duration: 'Dec 2025 - Present',
      description:
          '• Contributed to the development of production-ready healthcare application features at a biotech startup focused on patient–clinician connectivity.\n• Developed and deployed new web app features using Flutter, following production design specifications.\n• Designed and modified Firebase data models to support new feature functionality and evolving product requirements.\n• Improved UI flows and user workflows to better align with real-world clinic operations.\n• Gained exposure to HIPAA-compliant development practices and secure healthcare data handling.',
    ),
    Experience(
      role: 'Junior Immersive Simulation Technologist',
      company: 'Nova Southeastern University (NSU)',
      duration: 'January 2025 - May 2025',
      description:
          '• Spearheaded the technical operations for immersive classroom environments, directly supporting the hands-on medical training of NSU students.\n• Configured, maintained, and optimized state-of-the-art virtual reality equipment to guarantee seamless, high-fidelity simulations.\n• Managed software lifecycle operations, performing regular updates and proactive troubleshooting to ensure zero downtime during critical training sessions.\n• Implemented robust tracking protocols to manage hardware inventory and equipment readiness.',
    ),
    Experience(
      role: 'Data Analyst',
      company: 'Hewlett Packard Enterprise (HPE)',
      duration: 'April 2024 - June 2024',
      description:
          '• Engineered comprehensive data visualization pipelines and detailed analytical reports from complex, high-volume datasets.\n• Leveraged a modern Python data stack (Jupyter, NumPy, Pandas, Matplotlib, Seaborn) to uncover and present key metrics.\n• Translated raw data into actionable, strategic insights to drive informed business decisions and operational efficiency.',
    ),
    Experience(
      role: 'Tire Service Technician',
      company: 'Discount Tire',
      duration: 'January 2023 - March 2024',
      description:
          '• Executed high-precision automotive maintenance, specializing in tire and wheel installations, balancing, and repairs.\n• Maintained a rigorous focus on quality control and safety standards, directly contributing to high customer satisfaction ratings.\n• Demonstrated strong technical problem-solving skills in a fast-paced, demanding operational environment.',
    ),
    Experience(
      role: 'Game Development Student',
      company: 'Miami Dade College (MDC)',
      duration: 'January 2020 - May 2022',
      description:
          '• Engaged in intensive study of modern programming paradigms and game design methodologies.\n• Collaborated on cross-functional teams to design, develop, and test interactive software and game-based simulations.\n• Gained practical, hands-on experience utilizing industry-standard game development tools and languages.',
    ),
    Experience(
      role: 'Jet Engine Mechanic',
      company: 'United States Marine Corps',
      duration: 'February 2015 - December 2019',
      description:
          '• Conducted critical, high-stakes inspections, maintenance, and complex repairs on F402B jet propulsion systems.\n• Executed comprehensive preventative maintenance schedules and advanced troubleshooting to ensure mission-critical operational readiness.\n• Demonstrated exceptional discipline, leadership, and technical precision under pressure as an active-duty enlisted service member.',
    ),
  ];

  static const List<Skill> skills = [
    Skill(name: 'Python', icon: 'python', category: 'Programming'),
    Skill(name: 'Java', icon: 'java', category: 'Programming'),
    Skill(name: 'C#', icon: 'csharp', category: 'Programming'),
    Skill(name: 'C++', icon: 'cpp', category: 'Programming'),
    Skill(name: 'Dart', icon: 'dart', category: 'Programming'),

    Skill(name: 'Flutter', icon: 'flutter', category: 'Web & App'),
    Skill(name: 'Firebase', icon: 'firebase', category: 'Web & App'),
    Skill(name: 'Google Cloud', icon: 'gcp', category: 'Web & App'),
    Skill(name: 'Figma', icon: 'figma', category: 'Web & App'),
    Skill(name: 'HTML5', icon: 'html', category: 'Web & App'),
    Skill(name: 'CSS3', icon: 'css', category: 'Web & App'),

    Skill(name: 'Unity', icon: 'unity', category: 'Game Dev'),
    Skill(name: 'Blender', icon: 'blender', category: 'Game Dev'),

    Skill(name: 'Git', icon: 'git', category: 'Other'),
    Skill(name: 'GitHub', icon: 'github', category: 'Other'),
    Skill(name: 'SQL', icon: 'sql', category: 'Other'),
    Skill(name: 'PostgreSQL', icon: 'postgresql', category: 'Other'),
  ];

  static const List<Project> projects = [
    Project(
      title: 'Character Controller',
      description:
          'A responsive Unity character controller with state machine architecture. Features fluid movement mechanics including walking, jumping, and wall traversal.',
      tags: ['C#', 'Unity', 'Git'],
      demoUrl: 'https://alerio.itch.io/custom-controller-1',
      codeUrl: 'https://github.com/helmidh1/mov_proj_1',
      imagePath: 'assets/projects/unity_pic_1.png',
    ),
    Project(
      title: 'Inventory System',
      description:
          'A scalable Unity inventory system using Scriptable Objects. Designed for modularity and seamless data-driven item management.',
      tags: ['C#', 'Unity', 'Git'],
      demoUrl: 'https://alerio.itch.io/inventory-system-1',
      codeUrl: 'https://github.com/helmidh1/proj_farm',
      imagePath: 'assets/projects/unity_pic_2.png',
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'A premium, responsive web portfolio built with Flutter and Dart, co-authored with Antigravity AI using Gemini 3. Designed in Figma and deployed on Firebase.',
      tags: ['Dart', 'Flutter', 'Firebase', 'Figma'],
      demoUrl: 'https://helmidh.dev/',
      codeUrl: 'https://github.com/helmidh1/website_proj_2',
      imagePath: 'assets/projects/flutter_firebase.png',
    ),
  ];
}
