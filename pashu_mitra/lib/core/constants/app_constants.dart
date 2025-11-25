
class AppConstants {
  // 🔥 Firebase Collections
  static const String usersCollection = 'users';
  static const String farmProfilesCollection = 'farm_profiles';
  static const String trainingCollection = 'training_modules';
  static const String complianceCollection = 'compliance_tasks';
  static const String alertsCollection = 'alerts';
  static const String riskAssessmentCollection = 'risk_assessments';

  // 🌐 API URLs (if you integrate REST later)
  static const String baseUrl = 'https://api.pashumitra.in';

  // 🧭 Navigation Routes
  static const String routeLogin = '/login';
  static const String routeSignup = '/signup';
  static const String routeHome = '/home';
  static const String routeFarmProfile = '/farmProfile';
  static const String routeReports = '/reports';
  static const String routeCompliance = '/compliance';
  static const String routeTraining = '/training';
  static const String routeRiskAssessment = '/riskAssessment';

  // 💬 Text Strings (for localization or reuse)
  static const String appName = 'PashuMitra';
  static const String tagline = 'Your Smart Biosecurity Assistant';
  static const String emptyDataMessage = 'No data available';
  static const String loadingMessage = 'Loading...';
  static const String errorMessage = 'Something went wrong. Please try again later.';

  // 🎨 Padding & Spacing
  static const double defaultPadding = 16.0;
  static const double cardRadius = 12.0;
  static const double elementSpacing = 10.0;

  // 📱 UI Durations
  static const Duration animationDuration = Duration(milliseconds: 300);

  // 🧩 Default Assets
  static const String logoPath = 'assets/images/logo.png';
  static const String defaultProfilePic = 'assets/images/default_avatar.png';
  static const String farmPlaceholder = 'assets/images/farm_placeholder.png';

  // ✅ Validation Rules
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static const int minPasswordLength = 6;

  // 🌙 Theme Identifiers
  static const String themeLight = 'light';
  static const String themeDark = 'dark';
}
