import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/core/functions/show_toast.dart';
import 'package:dalel/core/functions/my_navigator.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_form.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_widget.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_state.dart';

class CustomFormFeild extends StatelessWidget {
  const CustomFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showToast('Successfully,Check your email to verfiy your account');
          pushReplaceNavigator(context, '/signIn');
        } else if (state is SignUpError) {
          showToast(state.errormessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.signUpformKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),

              const TermsAndConditionWidget(),
              const SizedBox(height: 88),
              state is SignUpLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : CustomBtn(
                      color: authCubit.termsAndConditionCheckBoxValue == false
                          ? AppColors.grey
                          : null,
                      onPressed: () {
                        if (authCubit.termsAndConditionCheckBoxValue == true) {
                          if (authCubit.signUpformKey.currentState!
                              .validate()) {
                            authCubit.signUpUserWithEmailAndPassword();
                          } else {
                            null;
                          }
                        }
                      },
                      text: AppStrings.signUp,
                    ),
            ],
          ),
        );
      },
    );
  }
}
