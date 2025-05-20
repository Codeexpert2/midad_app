import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/client/client.dart';
import '../models/partner_model.dart';
import '../services/partner_service.dart';

final partnerServiceProvider = Provider<PartnerService>((ref) {
  final apiClient = ref.read(networkServiceProvider);
  return PartnerService(apiClient);
});

final partnerProvider = FutureProvider.autoDispose<List<Partner>>((ref) async {
  final partnerService = ref.read(partnerServiceProvider);
  return await partnerService.getPartners();
});
