// import 'package:go_router/go_router.dart';

export 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  resetPassword('reset-password', 'resetPassword'),
  resetPasswordDone('reset-password-done', 'resetPasswordDone'),
  changePassword('change-password', 'changePassword'),
  updateProfile('update-profile', 'updateProfile'),
  register('/register', 'register'),
  root('/root', 'root'),
  profile('/profile', 'profile'),
  help('/help', 'help'),
  about('about', 'about'),
  termsConditions('terms-conditions', 'termsConditions'),
  privacyPolicy('privacy-policy', 'privacyPolicy'),
  home('/home', 'home'),
  web('/web', 'web'),
  favorite('/favorite', 'favorite'),
  posts('/posts', 'posts'),
  postDetails('post-details', 'postDetails'),
  notifications('/notifications', 'notifications'),
  settings('/settings', 'settings'),
  category('/category', 'category'),
  search('/search', 'search'),
  youtubePlayer('/youtubePlayer', 'youtubePlayer'),
  articleDetails('/article-details/:id', 'articleDetails'),
  articles('/articles', 'articles'),
  latestNews('/latest-news', 'latestNews'),
  newsDetails('/news-details/:id', 'newsDetails'),
  videoGallery('/video-gallery', 'videoGallery'),
  journal('/journal', 'journal'),
  journalDetails('/journal/details/:journalId', 'journalDetails'),
  pdfViewer('/pdf-viewer/:pdfUrl', 'pdfViewer'),
  categoryDetails('/category-details', 'categoryDetails'),
  types('/types', 'types'),
  typeDetails('/type-details', 'typeDetails'),
  tags('/tags', 'tags'),
  tagDetails('/tag-details', 'tagDetails');


  final String path;
  final String name;
  // ignore: sort_constructors_first
  const AppRoutes(this.path, this.name);
}
