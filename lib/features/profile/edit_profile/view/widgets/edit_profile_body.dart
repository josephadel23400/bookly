import 'package:bookly/core/resources/colors_manager.dart';
import 'package:bookly/core/resources/size_manager.dart';
import 'package:bookly/core/widgets/custom_icon_button.dart';
import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/core/widgets/custom_text_field.dart';
import 'package:bookly/features/profile/edit_profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/dialogs_utils.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController nameController = TextEditingController(
      text: 'Alex Johnson',
    );
    final TextEditingController phoneController = TextEditingController(
      text: '+201010714886',
    );
    final TextEditingController emailController = TextEditingController(
      text: 'alexJohnson@gmail.com',
    );
    final TextEditingController bioController = TextEditingController();
    return Column(
      children: [

        SizedBox(height: 25.h),
        BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileImagePicked) {
              Navigator.pop(context); // close the picker dialog
            }
            if (state is EditProfileImagePickFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not pick image: ${state.message}'),
                ),
              );
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                final cubit = context.read<EditProfileCubit>();
                showDialog(
                  useRootNavigator: false,
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 250.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.textFieldBackgroundColor,
                          border: Border.all(
                            color: ColorsManager.darkGrayColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeManager.radiusSm,
                          ),
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 15.h),
                            Text(
                              'Pick your image',
                              style: TextStylesManager.displayMedium(context),
                            ),
                            SizedBox(height: 25.h),
                            CustomTextButton(
                              label: 'Open camera',
                              onPressed: () async {
                                await cubit.pickImageFromCamera();
                              },
                            ),
                            SizedBox(height: 25.h),
                            CustomTextButton(
                              label: 'Open gallery',
                              onPressed: () async {
                                await cubit.pickImageFromGallery();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    child: ClipOval(
                      child:
                          context.read<EditProfileCubit>().pickedImage == null
                          ? Image.asset(
                              height: 150.h,
                              width: 150.w,

                              ImageManager.profileImage,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              context.read<EditProfileCubit>().pickedImage!,
                              height: 150.h,
                              width: 150.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: ColorsManager.buttonOrangeColor,
                      child: ClipOval(
                        child: Icon(Icons.camera_alt_outlined, size: 19.w),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 25.h),
        // Align(
        //   alignment: AlignmentGeometry.centerLeft,
        //   child: Text(
        //     'Full name',
        //     style: TextStylesManager.displaySmall(
        //       context,
        //       color: ColorsManager.grayTextColor,
        //     ),
        //   ),
        // ),
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                label: 'Full name',
                keyboardType: TextInputType.text,
                maxLines: 1,
                enabled: true,
                hint: 'hint',
                onChanged: (data) {},
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: emailController,
                label: 'Email',
                keyboardType: TextInputType.text,
                maxLines: 1,
                enabled: false,
                hint: 'hint',
                onChanged: (data) {},
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: phoneController,
                label: 'Phone number',
                keyboardType: TextInputType.text,
                maxLines: 1,
                enabled: true,
                hint: 'hint',
                onChanged: (data) {},
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: bioController,
                label: 'Bio',
                keyboardType: TextInputType.text,
                maxLines: 2,
                enabled: true,
                hint: 'Tell us a little about yourself',
                onChanged: (data) {},
              ),
            ],
          ),
        ),
        SizedBox(height: 35.h),
        CustomTextButton(
          label: 'Save changes',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: ColorsManager.textFieldBackgroundColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 200.h,
                  width: SizeManager.screenSizeW90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Are you sure to save the changes that you made ?',
                        style: TextStylesManager.displayMedium(context,),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextButton(
                        label: 'Submit',
                        onPressed: () {
                          DialogsUtils.showLoadingDialog(
                            context,
                            action: () async {
                              await Future.delayed(Duration(seconds: 1));
                              context.pop();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
