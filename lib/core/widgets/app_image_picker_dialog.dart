import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/localization/i18n/translations.g.dart';
import '../../core/theme/dimens.dart';
import '../../core/utils/media_picker/image_picker_helper.dart';
import '../../core/widgets/app_bottom_sheet_dialog.dart';
import '../../core/widgets/app_space.dart';
import '../../core/widgets/menu_list_tile.dart';

void appImagePickerDialog(
  final BuildContext context, {
  final String? title,
  final String? subTitle,
  final ValueChanged<XFile>? onSelected,
}) {
  appModalBottomSheetDialog(
    context,
    title ?? t.chooseIMG,
    subTitle ?? '',
    showCloseIcon: false,
    showDragHandle: true,
    child: Column(
      children: [
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          onTab: () async {
            _selectImage(source: ImageSource.gallery, onSelected: onSelected);
          },
          title: t.chooseIMGFromGallery,
        ),
        MenuListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
          ),
          onTab: () {
            _selectImage(source: ImageSource.camera, onSelected: onSelected);
          },
          title: t.chooseIMGFromCam,
        ),
        const AppVSpace(),
      ],
    ),
  );
}

Future<void> _selectImage({
  required final ImageSource source,
  final ValueChanged<XFile>? onSelected,
}) async {
  final XFile? image = await ImagePickerHelper.pickImage(source: source);
  if (image == null) {
    return;
  }

  if (onSelected == null) {
    return;
  }

  onSelected.call(image);
}
