//import 'dart:ffi';

class Paciente {
  final int? id;
  final int? userId;
  final String sintomas;
  final String cesfam;
  final int peso;
  final bool? esperando;

  Paciente({
    this.userId,
    this.id,
    required this.cesfam,
    required this.peso,
    required this.sintomas,
    this.esperando,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      sintomas: json['sintomas'],
      cesfam: json['cesfam'],
      peso: json['peso'],
      esperando: json['esperando'],
    );
  }

  Map<String, dynamic> toJson() => {
        'cesfam': cesfam,
        'sintomas': sintomas,
        'peso': peso,
        'esperando': esperando,
      };
}
