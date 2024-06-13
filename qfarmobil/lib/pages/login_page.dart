import 'package:flutter/material.dart';
import 'package:qfarmobil/widgets/input_forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginWidget(),
      backgroundColor: Color.fromARGB(255, 166, 221, 253),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(190, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const FormLogin(),
          ),
        ],
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const Text('Iniciar Sesion'),
          const SizedBox(height: 15),
          InputForms(
              label: 'Usuario o Correo electronico',
              controller: _userController),
          const SizedBox(height: 15),
          InputForms(label: 'Contraseña', controller: _passwordController),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
              //Navigator.pushNamed(context, '/home');
            },
            child: const Text('Iniciar Sesion'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}
