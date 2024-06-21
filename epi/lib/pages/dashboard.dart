import 'package:epi/Models/colaborador_epi.dart';
import 'package:epi/Models/epi.dart';
import 'package:epi/Services/epis.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:flutter/material.dart';
 
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
 
  @override
  State<Dashboard> createState() => _DashboardState();
}
 
class _DashboardState extends State<Dashboard> {
  final ApiService _apiService = ApiService();
  List<ColaboradorEpi> _epis = [];

  @override
  void initState() {
    _consumirEpis();
    super.initState();
  }

  Future<void> _consumirEpis() async {
    try {
      List<ColaboradorEpi> epis = await _apiService.buscarEpis();
      setState(() {
        _epis = epis;
      });
    } catch (e) {
      showMessage(
        message: 'Erro ao carregar dados...',
        // ignore: use_build_context_synchronously
        context: context
      );
    }
  }

  // ignore: unused_element
  void _mostrarEpisDetalhes(int idEpi) async {
    try {
      Epi epiDetails = await _apiService.detalhesEpi(idEpi);
      showDialog(
        // ignore: use_build_context_synchronously
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(epiDetails.nome),
            content: Text(epiDetails.instrucaoUso),
            actions: <Widget> [
              TextButton(
                child: const Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
              )
            ],
          );
        }
      );
    } catch (e) {
      showMessage(
        message: 'Erro ao carregar informações da entrega...',
        // ignore: use_build_context_synchronously
        context: context
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de EPI'),
      ),
      body: ListView.builder(
        itemCount: _epis.length,
        itemBuilder: (context, index) {
          final epi = _epis[index];
          return ListTile(
            title: Text('Data de validade: ${epi.dataValidade}'),
            subtitle: Text('Data de entrega: ${epi.dataEntrega}'),
            onTap: () => _mostrarEpisDetalhes(epi.idEpi)
          );
        }
      ),
    );
  }
}