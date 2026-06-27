import 'package:potfolio/portfolio/data/remote/modals/request/contacts/create_contact_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/form_submit_request_modal.dart';
import 'package:potfolio/portfolio/data/services/email_service.dart';
import 'package:potfolio/portfolio/domain/usecase/contacts/create_contact_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/contacts/delete_contact_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/contacts/fetch_all_contacts_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/contacts/update_contact_usecase.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/contact/contact_state.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_helper.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'contact_controller.g.dart';

@riverpod
class ContactController extends _$ContactController {
  @override
  ContactState build() {
    Future.microtask(fetchAllContacts);
    return ContactState.initial();
  }

  Future<void> formSubmit(FormSubmitRequestModal request) async {
    state = state.copyWith(isLoading: true);
    try {
      await EmailService.sendEmail(
        name: request.name,
        email: request.email,
        phone: request.phone,
        whatsapp: request.whatsapp,
        description: request.description,
      );

      successPrint("Form submit success");
    } catch (e) {
      state = state.copyWith(
        formError: "Failed to send your message. Please try again",
      );
      errorPrint("form submit failed $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> launchUrl(String url) async {
    state = state.copyWith(isLoading: true);
    try {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url, mode: LaunchMode.platformDefault);
      } else {
        state = state.copyWith(
          launchUrlError: "Unable to open the link. Please try again.",
        );
      }
    } catch (e) {
      state = state.copyWith(
        launchUrlError: "Unable to open the link. Please try again.",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchAllContacts() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchAllContactsUseCase = ref.read(
        getFetchAllContactsUsecaseProvider,
      );
      var result = await fetchAllContactsUseCase.build();
      state = state.copyWith(allContactsResponseModel: result);
    } catch (e) {
      state = state.copyWith(allContactsResponseModel: null);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> createContact(CreateContactRequestModel requestModal) async {
    state = state.copyWith(isLoading: true, createContactResponseModel: null);
    try {
      final createContactUseCase = ref.read(getCreateContactUsecaseProvider);
      var result = await createContactUseCase.build(requestModal);
      state = state.copyWith(
        createContactResponseModel: result,
        contactError: "Contact created successfully",
      );
      fetchAllContacts();
    } catch (e) {
      state = state.copyWith(
        contactError: CustomHelper.getErrorMessage(e),
        createContactResponseModel: null,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateContact(CreateContactRequestModel requestModal) async {
    state = state.copyWith(isLoading: true, createContactResponseModel: null);
    try {
      final updateContactUseCase = ref.read(getUpdateContactUsecaseProvider);
      var result = await updateContactUseCase.build(requestModal);
      state = state.copyWith(
        createContactResponseModel: result,
        contactError: "Contact Updated Successfully",
      );
      fetchAllContacts();
    } catch (e) {
      state = state.copyWith(
        contactError: CustomHelper.getErrorMessage(e),
        createContactResponseModel: null,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteContact(String contactID) async {
    state = state.copyWith(isLoading: true, createContactResponseModel: null);
    try {
      final deleteContactUseCase = ref.read(getDeleteContactUsecaseProvider);
      var result = await deleteContactUseCase.build(contactID);
      state = state.copyWith(
        createContactResponseModel: result,
        contactError: "Contact deleted successfully",
      );
      fetchAllContacts();
    } catch (e) {
      state = state.copyWith(
        contactError: CustomHelper.getErrorMessage(e),
        createContactResponseModel: null,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
