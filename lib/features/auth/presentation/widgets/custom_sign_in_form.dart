import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/core/functions/show_toast.dart';
import 'package:dalel/core/functions/my_navigator.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_form.dart';
import 'package:dalel/features/auth/presentation/widgets/forget_pass_txt.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_state.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? pushReplaceNavigator(context, "/home")
              : showToast('Verify Your Email');
        } else if (state is SignInError) {
          showToast(state.errormessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffix: IconButton(
                  icon: const Icon(Icons.visibility_outlined),
                  onPressed: () {},
                ),
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(height: 16),
              const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SignInLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      onPressed: () {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn,
                    ),
            ],
          ),
        );
      },
    );
  }
}
