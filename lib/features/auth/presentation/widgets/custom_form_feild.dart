import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              CustomForm(
                labelText: AppStrings.fristName,
                onChange: (firstName) {
                  BlocProvider.of<AuthCubit>(context).firstName = firstName;
                },
              ),
              CustomForm(
                labelText: AppStrings.lastName,
                onChange: (lastName) {
                  BlocProvider.of<AuthCubit>(context).lastName = lastName;
                },
              ),
              CustomForm(
                labelText: AppStrings.emailAddress,
                onChange: (emailAddress) {
                  BlocProvider.of<AuthCubit>(context).emailAddress =
                      emailAddress;
                },
              ),
              CustomForm(
                labelText: AppStrings.password,
                onChange: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              TermsAndConditionWidget(),
              SizedBox(height: 88),
              CustomBtn(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(
                    context,
                  ).createUserWithEmailAndPassword();
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
