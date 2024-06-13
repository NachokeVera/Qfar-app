import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Q-Far'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const TokenWidget(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Habla con un profecional'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Cerrar Sesion'),
            ),
          ],
        ),
      ),
    );
  }
}

class TokenWidget extends StatefulWidget {
  const TokenWidget({super.key});

  @override
  State<TokenWidget> createState() => _TokenWidgetState();
}

class _TokenWidgetState extends State<TokenWidget> {
  late Future<String?> token;

  @override
  void initState() {
    super.initState();
    token = _preferenceToken();
  }

  Future<String?> _preferenceToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: token,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error al cargar token');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('Token no encontrado');
          } else {
            return Text('${snapshot.data}');
          }
        });
  }
}
