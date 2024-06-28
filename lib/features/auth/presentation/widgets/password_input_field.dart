import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final void Function(String? value) onSaved;
  const PasswordInputField({super.key, required this.onSaved});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  bool isVisible = false;
  void _toggleInputVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validatePassword,
      onSaved: widget.onSaved,
      obscureText: isVisible,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: IconButton(
          onPressed: _toggleInputVisibility,
          icon: isVisible
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
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
    );
  }
}


String? _validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Le mot de passe ne peut pas être vide';
  }
  // Vérifiez si le mot de passe contient au moins 8 caractères
  //if (value.length < 8) {
    //return 'Le mot de passe doit contenir au moins 8 caractères';
  //}
  // Vérifiez si le mot de passe contient au moins un chiffre
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Le mot de passe doit contenir au moins un chiffre';
  }
  // Vérifiez si le mot de passe contient au moins un caractère spécial
  //if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    //return 'Le mot de passe doit contenir au moins un caractère spécial';
  //}
  // Le mot de passe est valide
  return null;
}