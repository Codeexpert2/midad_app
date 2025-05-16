import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/article_service.dart';

final articleServiceProvider = Provider((ref) => ArticleService());
