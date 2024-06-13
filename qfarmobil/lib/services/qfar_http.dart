// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qfarmobil/models/paciente.dart';
import 'package:qfarmobil/models/user.dart';

class QfarHttp {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> pacientes() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      print('Response received with status: ${response.statusCode}');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['data'];
      } else {
        return [];
      }
    } catch (e) {
      print('Exception caught: $e');
      return [];
    }
  }

  Future<String> createPaciente(Paciente paciente, User user) async {
    var response = await http.post(
      Uri.parse('$apiUrl/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        'user': {
          'username': user.user,
          'email': user.email,
          'password': user.password,
        },
        'paciente': {
          'sintomas': paciente.sintomas,
          'cesfam': paciente.cesfam,
          'peso': paciente.peso,
          'esperando': paciente.esperando,
        }
      }),
    );

    print('${response.statusCode}  ${response.body}');
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to create Paciente.');
    }
  }
}
