import 'package:dio/dio.dart';

import '../../../core/client/client.dart';
import '../../../core/errors/error_handler.dart';
import '../models/partner_model.dart';

class PartnerService {
  PartnerService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Partner>> getPartners() async {
    try {
      final response = await _apiClient.get(
        '/partners',
      );

      final partners = (response.data['partners'] as List)
          .map((e) => Partner.fromJson(e as Map<String, dynamic>))
          .toList();

      return partners;
    } on DioException catch (e) {
      throw ErrorHandler.handle(e).message;
    }
  }
}
