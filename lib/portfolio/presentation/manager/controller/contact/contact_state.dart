import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';

class ContactState {
  final bool isLoading;
  final String? lauchUrlError;
  final String? formError;
  final AllContactsResponseModel? allContactsResponseModel;
  final CreateContactResponseModel? createContactResponseModel;
  final String? contactError;
  ContactState({
    required this.isLoading,
    this.lauchUrlError,
    this.formError,
    this.allContactsResponseModel,
    this.createContactResponseModel,
    this.contactError,
  });

  factory ContactState.initial() => ContactState(isLoading: false);

  ContactState copyWith({
    bool? isLoading,
    String? launchUrlError,
    String? formError,
    AllContactsResponseModel? allContactsResponseModel,
    CreateContactResponseModel? createContactResponseModel,
    String? contactError,
  }) {
    return ContactState(
        isLoading: isLoading ?? this.isLoading,
        lauchUrlError: launchUrlError ?? lauchUrlError,
        formError: formError ?? this.formError,
        allContactsResponseModel:
            allContactsResponseModel ?? this.allContactsResponseModel,
        createContactResponseModel:
            createContactResponseModel ?? this.createContactResponseModel,
            contactError: contactError??this.contactError
            );
  }
}
