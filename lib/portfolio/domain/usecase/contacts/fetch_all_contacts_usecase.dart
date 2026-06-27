import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';
import 'package:potfolio/portfolio/data/repository/app_repository.dart';
import 'package:potfolio/portfolio/domain/repositories/app_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_all_contacts_usecase.g.dart';

class FetchAllContactsUsecase {
  final AppRepository appRepository;

  FetchAllContactsUsecase(this.appRepository);

  Future<AllContactsResponseModel> build() {
    return appRepository.fetchAllContacts();
  }
}

@riverpod
FetchAllContactsUsecase getFetchAllContactsUsecase(Ref ref) {
  final appRepositroy = ref.read(getAppRepositoryProvider);
  return FetchAllContactsUsecase(appRepositroy);
}
