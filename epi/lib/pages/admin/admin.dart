import 'package:epi/Widget/botao.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrativo'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Bem vindo'),
            customButton(
              text: 'Cadastrar epi',
              tap: () {
                Navigator.pushNamed(context, '/admepi');
              },
              context: context
            ),
            customButton(
              text: 'Cadastrar funcionário', tap: () {
                Navigator.pushNamed(context, '/admfunc');
              }, context: context
            ),
            customButton(
              text: 'Cadastrar entrega', tap: () {
                Navigator.pushNamed(context, '/admentrega');
              }, context: context
            )
          ],
        ),
      ),
    );
  }
}