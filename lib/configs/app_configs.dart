class AppConfigs {
  static const String appName = 'مداد';
  static const String baseDomin = 'https://app.codeexpert.site';
  static const String baseUrl = '$baseDomin/api';
  static const String topic = 'general';
  static const Duration period = Duration(seconds: 1);
  static const int perPage = 10;

  static const int newsTypeId = 2; // اعلان

  // Terms of Service link
  static const String termsOfServiceUrl =
      'https://your-terms-of-service-url.com';
  // Privacy Policy link
  static const String privacyPolicyUrl = '$baseDomin/privacy-policy';

  // font family
  static const String fontFamily = 'Cairo';
  static const defaultLocale = 'ar';
  static final supportedLocales = [
    {'locale': 'ar', 'name': 'عربي', 'icon': '🇵🇸'},
    {'locale': 'en', 'name': 'English', 'icon': '🇺🇸'},
  ];

  // static List<String> pagesWithoutNavBar = [
  //   // AppRoutes.courses.path,
  //   // AppRoutes.consultations.path,
  //   AppRoutes.courseDetail.name,
  //   AppRoutes.lesson.name,
  // ];
}
