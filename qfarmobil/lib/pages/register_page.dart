import 'package:flutter/material.dart';
import 'package:qfarmobil/models/paciente.dart';
import 'package:qfarmobil/models/user.dart';
import 'package:qfarmobil/services/qfar_http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/input_forms.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterWidget(),
      backgroundColor: Color.fromARGB(255, 194, 194, 194),
    );
  }
}

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

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
            child: const FormRegister(),
          ),
        ],
      ),
    );
  }
}

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cesfamController = TextEditingController();
  final TextEditingController _sintomasController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const Text('Registrarse'),
          const SizedBox(height: 15),
          InputForms(label: 'Nombre de Usuario', controller: _userController),
          const SizedBox(height: 15),
          InputForms(label: 'Correo Electronico', controller: _emailController),
          const SizedBox(height: 15),
          InputForms(label: 'Contraseña', controller: _passwordController),
          const SizedBox(height: 15),
          InputForms(label: 'Cesfam', controller: _cesfamController),
          const SizedBox(height: 15),
          InputForms(label: 'Sintomas', controller: _sintomasController),
          const SizedBox(height: 15),
          InputForms(label: 'Peso', controller: _pesoController),
          const SizedBox(height: 15),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
              //Navigator.pushNamed(context, '/home');
            },
            child: const Text('Registrarse'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final user = User(
                  user: _userController.text,
                  email: _emailController.text,
                  password: _passwordController.text);
              final paciente = Paciente(
                  cesfam: _cesfamController.text,
                  peso: int.parse(_pesoController.text),
                  sintomas: _sintomasController.text,
                  esperando: false);
              final qfarService = QfarHttp();
              if (!context.mounted) return; //revisar
              try {
                var token = await qfarService.createPaciente(paciente, user);
                await prefs.setString('token', token);
                if (!context.mounted) return; //revisar
                Navigator.pushNamed(context, '/home');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
            child: const Text('Volver atras'),
          )
        ],
      ),
    );
  }
}
