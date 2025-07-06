import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_authentication_screens_ui/features/authentication/presentation/widgets/email_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../core/enums/status_enums.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../core/localization/i18n/translations.g.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/dimens.dart';
import '../../../../core/widgets/App_date_picker_dialog.dart';
import '../../../../core/widgets/app_bottom_sheet_dialog.dart';
import '../../../../core/widgets/app_image_picker_dialog.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_space.dart';
import '../../../../core/widgets/app_svg_viewer.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/menu_list_tile.dart';
import '../../../../core/widgets/selected_check_widget.dart';
import '../../../../core/widgets/user_profile_image.dart';
import '../../data/models/user_model.dart';
import '../bloc/profile_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _birthdate;
  String? _gender;
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  XFile? selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text(t.profile)),
      alignment: Alignment.topCenter,
      smallBody: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: Dimens.veryLargePadding,
            children: [
              AppVSpace(space: Dimens.padding),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  UserProfileImage(
                    imageFile:
                        selectedImage == null
                            ? null
                            : File(selectedImage!.path),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                        width: 3,
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.veryLargePadding,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        appImagePickerDialog(
                          context,
                          onSelected: (final XFile image) {
                            setState(() {
                              selectedImage = image;
                            });
                            context.pop();
                          },
                        );
                      },
                      icon: AppSvgViewer(
                        Assets.icons.edit,
                        setDefaultColor: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox.shrink(),
              AppTextFormField(
                labelText: t.name,
                controller: _nameController,
                hasValidation: true,
                nextFocusNode: lastNameFocusNode,
              ),
              AppTextFormField(
                controller: _lastNameController,
                labelText: t.lastName,
                focusNode: lastNameFocusNode,
                hasValidation: true,
                nextFocusNode: emailFocusNode,
              ),
              GestureDetector(
                onTap: () => _selectDate(),
                child: AbsorbPointer(
                  child: AppTextFormField(
                    controller: TextEditingController(
                      text:
                          _birthdate != null
                              ? DateFormat('yyyy-MM-dd').format(_birthdate!)
                              : '',
                    ),
                    labelText: t.dateOfBirth,
                    hasValidation: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(Dimens.largePadding),
                      child: AppSvgViewer(Assets.icons.calendar),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectGenderDialog(),
                child: AbsorbPointer(
                  child: AppTextFormField(
                    controller: TextEditingController(text: _gender ?? ''),
                    labelText: t.gender,
                    hasValidation: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(Dimens.largePadding),
                      child: AppSvgViewer(
                        Assets.icons.arrowDown,
                        setDefaultWidthAndHeight: false,
                        width: 18,
                      ),
                    ),
                  ),
                ),
              ),
              EmailTextFormField(controller: _emailController, showIcon: false),
              AppTextFormField(
                controller: _phoneController,
                labelText: t.phone,
                focusNode: phoneNumberFocusNode,
                textInputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.enterPhone;
                  }
                  if (value.length < 11) {
                    return t.enterAValidPhone;
                  }
                  return null;
                },
                maxLength: 14,
                hasValidation: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefixText: '+ ',
              ),
              AppButton(
                borderRadius: Dimens.largePadding,
                onPressed: _submitForm,
                isLoading:
                    context.watch<ProfileCubit>().state.updateProfileStatus ==
                    Status.loading,
                title: t.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime? picked = await appDatePickerDialog(
      context: context,
      initialDate: _birthdate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthdate) {
      setState(() {
        _birthdate = picked;
      });
    }
  }

  void _selectGenderDialog() {
    FocusScope.of(context).requestFocus(FocusNode());
    appModalBottomSheetDialog(
      context,
      t.gender,
      '',
      child: Column(
        children: [
          MenuListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding,
            ),
            title: t.male,
            setDefaultIconColor: false,
            onTab: () {
              setState(() {
                _gender = t.male;
              });
              context.pop();
            },
            trailingWidget:
                _gender == t.male ? const SelectedCheckWidget() : null,
          ),
          MenuListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding,
            ),
            title: t.female,
            setDefaultIconColor: false,
            onTab: () {
              setState(() {
                _gender = t.female;
              });
              context.pop();
            },
            trailingWidget:
                _gender == t.female ? const SelectedCheckWidget() : null,
          ),
          const AppVSpace(),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final read = context.read<ProfileCubit>();
      read.updateProfile(
        userModel: UserModel(
          firstName: _nameController.text,
          lastName: _lastNameController.text,
          phone: '+${_phoneController.text}',
          birthDate: _birthdate.toString(),
          gender: _gender.toString().toLowerCase(),
          pictureVarForUpload: selectedImage,
        ),
      );
    }
  }
}
