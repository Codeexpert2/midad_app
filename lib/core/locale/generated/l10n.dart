// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `مداد`
  String get appName {
    return Intl.message(
      'مداد',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `سياسة الاستخدام`
  String get termsConditions {
    return Intl.message(
      'سياسة الاستخدام',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `سياسة الخصوصية`
  String get privacyPolicy {
    return Intl.message(
      'سياسة الخصوصية',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `قائمة التشغيل`
  String get playlist {
    return Intl.message(
      'قائمة التشغيل',
      name: 'playlist',
      desc: '',
      args: [],
    );
  }

  /// `حول`
  String get about {
    return Intl.message(
      'حول',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `الإعدادات`
  String get settings {
    return Intl.message(
      'الإعدادات',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `خطأ`
  String get error {
    return Intl.message(
      'خطأ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `نجاح`
  String get success {
    return Intl.message(
      'نجاح',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `معلومة`
  String get info {
    return Intl.message(
      'معلومة',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `تحذير`
  String get warning {
    return Intl.message(
      'تحذير',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `إبلاغ`
  String get report {
    return Intl.message(
      'إبلاغ',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `نوع البلاغ`
  String get reportType {
    return Intl.message(
      'نوع البلاغ',
      name: 'reportType',
      desc: '',
      args: [],
    );
  }

  /// `الرابط`
  String get link {
    return Intl.message(
      'الرابط',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `إعادة المحاولة`
  String get retry {
    return Intl.message(
      'إعادة المحاولة',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `(اختياري)`
  String get optional {
    return Intl.message(
      '(اختياري)',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `ملفات مرفقة`
  String get attachments {
    return Intl.message(
      'ملفات مرفقة',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `المساعدة في الحساب`
  String get accountHelp {
    return Intl.message(
      'المساعدة في الحساب',
      name: 'accountHelp',
      desc: '',
      args: [],
    );
  }

  /// `استفسار عن المحتوى`
  String get contentInquiry {
    return Intl.message(
      'استفسار عن المحتوى',
      name: 'contentInquiry',
      desc: '',
      args: [],
    );
  }

  /// `الدعم الفني`
  String get techSupport {
    return Intl.message(
      'الدعم الفني',
      name: 'techSupport',
      desc: '',
      args: [],
    );
  }

  /// `الإبلاغ عن مشكلة`
  String get reportProblem {
    return Intl.message(
      'الإبلاغ عن مشكلة',
      name: 'reportProblem',
      desc: '',
      args: [],
    );
  }

  /// `طلب ميزة جديدة`
  String get requestFeature {
    return Intl.message(
      'طلب ميزة جديدة',
      name: 'requestFeature',
      desc: '',
      args: [],
    );
  }

  /// `آخر`
  String get other {
    return Intl.message(
      'آخر',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get phone {
    return Intl.message(
      'الهاتف',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهاتف`
  String get phoneNumber {
    return Intl.message(
      'رقم الهاتف',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقم هاتفك`
  String get enterYourPhoneNumber {
    return Intl.message(
      'أدخل رقم هاتفك',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `أدخل رقمًا صالحًا`
  String get enterValidNumber {
    return Intl.message(
      'أدخل رقمًا صالحًا',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `المتابعة كـ زائر`
  String get continueAsGuest {
    return Intl.message(
      'المتابعة كـ زائر',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `سجل الدخول`
  String get login {
    return Intl.message(
      'سجل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get loginButton {
    return Intl.message(
      'تسجيل الدخول',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً وسهلاً بعودتكم!`
  String get welcomeBack {
    return Intl.message(
      'أهلاً وسهلاً بعودتكم!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get noAccountQuestion {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'noAccountQuestion',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل`
  String get passwordLowerCaseRequired {
    return Intl.message(
      'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل',
      name: 'passwordLowerCaseRequired',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل`
  String get passwordUpperCaseRequired {
    return Intl.message(
      'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل',
      name: 'passwordUpperCaseRequired',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تحتوي على رقم واحد على الأقل`
  String get passwordNumberRequired {
    return Intl.message(
      'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل',
      name: 'passwordNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تحتوي على رموز خاصة`
  String get passwordCharsRequired {
    return Intl.message(
      'كلمة المرور يجب أن تحتوي على رموز خاصة',
      name: 'passwordCharsRequired',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير كلمة المرور`
  String get passwordChanged {
    return Intl.message(
      'تم تغيير كلمة المرور',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `تم إعادة تعيين كلمة المرور بنجاح. انقر أدناه لتسجيل الدخول.`
  String get passwordResetSuccess {
    return Intl.message(
      'تم إعادة تعيين كلمة المرور بنجاح. انقر أدناه لتسجيل الدخول.',
      name: 'passwordResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get newPassword {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة يجب أن تختلف عن كلمات المرور التي تم استخدامها سابقًا.`
  String get newPasswordMustDiffer {
    return Intl.message(
      'كلمة المرور الجديدة يجب أن تختلف عن كلمات المرور التي تم استخدامها سابقًا.',
      name: 'newPasswordMustDiffer',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور القديمة`
  String get oldPassword {
    return Intl.message(
      'كلمة المرور القديمة',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كلمة المرور القديمة`
  String get enterOldPassword {
    return Intl.message(
      'أدخل كلمة المرور القديمة',
      name: 'enterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور القديمة مطلوبة`
  String get oldPasswordRequired {
    return Intl.message(
      'كلمة المرور القديمة مطلوبة',
      name: 'oldPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد معلومات الحساب`
  String get confirmAccountInfo {
    return Intl.message(
      'تأكيد معلومات الحساب',
      name: 'confirmAccountInfo',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور`
  String get confirmPassword {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `أدخل كلمة المرور مرة ثانية`
  String get enterPasswordAgain {
    return Intl.message(
      'أدخل كلمة المرور مرة ثانية',
      name: 'enterPasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور المؤكدة مطلوبة`
  String get confirmPasswordRequired {
    return Intl.message(
      'كلمة المرور المؤكدة مطلوبة',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير متطابقة`
  String get passwordNotMatch {
    return Intl.message(
      'كلمة المرور غير متطابقة',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `تغيير كلمة المرور`
  String get changePassword {
    return Intl.message(
      'تغيير كلمة المرور',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `ادخل البريد الإلكتروني`
  String get enterEmail {
    return Intl.message(
      'ادخل البريد الإلكتروني',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `ارسل بريد التحقق`
  String get sendVerificationEmail {
    return Intl.message(
      'ارسل بريد التحقق',
      name: 'sendVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور؟`
  String get forgotPassword {
    return Intl.message(
      'نسيت كلمة المرور؟',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `سيصلك رابط التحقق على البريد الالكتروني.`
  String get resetPasswordInstructions {
    return Intl.message(
      'سيصلك رابط التحقق على البريد الالكتروني.',
      name: 'resetPasswordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `تفقد بريدك الإلكتروني`
  String get checkEmail {
    return Intl.message(
      'تفقد بريدك الإلكتروني',
      name: 'checkEmail',
      desc: '',
      args: [],
    );
  }

  /// `تم إرسال رابط إعادة تعيين كلمة المرور إلى عنوان البريد الالكتروني `
  String get resetPassword {
    return Intl.message(
      'تم إرسال رابط إعادة تعيين كلمة المرور إلى عنوان البريد الالكتروني ',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `فتح تطبيق البريد الإلكتروني`
  String get openEmailApp {
    return Intl.message(
      'فتح تطبيق البريد الإلكتروني',
      name: 'openEmailApp',
      desc: '',
      args: [],
    );
  }

  /// `لم تستلم البريد الرابط؟`
  String get notReceivedEmail {
    return Intl.message(
      'لم تستلم البريد الرابط؟',
      name: 'notReceivedEmail',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لإعادة الإرسال`
  String get resendLink {
    return Intl.message(
      'اضغط لإعادة الإرسال',
      name: 'resendLink',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get backToLogin {
    return Intl.message(
      'تسجيل الدخول',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get aboutApp {
    return Intl.message(
      'عن التطبيق',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get createNewAccount {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `هل قمت بالتسجيل سابقًا؟`
  String get alreadyRegisteredQuestion {
    return Intl.message(
      'هل قمت بالتسجيل سابقًا؟',
      name: 'alreadyRegisteredQuestion',
      desc: '',
      args: [],
    );
  }

  /// `الاسم*`
  String get name {
    return Intl.message(
      'الاسم*',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `ادخل الاسم`
  String get enterName {
    return Intl.message(
      'ادخل الاسم',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `ادخل اسمك بالكامل`
  String get enterYourName {
    return Intl.message(
      'ادخل اسمك بالكامل',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `ادخل اسم صحيح`
  String get enterValidName {
    return Intl.message(
      'ادخل اسم صحيح',
      name: 'enterValidName',
      desc: '',
      args: [],
    );
  }

  /// `الاسم قصير جدا`
  String get nameTooShort {
    return Intl.message(
      'الاسم قصير جدا',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني*`
  String get emailOrPhoneNumber {
    return Intl.message(
      'البريد الإلكتروني*',
      name: 'emailOrPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `ادخل البريد الإلكتروني`
  String get enterEmailOrPhone {
    return Intl.message(
      'ادخل البريد الإلكتروني',
      name: 'enterEmailOrPhone',
      desc: '',
      args: [],
    );
  }

  /// `ادخل بريدك الإلكتروني`
  String get enterYourEmail {
    return Intl.message(
      'ادخل بريدك الإلكتروني',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `ادخل بريد إلكتروني صحيح`
  String get enterValidEmail {
    return Intl.message(
      'ادخل بريد إلكتروني صحيح',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور*`
  String get password {
    return Intl.message(
      'كلمة المرور*',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `ادخل كلمة المرور`
  String get enterPassword {
    return Intl.message(
      'ادخل كلمة المرور',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل`
  String get passwordLength {
    return Intl.message(
      'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور مطلوبة`
  String get passwordRequired {
    return Intl.message(
      'كلمة المرور مطلوبة',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور قصيرة جداً`
  String get passwordTooShort {
    return Intl.message(
      'كلمة المرور قصيرة جداً',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير صالحة`
  String get passwordNotValid {
    return Intl.message(
      'كلمة المرور غير صالحة',
      name: 'passwordNotValid',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء الحساب`
  String get createAccount {
    return Intl.message(
      'إنشاء الحساب',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `تواصل معنا`
  String get contactus {
    return Intl.message(
      'تواصل معنا',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get title {
    return Intl.message(
      'العنوان',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `أدخل العنوان`
  String get enterTitle {
    return Intl.message(
      'أدخل العنوان',
      name: 'enterTitle',
      desc: '',
      args: [],
    );
  }

  /// `العنوان مطلوب`
  String get titleRequired {
    return Intl.message(
      'العنوان مطلوب',
      name: 'titleRequired',
      desc: '',
      args: [],
    );
  }

  /// `العنوان قصير`
  String get titleShort {
    return Intl.message(
      'العنوان قصير',
      name: 'titleShort',
      desc: '',
      args: [],
    );
  }

  /// `هدف التواصل`
  String get reason {
    return Intl.message(
      'هدف التواصل',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `الرسالة`
  String get message {
    return Intl.message(
      'الرسالة',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `نص الرسالة`
  String get messageText {
    return Intl.message(
      'نص الرسالة',
      name: 'messageText',
      desc: '',
      args: [],
    );
  }

  /// `أدخل نص الرسالة`
  String get enterMessageText {
    return Intl.message(
      'أدخل نص الرسالة',
      name: 'enterMessageText',
      desc: '',
      args: [],
    );
  }

  /// `نص الرسالة قصير !`
  String get messageTextShort {
    return Intl.message(
      'نص الرسالة قصير !',
      name: 'messageTextShort',
      desc: '',
      args: [],
    );
  }

  /// `أرسل`
  String get submit {
    return Intl.message(
      'أرسل',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get personalData {
    return Intl.message(
      'الملف الشخصي',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `لغة التطبيق`
  String get applanguage {
    return Intl.message(
      'لغة التطبيق',
      name: 'applanguage',
      desc: '',
      args: [],
    );
  }

  /// `التقاط صورة`
  String get fromCamera {
    return Intl.message(
      'التقاط صورة',
      name: 'fromCamera',
      desc: '',
      args: [],
    );
  }

  /// `اختيار صورة من الاستوديو`
  String get fromGallery {
    return Intl.message(
      'اختيار صورة من الاستوديو',
      name: 'fromGallery',
      desc: '',
      args: [],
    );
  }

  /// `مشكلة في تشغيل الصوت/الفيديو:`
  String get issueWithPlayback {
    return Intl.message(
      'مشكلة في تشغيل الصوت/الفيديو:',
      name: 'issueWithPlayback',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ من مزود الخدمة`
  String get socialProviderNoEmail {
    return Intl.message(
      'حدث خطأ من مزود الخدمة',
      name: 'socialProviderNoEmail',
      desc: '',
      args: [],
    );
  }

  /// `معلومات مفقودة من مزود الخدمة`
  String get missingInfoFromSocialProvider {
    return Intl.message(
      'معلومات مفقودة من مزود الخدمة',
      name: 'missingInfoFromSocialProvider',
      desc: '',
      args: [],
    );
  }

  /// `مشكلة في الوصول:`
  String get accessibilityIssue {
    return Intl.message(
      'مشكلة في الوصول:',
      name: 'accessibilityIssue',
      desc: '',
      args: [],
    );
  }

  /// `رابط معطوب:`
  String get brokenLink {
    return Intl.message(
      'رابط معطوب:',
      name: 'brokenLink',
      desc: '',
      args: [],
    );
  }

  /// `جاري التحميل...`
  String get loading {
    return Intl.message(
      'جاري التحميل...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ غير معروف!`
  String get unknownError {
    return Intl.message(
      'حدث خطأ غير معروف!',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد محتوى`
  String get noContent {
    return Intl.message(
      'لا يوجد محتوى',
      name: 'noContent',
      desc: '',
      args: [],
    );
  }

  /// `طلب غير صحيح`
  String get badRequest {
    return Intl.message(
      'طلب غير صحيح',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `ممنوع`
  String get forbidden {
    return Intl.message(
      'ممنوع',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `غير مصرح به`
  String get unauthorised {
    return Intl.message(
      'غير مصرح به',
      name: 'unauthorised',
      desc: '',
      args: [],
    );
  }

  /// `غير موجود`
  String get notFound {
    return Intl.message(
      'غير موجود',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `خطأ داخلي في الخادم`
  String get internalServerError {
    return Intl.message(
      'خطأ داخلي في الخادم',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الاتصال`
  String get connectTimeout {
    return Intl.message(
      'انتهاء مهلة الاتصال',
      name: 'connectTimeout',
      desc: '',
      args: [],
    );
  }

  /// `تم إلغاء الطلب`
  String get requestCanceled {
    return Intl.message(
      'تم إلغاء الطلب',
      name: 'requestCanceled',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الاستقبال`
  String get receiveTimeout {
    return Intl.message(
      'انتهاء مهلة الاستقبال',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `انتهاء مهلة الإرسال`
  String get sendTimeout {
    return Intl.message(
      'انتهاء مهلة الإرسال',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في التخزين المؤقت`
  String get cacheError {
    return Intl.message(
      'خطأ في التخزين المؤقت',
      name: 'cacheError',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال بالإنترنت`
  String get noInternetConnection {
    return Intl.message(
      'لا يوجد اتصال بالإنترنت',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `الأكثر مشاهدة`
  String get mostViewed {
    return Intl.message(
      'الأكثر مشاهدة',
      name: 'mostViewed',
      desc: '',
      args: [],
    );
  }

  /// `آخر استماعاتك`
  String get lastViewed {
    return Intl.message(
      'آخر استماعاتك',
      name: 'lastViewed',
      desc: '',
      args: [],
    );
  }

  /// `أُضيف حديثاً`
  String get latest {
    return Intl.message(
      'أُضيف حديثاً',
      name: 'latest',
      desc: '',
      args: [],
    );
  }

  /// `التصنيف`
  String get category {
    return Intl.message(
      'التصنيف',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `التصنيفات`
  String get categories {
    return Intl.message(
      'التصنيفات',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `أظهر المزيد`
  String get seeMore {
    return Intl.message(
      'أظهر المزيد',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `أظهر القليل`
  String get showLess {
    return Intl.message(
      'أظهر القليل',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `التنزيلات`
  String get downloads {
    return Intl.message(
      'التنزيلات',
      name: 'downloads',
      desc: '',
      args: [],
    );
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message(
      'المفضلة',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `المحفوظات`
  String get bookmarks {
    return Intl.message(
      'المحفوظات',
      name: 'bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `إضافة إلى القائمة المرجعية`
  String get addToBookmark {
    return Intl.message(
      'إضافة إلى القائمة المرجعية',
      name: 'addToBookmark',
      desc: '',
      args: [],
    );
  }

  /// `تمت الإضافة إلى القائمة المرجعية بنجاح`
  String get addToBookmarkSuccess {
    return Intl.message(
      'تمت الإضافة إلى القائمة المرجعية بنجاح',
      name: 'addToBookmarkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `القوائم المرجعية`
  String get bookmarkList {
    return Intl.message(
      'القوائم المرجعية',
      name: 'bookmarkList',
      desc: '',
      args: [],
    );
  }

  /// `قائمة جديدة`
  String get newList {
    return Intl.message(
      'قائمة جديدة',
      name: 'newList',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء`
  String get create {
    return Intl.message(
      'إنشاء',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `ابحث هنا`
  String get search {
    return Intl.message(
      'ابحث هنا',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `اسم المستخدم`
  String get userName {
    return Intl.message(
      'اسم المستخدم',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `لم تقم بتسجيل الدخول، يرجى تسجيل الدخول`
  String get notLoggedIn {
    return Intl.message(
      'لم تقم بتسجيل الدخول، يرجى تسجيل الدخول',
      name: 'notLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `مسح`
  String get clear {
    return Intl.message(
      'مسح',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `تطبيق`
  String get apply {
    return Intl.message(
      'تطبيق',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get ok {
    return Intl.message(
      'تم',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message(
      'إلغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `تخطي`
  String get skip {
    return Intl.message(
      'تخطي',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get done {
    return Intl.message(
      'تم',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `تمت إضافة الملاحظة بنجاح`
  String get noteAddedSuccessfully {
    return Intl.message(
      'تمت إضافة الملاحظة بنجاح',
      name: 'noteAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `أضف رد`
  String get reply {
    return Intl.message(
      'أضف رد',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `تعديل`
  String get edit {
    return Intl.message(
      'تعديل',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `الاستوديو`
  String get studio {
    return Intl.message(
      'الاستوديو',
      name: 'studio',
      desc: '',
      args: [],
    );
  }

  /// `محرر الصوت`
  String get audioTrimmer {
    return Intl.message(
      'محرر الصوت',
      name: 'audioTrimmer',
      desc: '',
      args: [],
    );
  }

  /// `كتابة تعليق`
  String get writeComment {
    return Intl.message(
      'كتابة تعليق',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `تقييم الدرس`
  String get rateLesson {
    return Intl.message(
      'تقييم الدرس',
      name: 'rateLesson',
      desc: '',
      args: [],
    );
  }

  /// `ضبط السرعة`
  String get adjustSpeed {
    return Intl.message(
      'ضبط السرعة',
      name: 'adjustSpeed',
      desc: '',
      args: [],
    );
  }

  /// `الوصول مرفوض`
  String get accessDenied {
    return Intl.message(
      'الوصول مرفوض',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `غير مصرح`
  String get unauthorized {
    return Intl.message(
      'غير مصرح',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `كيان غير قابل للمعالجة`
  String get unprocessableEntity {
    return Intl.message(
      'كيان غير قابل للمعالجة',
      name: 'unprocessableEntity',
      desc: '',
      args: [],
    );
  }

  /// `الطريقة غير مسموح بها`
  String get methodNotAllowed {
    return Intl.message(
      'الطريقة غير مسموح بها',
      name: 'methodNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `بيانات الاعتماد غير صالحة`
  String get invalidCredentials {
    return Intl.message(
      'بيانات الاعتماد غير صالحة',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `رابط غير صحيح`
  String get wrongUrl {
    return Intl.message(
      'رابط غير صحيح',
      name: 'wrongUrl',
      desc: '',
      args: [],
    );
  }

  /// `المستخدم محظور`
  String get userIsBlocked {
    return Intl.message(
      'المستخدم محظور',
      name: 'userIsBlocked',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير كلمة المرور بنجاح`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'تم تغيير كلمة المرور بنجاح',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `تم حفظ المقطع بنجاح`
  String get clipSavedSuccessfully {
    return Intl.message(
      'تم حفظ المقطع بنجاح',
      name: 'clipSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `{minute} دقيقة`
  String minute(Object minute) {
    return Intl.message(
      '$minute دقيقة',
      name: 'minute',
      desc: '',
      args: [minute],
    );
  }

  /// `{Hour} ساعة`
  String hour(Object Hour) {
    return Intl.message(
      '$Hour ساعة',
      name: 'hour',
      desc: '',
      args: [Hour],
    );
  }

  /// `{count, plural, one {منذ ثانية واحدة} two {منذ ثانيتين} other {منذ {count} ثواني}}`
  String secondsAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ ثانية واحدة',
      two: 'منذ ثانيتين',
      other: 'منذ $count ثواني',
      name: 'secondsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ دقيقة واحدة} two {منذ دقيقتين} other {منذ {count} دقائق}}`
  String minutesAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ دقيقة واحدة',
      two: 'منذ دقيقتين',
      other: 'منذ $count دقائق',
      name: 'minutesAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ ساعة واحدة} two {منذ ساعتين} other {منذ {count} ساعات}}`
  String hoursAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ ساعة واحدة',
      two: 'منذ ساعتين',
      other: 'منذ $count ساعات',
      name: 'hoursAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ يوم واحد} two {منذ يومين} other {منذ {count} أيام}}`
  String daysAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ يوم واحد',
      two: 'منذ يومين',
      other: 'منذ $count أيام',
      name: 'daysAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ أسبوع واحد} two {منذ أسبوعين} other {منذ {count} أسابيع}}`
  String weeksAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ أسبوع واحد',
      two: 'منذ أسبوعين',
      other: 'منذ $count أسابيع',
      name: 'weeksAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ شهر واحد} two {منذ شهرين} other {منذ {count} أشهر}}`
  String monthsAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ شهر واحد',
      two: 'منذ شهرين',
      other: 'منذ $count أشهر',
      name: 'monthsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {منذ عام واحد} two {منذ عامين} other {منذ {count} أعوام}}`
  String yearsAgo(num count) {
    return Intl.plural(
      count,
      one: 'منذ عام واحد',
      two: 'منذ عامين',
      other: 'منذ $count أعوام',
      name: 'yearsAgo',
      desc: '',
      args: [count],
    );
  }

  /// `الآن`
  String get justNow {
    return Intl.message(
      'الآن',
      name: 'justNow',
      desc: '',
      args: [],
    );
  }

  /// `منذ ثانية واحدة`
  String get oneSecondAgo {
    return Intl.message(
      'منذ ثانية واحدة',
      name: 'oneSecondAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ دقيقة واحدة`
  String get oneMinuteAgo {
    return Intl.message(
      'منذ دقيقة واحدة',
      name: 'oneMinuteAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ ساعة واحدة`
  String get oneHourAgo {
    return Intl.message(
      'منذ ساعة واحدة',
      name: 'oneHourAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ يوم واحد`
  String get oneDayAgo {
    return Intl.message(
      'منذ يوم واحد',
      name: 'oneDayAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ أسبوع واحد`
  String get oneWeekAgo {
    return Intl.message(
      'منذ أسبوع واحد',
      name: 'oneWeekAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ شهر واحد`
  String get oneMonthAgo {
    return Intl.message(
      'منذ شهر واحد',
      name: 'oneMonthAgo',
      desc: '',
      args: [],
    );
  }

  /// `منذ سنة واحدة`
  String get oneYearAgo {
    return Intl.message(
      'منذ سنة واحدة',
      name: 'oneYearAgo',
      desc: '',
      args: [],
    );
  }

  /// `يرجى اختيار نجمة التقييم.`
  String get selectRatingStar {
    return Intl.message(
      'يرجى اختيار نجمة التقييم.',
      name: 'selectRatingStar',
      desc: '',
      args: [],
    );
  }

  /// `تحديث`
  String get update {
    return Intl.message(
      'تحديث',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `تحديث معلومات المستخدم`
  String get updateUserInfo {
    return Intl.message(
      'تحديث معلومات المستخدم',
      name: 'updateUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `تم تحديث معلومات المستخدم بنجاح.`
  String get userInfoUpdated {
    return Intl.message(
      'تم تحديث معلومات المستخدم بنجاح.',
      name: 'userInfoUpdated',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد إشعارات.`
  String get noNotifications {
    return Intl.message(
      'لا توجد إشعارات.',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `الوصف`
  String get description {
    return Intl.message(
      'الوصف',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `الإذن غير جاهز.`
  String get permissionNotReady {
    return Intl.message(
      'الإذن غير جاهز.',
      name: 'permissionNotReady',
      desc: '',
      args: [],
    );
  }

  /// `الدليل غير موجود.`
  String get dirNotExist {
    return Intl.message(
      'الدليل غير موجود.',
      name: 'dirNotExist',
      desc: '',
      args: [],
    );
  }

  /// `الملف غير موجود.`
  String get fileNotExist {
    return Intl.message(
      'الملف غير موجود.',
      name: 'fileNotExist',
      desc: '',
      args: [],
    );
  }

  /// `تم التقييم بنجاح.`
  String get ratingSuccess {
    return Intl.message(
      'تم التقييم بنجاح.',
      name: 'ratingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `تمت إزالة التقييم بنجاح.`
  String get ratingRemovedSuccess {
    return Intl.message(
      'تمت إزالة التقييم بنجاح.',
      name: 'ratingRemovedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `للأسف، فشل التقييم.`
  String get ratingFailed {
    return Intl.message(
      'للأسف، فشل التقييم.',
      name: 'ratingFailed',
      desc: '',
      args: [],
    );
  }

  /// `تمت الإضافة إلى قائمة المفضلة بنجاح.`
  String get addedToFavoriteSuccess {
    return Intl.message(
      'تمت الإضافة إلى قائمة المفضلة بنجاح.',
      name: 'addedToFavoriteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `قوة كلمة المرور`
  String get passwordStrength {
    return Intl.message(
      'قوة كلمة المرور',
      name: 'passwordStrength',
      desc: '',
      args: [],
    );
  }

  /// `ضعيف`
  String get weak {
    return Intl.message(
      'ضعيف',
      name: 'weak',
      desc: '',
      args: [],
    );
  }

  /// `متوسط`
  String get moderate {
    return Intl.message(
      'متوسط',
      name: 'moderate',
      desc: '',
      args: [],
    );
  }

  /// `قوي`
  String get strong {
    return Intl.message(
      'قوي',
      name: 'strong',
      desc: '',
      args: [],
    );
  }

  /// `قوي جدًا`
  String get veryStrong {
    return Intl.message(
      'قوي جدًا',
      name: 'veryStrong',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول باستخدام`
  String get signInWith {
    return Intl.message(
      'تسجيل الدخول باستخدام',
      name: 'signInWith',
      desc: '',
      args: [],
    );
  }

  /// `اختر الملفات`
  String get pickFiles {
    return Intl.message(
      'اختر الملفات',
      name: 'pickFiles',
      desc: '',
      args: [],
    );
  }

  /// `تم اختيار الملفات:`
  String get filesSelected {
    return Intl.message(
      'تم اختيار الملفات:',
      name: 'filesSelected',
      desc: '',
      args: [],
    );
  }

  /// `لم يتم اختيار أي ملفات`
  String get noFilesSelected {
    return Intl.message(
      'لم يتم اختيار أي ملفات',
      name: 'noFilesSelected',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات أخرى`
  String get noMoreData {
    return Intl.message(
      'لا توجد بيانات أخرى',
      name: 'noMoreData',
      desc: '',
      args: [],
    );
  }

  /// `حذف الحساب`
  String get deleteAccount {
    return Intl.message(
      'حذف الحساب',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `حذف حسابك نهائي ولا يمكن التراجع عنه. ستتم إزالة جميع بياناتك من خوادمنا. إذا كنت متأكدًا من أنك تريد المتابعة، يرجى التأكيد أدناه`
  String get deleteAccountMessage {
    return Intl.message(
      'حذف حسابك نهائي ولا يمكن التراجع عنه. ستتم إزالة جميع بياناتك من خوادمنا. إذا كنت متأكدًا من أنك تريد المتابعة، يرجى التأكيد أدناه',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `تحذير:`
  String get deleteAccountWarning {
    return Intl.message(
      'تحذير:',
      name: 'deleteAccountWarning',
      desc: '',
      args: [],
    );
  }

  /// `سيتم حذف جميع بياناتك الشخصية وتفضيلاتك بشكل دائم`
  String get deleteAccountWarning1 {
    return Intl.message(
      'سيتم حذف جميع بياناتك الشخصية وتفضيلاتك بشكل دائم',
      name: 'deleteAccountWarning1',
      desc: '',
      args: [],
    );
  }

  /// `سوف تفقد الوصول إلى جميع المحتويات المحفوظة وميزات التطبيق.`
  String get deleteAccountWarning2 {
    return Intl.message(
      'سوف تفقد الوصول إلى جميع المحتويات المحفوظة وميزات التطبيق.',
      name: 'deleteAccountWarning2',
      desc: '',
      args: [],
    );
  }

  /// `هذا الإجراء غير قابل للإلغاء`
  String get deleteAccountWarning3 {
    return Intl.message(
      'هذا الإجراء غير قابل للإلغاء',
      name: 'deleteAccountWarning3',
      desc: '',
      args: [],
    );
  }

  /// `هل أنت متأكد من أنك تريد حذف حسابك؟`
  String get deleteAccountConfirmation {
    return Intl.message(
      'هل أنت متأكد من أنك تريد حذف حسابك؟',
      name: 'deleteAccountConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `تم حذف الحساب بنجاح`
  String get accountDeletedSuccess {
    return Intl.message(
      'تم حذف الحساب بنجاح',
      name: 'accountDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد ملفات تم تحميلها`
  String get noDownloadedFiles {
    return Intl.message(
      'لا توجد ملفات تم تحميلها',
      name: 'noDownloadedFiles',
      desc: '',
      args: [],
    );
  }

  /// `إزالة القائمة`
  String get removeList {
    return Intl.message(
      'إزالة القائمة',
      name: 'removeList',
      desc: '',
      args: [],
    );
  }

  /// `تمت إزالة القائمة بنجاح.`
  String get listRemovedSuccess {
    return Intl.message(
      'تمت إزالة القائمة بنجاح.',
      name: 'listRemovedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `فشلت عملية تسجيل الدخول، حاول مرة أخرى لاحقًا.`
  String get loginFailed {
    return Intl.message(
      'فشلت عملية تسجيل الدخول، حاول مرة أخرى لاحقًا.',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `الإبلاغ عن أي مشكلة`
  String get reportIssue {
    return Intl.message(
      'الإبلاغ عن أي مشكلة',
      name: 'reportIssue',
      desc: '',
      args: [],
    );
  }

  /// `ابدأ التحميل`
  String get startDownloading {
    return Intl.message(
      'ابدأ التحميل',
      name: 'startDownloading',
      desc: '',
      args: [],
    );
  }

  /// `إيقاف التحميل مؤقتًا`
  String get pauseDownloading {
    return Intl.message(
      'إيقاف التحميل مؤقتًا',
      name: 'pauseDownloading',
      desc: '',
      args: [],
    );
  }

  /// `استئناف التحميل`
  String get resumeDownloading {
    return Intl.message(
      'استئناف التحميل',
      name: 'resumeDownloading',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء التحميل`
  String get cancelDownloading {
    return Intl.message(
      'إلغاء التحميل',
      name: 'cancelDownloading',
      desc: '',
      args: [],
    );
  }

  /// `تم إلغاء التحميل`
  String get downloadingCanceled {
    return Intl.message(
      'تم إلغاء التحميل',
      name: 'downloadingCanceled',
      desc: '',
      args: [],
    );
  }

  /// `فشل التحميل`
  String get downloadingFailed {
    return Intl.message(
      'فشل التحميل',
      name: 'downloadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `تحديث`
  String get refresh {
    return Intl.message(
      'تحديث',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `امتحان`
  String get test {
    return Intl.message(
      'امتحان',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `مرحبًا بك في الشاشة الرئيسية!`
  String get welcomeToTheHomeScreen {
    return Intl.message(
      'مرحبًا بك في الشاشة الرئيسية!',
      name: 'welcomeToTheHomeScreen',
      desc: '',
      args: [],
    );
  }

  /// `تم التطوير بواسطة`
  String get devlopedBy {
    return Intl.message(
      'تم التطوير بواسطة',
      name: 'devlopedBy',
      desc: '',
      args: [],
    );
  }

  /// `تمكين التعليم`
  String get empowerEducation {
    return Intl.message(
      'تمكين التعليم',
      name: 'empowerEducation',
      desc: '',
      args: [],
    );
  }

  /// `ندعم الطلاب والمدارس والجامعات بموارد تصنع الفرق.`
  String get supportStudentsSchoolsAndUniversitiesWithResourcesThatMakeA {
    return Intl.message(
      'ندعم الطلاب والمدارس والجامعات بموارد تصنع الفرق.',
      name: 'supportStudentsSchoolsAndUniversitiesWithResourcesThatMakeA',
      desc: '',
      args: [],
    );
  }

  /// `اكتشف مقالات ثقافية وتوعوية توسع مداركك وتنمّي معرفتك.`
  String get exploreRichCulturalAndAwarenessArticlesDesignedToBroadenHorizons {
    return Intl.message(
      'اكتشف مقالات ثقافية وتوعوية توسع مداركك وتنمّي معرفتك.',
      name: 'exploreRichCulturalAndAwarenessArticlesDesignedToBroadenHorizons',
      desc: '',
      args: [],
    );
  }

  /// `إلهام العقول`
  String get inspireMinds {
    return Intl.message(
      'إلهام العقول',
      name: 'inspireMinds',
      desc: '',
      args: [],
    );
  }

  /// `نصنع المستقبل`
  String get shapeTheFuture {
    return Intl.message(
      'نصنع المستقبل',
      name: 'shapeTheFuture',
      desc: '',
      args: [],
    );
  }

  /// `انضم إلينا لدعم تعليم شامل ومبتكر وذي جودة للجميع.`
  String get joinOurJourneyToPromoteInclusiveInnovativeAndQualityEducation {
    return Intl.message(
      'انضم إلينا لدعم تعليم شامل ومبتكر وذي جودة للجميع.',
      name: 'joinOurJourneyToPromoteInclusiveInnovativeAndQualityEducation',
      desc: '',
      args: [],
    );
  }

  /// `اختر`
  String get select {
    return Intl.message(
      'اختر',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `برنامج الشباب`
  String get youth {
    return Intl.message(
      'برنامج الشباب',
      name: 'youth',
      desc: '',
      args: [],
    );
  }

  /// `برنامج الأطفال`
  String get children {
    return Intl.message(
      'برنامج الأطفال',
      name: 'children',
      desc: '',
      args: [],
    );
  }

  /// `اهتمامات المؤسسة`
  String get organizationInterests {
    return Intl.message(
      'اهتمامات المؤسسة',
      name: 'organizationInterests',
      desc: '',
      args: [],
    );
  }

  /// `الوصول إلى التعليم الجامعي`
  String get accessToUniversityEducation {
    return Intl.message(
      'الوصول إلى التعليم الجامعي',
      name: 'accessToUniversityEducation',
      desc: '',
      args: [],
    );
  }

  /// `دعم التعليم الجامعي`
  String get supportingUniversityEducation {
    return Intl.message(
      'دعم التعليم الجامعي',
      name: 'supportingUniversityEducation',
      desc: '',
      args: [],
    );
  }

  /// `زيادة التفرغ للتعليم`
  String get devotingToEducation {
    return Intl.message(
      'زيادة التفرغ للتعليم',
      name: 'devotingToEducation',
      desc: '',
      args: [],
    );
  }

  /// `التأهيل لسوق العمل`
  String get qualifyingYouth {
    return Intl.message(
      'التأهيل لسوق العمل',
      name: 'qualifyingYouth',
      desc: '',
      args: [],
    );
  }

  /// `تعزيز المشاركة المجتمعية`
  String get communityParticipation {
    return Intl.message(
      'تعزيز المشاركة المجتمعية',
      name: 'communityParticipation',
      desc: '',
      args: [],
    );
  }

  /// `رعاية المدارس`
  String get schoolSponsorship {
    return Intl.message(
      'رعاية المدارس',
      name: 'schoolSponsorship',
      desc: '',
      args: [],
    );
  }

  /// `تطوير جودة التعليم`
  String get developingQualityEducation {
    return Intl.message(
      'تطوير جودة التعليم',
      name: 'developingQualityEducation',
      desc: '',
      args: [],
    );
  }

  /// `دعم البنية التحتية`
  String get infrastructureSupport {
    return Intl.message(
      'دعم البنية التحتية',
      name: 'infrastructureSupport',
      desc: '',
      args: [],
    );
  }

  /// `اخر الاخبار`
  String get latestNews {
    return Intl.message(
      'اخر الاخبار',
      name: 'latestNews',
      desc: '',
      args: [],
    );
  }

  /// `المقالات`
  String get articles {
    return Intl.message(
      'المقالات',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `شركاء مداد`
  String get midadPartners {
    return Intl.message(
      'شركاء مداد',
      name: 'midadPartners',
      desc: '',
      args: [],
    );
  }

  /// `عارض الفيديو`
  String get videoPlayer {
    return Intl.message(
      'عارض الفيديو',
      name: 'videoPlayer',
      desc: '',
      args: [],
    );
  }

  /// `معرض الفيديو`
  String get videoGallery {
    return Intl.message(
      'معرض الفيديو',
      name: 'videoGallery',
      desc: '',
      args: [],
    );
  }

  /// `مساعدة`
  String get help {
    return Intl.message(
      'مساعدة',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `عرض المزيد من المقالات`
  String get showMoreArticle {
    return Intl.message(
      'عرض المزيد من المقالات',
      name: 'showMoreArticle',
      desc: '',
      args: [],
    );
  }

  /// `عرض المزيد`
  String get showMore {
    return Intl.message(
      'عرض المزيد',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد مقالات أخرى`
  String get noMoreArticles {
    return Intl.message(
      'لا توجد مقالات أخرى',
      name: 'noMoreArticles',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد مقالات متاحة`
  String get noArticlesAvailable {
    return Intl.message(
      'لا توجد مقالات متاحة',
      name: 'noArticlesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد أخبار أخرى`
  String get noMoreNews {
    return Intl.message(
      'لا يوجد أخبار أخرى',
      name: 'noMoreNews',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد أخبار متاحة`
  String get noNewsAvailable {
    return Intl.message(
      'لا يوجد أخبار متاحة',
      name: 'noNewsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد المزيد من الفيديوهات`
  String get noMoreVideo {
    return Intl.message(
      'لا يوجد المزيد من الفيديوهات',
      name: 'noMoreVideo',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد فيديوهات متاحة`
  String get noVideoAvailable {
    return Intl.message(
      'لا يوجد فيديوهات متاحة',
      name: 'noVideoAvailable',
      desc: '',
      args: [],
    );
  }

  /// `ابحث عن مقالة`
  String get searchArticle {
    return Intl.message(
      'ابحث عن مقالة',
      name: 'searchArticle',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في الشبكة`
  String get netWorkErrorMessage {
    return Intl.message(
      'خطأ في الشبكة',
      name: 'netWorkErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `انتهت مهلة الاتصال`
  String get timeOutErrorMessage {
    return Intl.message(
      'انتهت مهلة الاتصال',
      name: 'timeOutErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `طلب غير صالح`
  String get badRequestMessage {
    return Intl.message(
      'طلب غير صالح',
      name: 'badRequestMessage',
      desc: '',
      args: [],
    );
  }

  /// `غير مصرح`
  String get unauthorizedMessage {
    return Intl.message(
      'غير مصرح',
      name: 'unauthorizedMessage',
      desc: '',
      args: [],
    );
  }

  /// `ممنوع الوصول`
  String get forbiddenMessage {
    return Intl.message(
      'ممنوع الوصول',
      name: 'forbiddenMessage',
      desc: '',
      args: [],
    );
  }

  /// `غير موجود`
  String get notFoundMessage {
    return Intl.message(
      'غير موجود',
      name: 'notFoundMessage',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في الخادم`
  String get serverErrorMessage {
    return Intl.message(
      'خطأ في الخادم',
      name: 'serverErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `خطأ غير معروف`
  String get unknownErrorMessage {
    return Intl.message(
      'خطأ غير معروف',
      name: 'unknownErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `المحتوى غير قابل للمعالجة`
  String get unprocessableContent {
    return Intl.message(
      'المحتوى غير قابل للمعالجة',
      name: 'unprocessableContent',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في التنسيق`
  String get formatException {
    return Intl.message(
      'خطأ في التنسيق',
      name: 'formatException',
      desc: '',
      args: [],
    );
  }

  /// `خطأ في الاتصال`
  String get connectionErrorException {
    return Intl.message(
      'خطأ في الاتصال',
      name: 'connectionErrorException',
      desc: '',
      args: [],
    );
  }

  /// `المجلات`
  String get journals {
    return Intl.message(
      'المجلات',
      name: 'journals',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل المجلة`
  String get detailsJournal {
    return Intl.message(
      'تفاصيل المجلة',
      name: 'detailsJournal',
      desc: '',
      args: [],
    );
  }

  /// `بدون عنوان`
  String get noTitle {
    return Intl.message(
      'بدون عنوان',
      name: 'noTitle',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد وصف`
  String get noDescription {
    return Intl.message(
      'لا يوجد وصف',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `الأنواع`
  String get types {
    return Intl.message(
      'الأنواع',
      name: 'types',
      desc: '',
      args: [],
    );
  }

  /// `النوع`
  String get type {
    return Intl.message(
      'النوع',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `الوسوم`
  String get tags {
    return Intl.message(
      'الوسوم',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `الوسم`
  String get tag {
    return Intl.message(
      'الوسم',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `مجهول`
  String get unknown {
    return Intl.message(
      'مجهول',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `تطبيق الفلاتر`
  String get applyFilters {
    return Intl.message(
      'تطبيق الفلاتر',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `مسح الكل`
  String get clearAll {
    return Intl.message(
      'مسح الكل',
      name: 'clearAll',
      desc: '',
      args: [],
    );
  }

  /// `تصفية المقالات`
  String get filterArticles {
    return Intl.message(
      'تصفية المقالات',
      name: 'filterArticles',
      desc: '',
      args: [],
    );
  }

  /// `الكل`
  String get all {
    return Intl.message(
      'الكل',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `تم فتح ملف PDF بنجاح`
  String get pdfOpenedSuccessfully {
    return Intl.message(
      'تم فتح ملف PDF بنجاح',
      name: 'pdfOpenedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `جاري التنزيل...`
  String get downloading {
    return Intl.message(
      'جاري التنزيل...',
      name: 'downloading',
      desc: '',
      args: [],
    );
  }

  /// `فشل في التنزيل`
  String get downloadFailed {
    return Intl.message(
      'فشل في التنزيل',
      name: 'downloadFailed',
      desc: '',
      args: [],
    );
  }

  /// `عارض ملفات PDF`
  String get pdfViewer {
    return Intl.message(
      'عارض ملفات PDF',
      name: 'pdfViewer',
      desc: '',
      args: [],
    );
  }

  /// `الشاشة الرئيسية`
  String get homeScreen {
    return Intl.message(
      'الشاشة الرئيسية',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `الكاتب`
  String get author {
    return Intl.message(
      'الكاتب',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `تاريخ النشر`
  String get publishDate {
    return Intl.message(
      'تاريخ النشر',
      name: 'publishDate',
      desc: '',
      args: [],
    );
  }

  /// `استكشف المجلات التعليمية بسهولة`
  String get easilyExploreEducationalJournals {
    return Intl.message(
      'استكشف المجلات التعليمية بسهولة',
      name: 'easilyExploreEducationalJournals',
      desc: '',
      args: [],
    );
  }

  /// `شاهد مجموعة متنوعة من الفيديوهات التعليمية والترفيهية`
  String get watchAVarietyOfEducationalAndEntertainingVideos {
    return Intl.message(
      'شاهد مجموعة متنوعة من الفيديوهات التعليمية والترفيهية',
      name: 'watchAVarietyOfEducationalAndEntertainingVideos',
      desc: '',
      args: [],
    );
  }

  /// `ابقَ على اطلاع بآخر الأخبار من مصادر موثوقة`
  String get stayUpdatedWithTheLatestNewsFromReliableSources {
    return Intl.message(
      'ابقَ على اطلاع بآخر الأخبار من مصادر موثوقة',
      name: 'stayUpdatedWithTheLatestNewsFromReliableSources',
      desc: '',
      args: [],
    );
  }

  /// `تصفح المدونة والمقالات التعليمية`
  String get browseTheBlogAndEducationalArticles {
    return Intl.message(
      'تصفح المدونة والمقالات التعليمية',
      name: 'browseTheBlogAndEducationalArticles',
      desc: '',
      args: [],
    );
  }

  /// `المدونة`
  String get blog {
    return Intl.message(
      'المدونة',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `جميع المشاريع`
  String get allProjects {
    return Intl.message(
      'جميع المشاريع',
      name: 'allProjects',
      desc: '',
      args: [],
    );
  }

  /// `المشاريع`
  String get projects {
    return Intl.message(
      'المشاريع',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `عرض الكل`
  String get seeAll {
    return Intl.message(
      'عرض الكل',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `مشاريعنا`
  String get ourProjects {
    return Intl.message(
      'مشاريعنا',
      name: 'ourProjects',
      desc: '',
      args: [],
    );
  }

  /// `السمة`
  String get theme {
    return Intl.message(
      'السمة',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `اللغة`
  String get locale {
    return Intl.message(
      'اللغة',
      name: 'locale',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
