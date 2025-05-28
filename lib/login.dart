import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cadastro.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void login() async {
    final email = _emailController.text.trim();
    final senha = _passwordController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos.")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Navegar para a HomeScreen após login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String mensagem = "Erro ao fazer login.";
      if (e.code == 'user-not-found') {
        mensagem = 'Usuário não encontrado.';
      } else if (e.code == 'wrong-password') {
        mensagem = 'Senha incorreta.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagem)),
      );
    }
  }


  Widget _buildSocialButton({
    required String logo,
    required String text,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo, height: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 15, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFB2E898),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 90, bottom: 40),
              child: Center(
                child: Image.asset('assets/logo_texto.jpg', height: 95),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("E-mail", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Digite seu e-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Senha", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Digite sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Esqueci minha senha", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[800],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: login,
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não tem conta? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("ou"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSocialButton(
                    logo: 'assets/icons8-google-logo-48.png',
                    text: 'Continuar com o Google',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildSocialButton(
                    logo: 'assets/icons8-mac-os-50.png',
                    text: 'Continuar com a Apple',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
