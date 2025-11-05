import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Traditional From User")),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [FlutterLogo(size: 100), _RegisterForm()]),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (value) => setState(() => username = value),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Más de 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => setState(() => email = value),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (!emailRegExp.hasMatch(value))
                return 'No tiene formato de correo';

              return null;
            },
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => setState(() => password = value),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Más de 6 letras';
              return null;
            },
          ),

          const SizedBox(height: 20),

          FilledButton.tonalIcon(
            onPressed: () {
              print('$username, $email, $password');
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
