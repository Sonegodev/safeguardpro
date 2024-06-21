import 'package:brasil_fields/brasil_fields.dart';
import 'package:epi/Provider/cadastro/admin/colaborador.dart';
import 'package:epi/Utils/mensage.dart';
import 'package:epi/Widget/botao.dart';
import 'package:epi/Widget/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
 
class AdminFunc extends StatefulWidget {
  const AdminFunc({super.key});
 
  @override
  State<AdminFunc> createState() => _AdminFuncState();
}
 
class _AdminFuncState extends State<AdminFunc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _ctps = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataAdmissao = TextEditingController();
 
  @override
  void dispose() {
    _nome.clear();
    _ctps.clear();
    _telefone.clear();
    _cpf.clear();
    _email.clear();
    _dataAdmissao.clear();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer<ColaboradorProvider>(builder: (context, colabprovider, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Administrativo'),
          ),
          body: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  customTextField(
                      title: 'Nome do funcionário',
                      controller: _nome,
                      hint: 'Digite o nome do funcionário',
                      tipo: TextInputType.text),
                  customTextField(
                      title: 'Número CTPS',
                      controller: _ctps,
                      hint: 'Digite o número do CTPS',
                      tipo: TextInputType.text),
                  customTextField(
                      title: 'Telefone',
                      controller: _telefone,
                      hint: 'Digite o telefone',
                      tipo: TextInputType.phone,
                      formatacao: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ]),
                  customTextField(
                      title: 'Número CPF',
                      controller: _cpf,
                      hint: 'Digite o número do CPF',
                      tipo: TextInputType.number,
                      formatacao: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ]),
                  customTextField(
                      title: 'E-mail',
                      controller: _email,
                      hint: 'Digite o e-mail',
                      tipo: TextInputType.emailAddress),
                  customTextField(
                      title: 'Data de Admissão',
                      controller: _dataAdmissao,
                      hint: 'Digite a data de admissão',
                      tipo: TextInputType.datetime,
                      formatacao: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ]),
                  customButton(
                      tap: () {
                        if (_formKey.currentState!.validate()) {
                          colabprovider.cadastrar(
                              context,
                              _nome.text,
                              _ctps.text,
                              _telefone.text,
                              _cpf.text,
                              _email.text,
                              _dataAdmissao.text);
                        } else {
                          showMessage(
                              message: "Todos os campos devem ser preenchidos",
                              context: context);
                        }
                      },
                      text: "Concluir",
                      context: context,
                      status: colabprovider.carregando)
                ],
              ),
            ),
          )));
    });
  }
}