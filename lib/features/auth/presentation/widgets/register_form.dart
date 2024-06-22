import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/auth/presentation/index.dart';
import 'package:scholariship/features/auth/presentation/widgets/password_input_field.dart';
import '../../../../global/utils/input_validate.dart';
import '../../../../global/widgets/custom_button.dart';


class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String password = '';
    String email = '';
    String username = '';

    void register(String username, String password,String email){
       BlocProvider.of<AuthBloc>(context).add(Register(username: username, email: email, password: password));
    }
    void submitForm() {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save(); // Save the form data
        register(username, password, email);
      }
    }
    void onSavedPasswordValue(String? value){
      password = value!;
    }
    return BlocListener<AuthBloc,AuthState>(
        listener: (BuildContext context, state) {
          if (state is Loaded) {
            context.router.replaceNamed('/');
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value!.isEmpty) {
                    return 'Ce champ est obligatoire. Veuillez le completer.';
                  }
                  return null;
                },
                onSaved: (value){
                  username = value!;
                },
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0), // Adjust as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Customize focus style
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0), // Error border style
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                validator: validateEmail,
                onSaved: (value){
                  email = value!;
                },
                decoration:InputDecoration(
                  hintText: "Addresse email",
                  prefixIcon: const Icon(
                    Icons.alternate_email_outlined,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0), // Adjust as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Customize focus style
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0), // Error border style
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 12.0,
              ),
              PasswordInputField(onSaved: onSavedPasswordValue,),
              const SizedBox(
                height: 32.0,
              ),
              CustomButton(
                label: "Sign up",
                onPressed: submitForm,
              ),
            ],
          ),
        ),
      ));
  }
}

