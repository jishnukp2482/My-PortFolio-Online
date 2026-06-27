import 'package:potfolio/portfolio/data/remote/modals/request/contacts/create_contact_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'update_contact_usecase.g.dart';

class UpdateContactUsecase {
  final AppRepository appRepository;

  UpdateContactUsecase(this.appRepository);

  Future<CreateContactResponseModel> build(
      CreateContactRequestModel requestModal) {
    return appRepository.updateContact(requestModal);
  }
}

@riverpod
UpdateContactUsecase getUpdateContactUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return UpdateContactUsecase(appRepositroy);
}
