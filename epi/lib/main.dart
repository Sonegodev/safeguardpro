import 'package:epi/Provider/cadastro/admin/cadepi.dart';
import 'package:epi/Provider/cadastro/admin/colaborador.dart';
import 'package:epi/Provider/cadastro/admin/entrega.dart';
import 'package:epi/Provider/cadastro/login.dart';
import 'package:epi/Provider/cadastro/login/logar.dart';
import 'package:epi/Provider/cadastro/verifica_usuario.dart';
import 'package:epi/pages/admin/admin.dart';
import 'package:epi/pages/admin/admin_entrega.dart';
import 'package:epi/pages/admin/admin_epi.dart';
import 'package:epi/pages/admin/admin_func.dart';
import 'package:epi/pages/admin/entrega/dataentrega.dart';
import 'package:epi/pages/admin/entrega/escolheepi.dart';
import 'package:epi/pages/dashboard.dart';
import 'package:epi/pages/homepage.dart';
import 'package:epi/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main () {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ValidarSenha()),
      ChangeNotifierProvider(create: (_) => UsuarioCadastrado()),
      ChangeNotifierProvider(create: (_) => Logar()),
      ChangeNotifierProvider(create: (_) => ColaboradorProvider()),
      ChangeNotifierProvider(create: (_) => CadEpiProvider()),
      ChangeNotifierProvider(create: (_) => EntregaProvider()),

    ],
    child: MaterialApp(
    initialRoute:  '/',
    routes: {
      '/': (context) => const HomePage(),
      '/cadastro': (context) => const SignupScreen(),
      '/dashboard': (context) => const Dashboard(),
      '/admin': (context) => const Admin(),
      '/admepi': (context) => const AdminEpi(),
      '/admfunc': (context) => const AdminFunc(),
      '/admentrega': (context) => const AdmEntrega(),
      '/episentrega': (context) => const episScreen(),
      '/entrega': (context) => EntregaScreen()

    },
    debugShowCheckedModeBanner: false,
  )));
}