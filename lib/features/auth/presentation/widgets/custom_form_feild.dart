import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_form.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_widget.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_cubit.dart';

class CustomFormFeild extends StatelessWidget {
  const CustomFormFeild({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: authCubit.signUpformKey,
          child: Column(
            children: [
              CustomForm(
                labelText: AppStrings.fristName,
                onChange: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomForm(
                labelText: AppStrings.lastName,
                onChange: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomForm(
                labelText: AppStrings.emailAddress,
                onChange: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomForm(
                labelText: AppStrings.password,
                onChange: (password) {
                  authCubit.password = password;
                },
              ),

              TermsAndConditionWidget(),
              SizedBox(height: 88),
              CustomBtn(
                color: authCubit.termsAndConditionCheckBoxValue == false
                    ? AppColors.grey
                    : null,
                onPressed: () {
                  if (authCubit.termsAndConditionCheckBoxValue == true) {
                    if (authCubit.signUpformKey.currentState!.validate()) {
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
