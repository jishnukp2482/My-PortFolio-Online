import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/orderid_availability_repsonse_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_orderid_availability_usecase.g.dart';

class CheckOrderIDAvailabilityUsecase {
  final AppRepository appRepository;

  CheckOrderIDAvailabilityUsecase(this.appRepository);

  Future<OrderIdAvailabilityResponseModel> build(
    int orderID,
     String projectID,
  ) {
    return appRepository.checkOrderIDAvialbality(orderID,projectID);
  }
}

@riverpod
CheckOrderIDAvailabilityUsecase getCheckOrderIDAvailabilityUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return CheckOrderIDAvailabilityUsecase(appRepositroy);
}
