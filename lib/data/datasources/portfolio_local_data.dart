import 'package:web_portfolio/domain/entities/career_item.dart';
import 'package:web_portfolio/domain/entities/education_item.dart';
import 'package:web_portfolio/domain/entities/experience_item.dart';
import 'package:web_portfolio/domain/entities/footer_contact.dart';
import 'package:web_portfolio/domain/entities/project_item.dart';
import 'package:web_portfolio/domain/entities/skill_item.dart';
import 'package:web_portfolio/domain/entities/stat_item.dart';

/// Static local data source containing all of Hanif Uddin's portfolio data.
class PortfolioLocalData {
  // ── Services ────────────────────────────────────────────
  static const List<CareerItem> services = [
    CareerItem(
      title: 'MOBILE DEV',
      imagePath: 'assets/develop.png',
      subtitle:
          'Building high-performance, cross-platform mobile apps for iOS & Android using Flutter with clean, maintainable code.',
    ),
    CareerItem(
      title: 'API INTEGRATION',
      imagePath: 'assets/design.png',
      subtitle:
          'Integrating REST APIs, GraphQL, and real-time communication with Socket.IO & WebRTC for seamless data flow.',
    ),
    CareerItem(
      title: 'STATE MGMT',
      imagePath: 'assets/write.png',
      subtitle:
          'Expert in GetX & Flutter BLoC for scalable state management following MVC, MVVM, and Clean Architecture.',
    ),
    CareerItem(
      title: 'DEPLOYMENT',
      imagePath: 'assets/promote.png',
      subtitle:
          'End-to-end app deployment on App Store & Play Store using GitHub Actions, FVM, and CI/CD pipelines.',
    ),
  ];

  // ── Projects ────────────────────────────────────────────
  static const List<ProjectItem> projects = [
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'QUANTUM\nPOSSIBILITIES',
      description:
          'A social networking platform enabling millions to connect, share feelings with text, photos, videos, live streaming & interact via reactions, comments, and receive notifications.',
      imagePath: 'assets/ios.png',
      appStoreUrl: 'https://apps.apple.com/ae/app/qposs/id6753131108',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.quanumpossibilities.qp',
      techStack: 'MVC, GetX, REST API, Socket.IO, RTMP, Crypto Wallet, FCM, Deep Link',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'QP\nMESSENGER',
      description:
          'A real-time messaging platform supporting one-to-one and group chats, multimedia sharing, voice calling, video calling and presence indicators.',
      imagePath: 'assets/laptop.png',
      appStoreUrl: 'https://apps.apple.com/ae/app/qposs-messenger/id6753579477',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.qp.messenger',
      techStack: 'MVC, GetX, REST API, Socket.IO, WebRTC, Method Channel, FCM',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'AUSTTAA',
      description:
          'A cross-platform Flutter app connecting alumni for networking, job opportunities, and event participation with real-time chat and push notifications.',
      imagePath: 'assets/ios.png',
      playStoreUrl: 'https://surl.li/mumvnt',
      techStack: 'Flutter, GetX, REST API, Firebase (FCM & Firestore), SQLite',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'SHOPY\nSWISS',
      description:
          'A feature-rich e-commerce platform providing seamless shopping experience with product listings, shopping cart, payment gateway integration, and order tracking.',
      imagePath: 'assets/laptop.png',
      playStoreUrl: 'https://surl.lt/csekbf',
      techStack: 'CLEAN, Flutter, Bloc, REST API, Firebase, SQLite',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'KAMBAII',
      description:
          'A Flutter-based healthcare app designed to support service delivery and interaction for medical professionals across iOS and Android.',
      imagePath: 'assets/ios.png',
      playStoreUrl: 'https://surl.li/rsbail',
      techStack: 'Flutter, Bloc, REST API, Firebase, SQLite',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'CRM APP',
      description:
          'A productivity-focused CRM mobile app for scheduling client visits, managing tasks, tracking activities with data visualization using charts.',
      imagePath: 'assets/laptop.png',
      techStack: 'Flutter, Clean Architecture, BLoC, REST API, SQLite, Charts',
    ),
    ProjectItem(
      category: 'FLUTTER APP',
      title: 'MEME\nVERSE',
      description:
          'A fun social media platform for creating, sharing, and exploring memes with AI-powered captioning, personalized feeds, and real-time notifications.',
      imagePath: 'assets/ios.png',
      techStack:
          'Flutter, Clean Architecture, BLoC, Firebase, Supabase, Vertex AI, Genkit',
    ),
  ];

  // ── Stats ───────────────────────────────────────────────
  static const List<StatItem> stats = [
    StatItem(count: '3+', label: 'Years\nExperience'),
    StatItem(count: '10+', label: 'Projects'),
    StatItem(count: '6+', label: 'Apps\nDeployed'),
    StatItem(count: '2', label: 'Flutter\nPackages'),
  ];

  // ── Education ───────────────────────────────────────────
  static const List<EducationItem> education = [
    EducationItem(
      institution: 'Bangladesh University of Engineering and Technology (BUET)',
      degree: 'Master of Science (MSc) in Communication and Signal Processing',
      period: '2022 – PRESENT',
      description:
          'Pursuing advanced research in Communication and Signal Processing at one of Bangladesh\'s most prestigious engineering universities.',
    ),
    EducationItem(
      institution: 'Premier University, Chittagong (PUC)',
      degree: 'Bachelor of Science (BSc) in Electrical and Electronic Engineering',
      period: '2011 – 2016',
      grade: 'CGPA: 3.21',
      description:
          'Completed undergraduate studies in Electrical and Electronic Engineering with a strong foundation in programming and systems design.',
    ),
    EducationItem(
      institution: 'Chittagong Collegiate School and College',
      degree: 'Higher Secondary School Certificate (HSC) in Science',
      period: '2008 – 2010',
      grade: 'CGPA: 4.80',
      description:
          'Completed higher secondary education with distinction in Science.',
    ),
  ];

  // ── Skills ──────────────────────────────────────────────
  static const List<SkillItem> skills = [
    SkillItem(name: 'Dart', percentage: 95),
    SkillItem(name: 'Flutter', percentage: 92),
    SkillItem(name: 'REST API / GraphQL', percentage: 88),
    SkillItem(name: 'Firebase / Supabase', percentage: 82),
    SkillItem(name: 'GetX', percentage: 88),
    SkillItem(name: 'Flutter BLoC', percentage: 85),
    SkillItem(name: 'Socket.IO / WebRTC', percentage: 75),
    SkillItem(name: 'Git / CI-CD', percentage: 80),
  ];

  // ── Experience ──────────────────────────────────────────
  static const List<ExperienceItem> experience = [
    ExperienceItem(
      role: 'Mid Mobile App Developer (Sr Executive)',
      company: 'Pakiza Software Limited',
      period: 'June 2024 – Present',
      highlights: [
        'Developed cross-platform apps: Quantum Possibilities (Social Media), Austtaa, CTG Was, and CRM.',
        'Optimized app performance through bug fixing, feature integration and requirement analysis.',
        'Collaborating with cross-functional teams including PMs, UI/UX designers, and backend developers.',
      ],
    ),
    ExperienceItem(
      role: 'Mobile App Developer (Software Engineer)',
      company: 'Dinnova AG Ltd.',
      period: 'Jan 2024 – May 2024',
      highlights: [
        'Developed Shopy-Swiss (E-Commerce) and Shine (Dating App) for iOS and Android.',
        'Integrated push notifications, shopping carts, and order tracking for seamless UX.',
        'Conducted bug fixes, performance optimization, and requirements analysis.',
      ],
    ),
    ExperienceItem(
      role: 'Junior Mobile App Developer',
      company: 'CRID USA Ltd.',
      period: 'Sep 2022 – Dec 2023',
      highlights: [
        'Designed and developed the Kambaii Health Provider Application using Flutter.',
        'Implemented key features to enhance healthcare provider functionalities.',
        'Performed bug fixing, performance optimization, and requirements analysis.',
      ],
    ),
  ];

  // ── Contact / Footer ───────────────────────────────────
  static const List<FooterContact> contacts = [
    FooterContact(
      iconPath: 'assets/mappin.png',
      title: 'ADDRESS',
      text1: '2no Road, Chad Uddan',
      text2: 'Dhaka, Bangladesh',
    ),
    FooterContact(
      iconPath: 'assets/phone.png',
      title: 'PHONE',
      text1: '+8801963978074',
      text2: '',
    ),
    FooterContact(
      iconPath: 'assets/email.png',
      title: 'EMAIL',
      text1: 'hanifuddin.dev@gmail.com',
      text2: '',
    ),
    FooterContact(
      iconPath: 'assets/whatsapp.png',
      title: 'WHATSAPP',
      text1: '+8801963978074',
      text2: '',
    ),
  ];
}
