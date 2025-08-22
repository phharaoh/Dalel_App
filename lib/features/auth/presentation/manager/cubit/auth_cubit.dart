import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dalel/features/auth/presentation/manager/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? firstName;
  late String? lastName;
  late String? emailAddress;
  late String? password;
  GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  bool? termsAndConditionCheckBoxValue = false;

  updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  Future<void> signUpUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      // await addUserProfile();
      await sendEmailVerify();

      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpError('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpError('The account already exists for that email.'));
      } else {
        emit(SignUpError('The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      sendEmailVerify();
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInError('Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(SignInError('The email is invalid.'));
      } else {
        emit(SignInError(e.code));
      }
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }

  Future<void> sendEmailVerify() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  // Future<void> addUserProfile() async {
  //   CollectionReference users = FirebaseFirestore.instance.collection("users");
  //   await users.add({
  //     "email": emailAddress,
  //     "frist_name": firstName,
  //     "last_name": lastName,
  //   });
  // }
}
