import 'package:intl/intl.dart';
 
class ColaboradorEpi {
  final String idEnt;
  final int idEpi;
  final String idCol;
  final String dataEntrega;
  final String dataValidade;
 
  ColaboradorEpi({
    required this.idEnt,
    required this.idEpi,
    required this.idCol,
    required this.dataEntrega,
    required this.dataValidade,
  });
 
  factory ColaboradorEpi.fromJson(Map<String, dynamic> json) {
    var parsedDV = DateTime.parse(json['dataValidade']);
    final databrv = DateFormat('dd/MM/yyyy').format(parsedDV);
    var parsedDE = DateTime.parse(json['dateEntrega']);
    final databre = DateFormat('dd/MM/yyyy').format(parsedDE);

    return ColaboradorEpi(
      idEnt: json['idEnt'],
      dataValidade: databrv.toString(),
      dataEntrega: databre.toString(),
      idEpi: json['idEpi'],
      idCol: json['idCol'],
    );
  }
}