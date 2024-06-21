import 'package:epi/Utils/mensage.dart';
import 'package:epi/Widget/botao.dart';
import 'package:flutter/material.dart';
import 'package:epi/Provider/cadastro/login.dart';
import 'package:provider/provider.dart';
 
class ConfirmPassword extends StatelessWidget {
  final String email;
  final String cpf;
 
  const ConfirmPassword({super.key, required this.email, required this.cpf});
 
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Consumer<ValidarSenha>(builder: (context, validarsenha, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Confirme a senha'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('E-mail: $email'),
              Text('Cpf: $cpf'),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              customButton(
                tap: () async {
                  if (passwordController.text != confirmPasswordController.text) {
                    showMessage(message: 'as senhas devem ser iguais',
                    context: context);
                  } else {
                    var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
                    await validarsenha.createUser(
                        email, passwordController.text, int.parse(cpfint)
                      );
                    showMessage(
                      // ignore: use_build_context_synchronously
                      message: validarsenha.msgErrorApi, context: context);
                  }
                },
                text: "Concluir",
                context: context,
                status: validarsenha.carregando
              )
            ],
          ),
        ),
      );
    });
  }
}