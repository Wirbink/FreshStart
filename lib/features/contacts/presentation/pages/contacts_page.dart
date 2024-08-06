import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_start/core/presentation/old%20widgets/app_bar.dart';
import 'package:fresh_start/core/utils/snackbar_utils.dart';
import 'package:fresh_start/features/contacts/data/model/contact_model.dart';
import 'package:fresh_start/features/contacts/data/repositories/contact_repository_impl.dart';
import 'package:fresh_start/features/contacts/domain/usecase/contact_usecase.dart';
import 'package:fresh_start/features/contacts/presentation/bloc/list_contacts/list_contact_bloc.dart';
import 'package:fresh_start/shared/presentation/section/loading_page.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/icons.dart';
import 'package:fresh_start/shared/presentation/theme/spacing.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class ContactsPage extends StatelessWidget {
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
          if (state is ListContactError){
            showCustomSnackBar(context, state.message, false);
            showCustomSnackBar(context, state.message, false);
            BlocProvider.of<ListContactBloc>(context).add(GetDataEvent());
          }
        },
        child: BlocBuilder<ListContactBloc, ListContactState>(
          builder: (context, state) {
            if (state is ListContactLoading) {
              return LoadingPage();
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
    appBar: AppBarWidget(titleAppBar: 'Contactos'),
    body: ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      itemCount: contact.length,
      itemBuilder: (context, index) {
        final contactItem = contact[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          child: Card(
            color: AppColors.colorPanel,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.medium),
            ),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(AppSpacing.medium),
              leading: CircleAvatar(
                backgroundColor: AppColors.colorDisabled,
                child: Text(
                  contactItem.nickname.substring(0, 2).toUpperCase(),
                  style: AppTextStyles.heading2,
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
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.colorSecondaryText,
              ),
              onTap: () {
                // Aquí puedes agregar la acción cuando se toca el contacto.
              },
            ),
          ),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Aquí puedes agregar la acción del FAB.
      },
      child: Icon(AppIcons.addCircleOutline),
    ),
  );
}

String getMaskedAccount(String account) {
  if (account.length > 4) {
    return account.substring(0, 4) + " **" + account.substring(account.length - 4);
  }
  return account;
}

}
