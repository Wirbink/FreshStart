import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/core/utils/string_utils.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/data/repositories/contact_repository_impl.dart';
import 'package:fresh_start/features/contacts/domain/usecase/contact_usecase.dart';
import 'package:fresh_start/features/contacts/presentation/bloc/list_contacts/list_contact_bloc.dart';
import 'package:fresh_start/features/contacts/presentation/pages/create_contact_page.dart';
import 'package:fresh_start/features/transferences/presentation/pages/send_transferences_page.dart';
import 'package:fresh_start/shared/presentation/section/empty_data.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';
import 'package:fresh_start/shared/presentation/utils/navigation.dart';

class ContactsPage extends StatelessWidget {
  final String userAccount;

  const ContactsPage({super.key, required this.userAccount});

  @override
  Widget build(BuildContext context) {
    final connectivity = Connectivity();
    final contactRepository = ContactRepositoryImpl(connectivity: connectivity);
    final contactUsecase = ContactUseCase(contactRepository);
    final contactBloc = ListContactBloc(contactUseCase: contactUsecase)
      ..add(GetDataEvent());

    return BlocProvider(
      create: (context) => contactBloc,
      child: BlocListener<ListContactBloc, ListContactState>(
        listener: (context, state) {
          if (state is ListContactError) {
            showCustomSnackBar(context, state.message, false);
            showCustomSnackBar(context, state.message, false);
            BlocProvider.of<ListContactBloc>(context).add(GetDataEvent());
          }
        },
        child: BlocBuilder<ListContactBloc, ListContactState>(
          builder: (context, state) {
            if (state is ListContactLoading) {
              return const LoadingPage();
            } else if (state is ListContactSuccess) {
              return buildContactList(context, state.contact);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildContactList(BuildContext context, List<ContactModel> contact) {
    return Scaffold(
      appBar: const AppBarWidget(titleAppBar: 'Contactos'),
      body: contact.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
              itemCount: contact.length,
              itemBuilder: (context, index) {
                final contactItem = contact[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                  child: Card(
                    color: AppColors.colorPanel,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.medium),
                    ),
                    elevation: 0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(AppSpacing.small),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.colorSecondary,
                        child: Text(
                          contactItem.nickname.substring(0, 2).toUpperCase(),
                          style: AppTextStyles.display1
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      title: Text(
                        contactItem.nickname,
                        style: AppTextStyles.heading1,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contactItem.bankname,
                            style: AppTextStyles.paragraph1.copyWith(
                              color: AppColors.colorSecondaryText,
                            ),
                          ),
                          Text(
                            getMaskedAccount(contactItem.account),
                            style: AppTextStyles.paragraph2.copyWith(
                              color: AppColors.colorTertearyText,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.colorSecondaryText,
                      ),
                      onTap: () {
                        navigateTo(
                            context,
                            SendTransferencesPage(
                                userAccount: userAccount,
                                receptorCard: contactItem.account));
                      },
                    ),
                  ),
                );
              },
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: EmptyData(
                      message: 'No hay contactos',
                      tip: 'Crea un contacto para realizar una operación'),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.colorPrimary,
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateContactPage()),
              ).then((result) {
                if (result == true) {
                  BlocProvider.of<ListContactBloc>(context).add(GetDataEvent());
                }
              });
        },
        child: const Icon(AppIcons.addCircleOutline, color: Colors.white,),
      ),
    );
  }
}
