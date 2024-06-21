// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:epi/Provider/cadastro/login/logar.dart';
import 'package:flutter/material.dart';
import 'package:epi/style/colors.dart';
import 'package:epi/utils/mensage.dart';
import 'package:epi/widget/botao.dart';
import 'package:epi/widget/field.dart';
import 'package:provider/provider.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
 
  @override
  void dispose() {
    _email.clear();
    _senha.clear();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer<Logar>(builder: (context, logar, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("SafeGuard"),
          centerTitle: true,
          backgroundColor: azul,
        ),
        body: Container(
          color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(
                  title: 'Email',
                  controller: _email,
                  hint: 'Digite seu email',
                  tipo: TextInputType.emailAddress),
              customTextField(
                  title: 'Senha',
                  controller: _senha,
                  hint: 'Digite sua senha',
                  tipo: TextInputType.visiblePassword,
                  funcao: (value) {
                    logar.validatePassword(value);
                  }),
              if (logar.msgError.isNotEmpty)
                Text(
                  logar.msgError,
                  style: const TextStyle(color: Colors.red),
                ),
              customButton(
                text: 'Login',
                tap: () async {
                  if (_email.text.isEmpty || _senha.text.isEmpty) {
                    showMessage(
                        message: "Todos os campos são requiridos",
                        context: context);
                  } else {
                    await logar.logarUsuario(_email.text, _senha.text, 0);
                    debugPrint(logar.logado.toString());
                    if (logar.logado) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed(logar.rota);
                    } else {
                      showMessage(
                          message: "Usuário ou senha inválidos",
                          // ignore: use_build_context_synchronously
                          context: context);
                    }
                  }
                },
                context: context,
                status: logar.carregando
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cadastro');
                },
                child: const Text('Cadastre-se Agora'),
              )
            ],
          ),
        ),
      );
    });
  }
}