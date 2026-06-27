import 'package:potfolio/portfolio/data/remote/modals/request/contacts/create_contact_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delete_contact_usecase.g.dart';

class DeleteContactUsecase {
  final AppRepository appRepository;

  DeleteContactUsecase(this.appRepository);

  Future<CreateContactResponseModel> build(String id) {
    return appRepository.deleteContact(id);
  }
}

@riverpod
DeleteContactUsecase getDeleteContactUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return DeleteContactUsecase(appRepositroy);
}
