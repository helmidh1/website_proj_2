# Modern Flutter Portfolio Website

A premium, responsive portfolio website built with Flutter, featuring a modern "tech-vibe" aesthetic and smooth interactive elements.

## 🚀 Overview

This project is a personal portfolio designed to showcase skills, experience, and projects in a sleek, high-performance web application. It was co-authored with **Antigravity AI** using the **Gemini 3** model, ensuring best practices in Flutter development and modern UI/UX design.

## ✨ Key Features

- **Tech-Centric UI**: A custom-designed interface using **JetBrains Mono** typography for a professional developer aesthetic.
- **Responsive Design**: Fully adaptive layout that scales seamlessly across mobile, tablet, and desktop screens.
- **Interactive Project Cards**: Custom-built project cards with hover-scaling effects and dynamic link interaction.
- **Section Blur Transitions**: Smooth transitions between main sections using a custom-built `SectionBlurDivider`.
- **Skills Showcase**: Visually categorized skills with custom brand icons for Git, GitHub, and more.
- **Contact Integration**: Integrated contact section with email-to-copy functionality and a direct-launching contact form.

## 🛠️ Built With

- **Framework**: [Flutter](https://flutter.dev/)
- **Typography**: [Google Fonts (JetBrains Mono)](https://fonts.google.com/specimen/JetBrains+Mono)
- **Deployment**: [Firebase Hosting](https://firebase.google.com/docs/hosting)
- **Core Libraries**: `url_launcher`, `google_fonts`, `flutter_svg`

## 📂 Project Structure

- `lib/sections/`: Individual components for Introduction, Experience, Projects, Skills, and Contact.
- `lib/data/`: Centralized `PortfolioData` class for easy content management.
- `lib/theme/`: Custom `AppTheme` defining the dark/light modes and "Tech Vibe" typography.
- `lib/widgets/`: Reusable UI components like `ResponsiveLayout` and `SectionBlurDivider`.

## 🚀 Getting Started

To run this project locally:

1.  **Clone the repository**:
    ```bash
    git clone [your-repo-link]
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the application**:
    ```bash
    flutter run -d chrome
    ```

---

_Built with ❤️ and Antigravity AI_
