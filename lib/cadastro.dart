import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cityStateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Pode salvar dados adicionais no Firestore se desejar

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Conta criada com sucesso!')),
        );
        Navigator.pop(context); // Voltar para tela de login
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Erro ao criar conta')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration _inputDecoration(String label, {bool required = false}) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        hintText: 'Digite $label'.toLowerCase(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixText: required ? 'Obrigatório' : null,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRIAR CONTA', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _nameController, decoration: _inputDecoration('Nome completo', required: true)),
              SizedBox(height: 10),
              TextFormField(controller: _cpfController, decoration: _inputDecoration('CPF', required: true)),
              SizedBox(height: 10),
              TextFormField(controller: _emailController, decoration: _inputDecoration('Email', required: true)),
              SizedBox(height: 10),
              TextFormField(controller: _addressController, decoration: _inputDecoration('Endereço', required: true)),
              SizedBox(height: 10),
              TextFormField(controller: _genderController, decoration: _inputDecoration('Gênero')),
              SizedBox(height: 10),
              TextFormField(controller: _cityStateController, decoration: _inputDecoration('Cidade e Estado')),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: _inputDecoration('DDD + Celular'),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _telController,
                      decoration: _inputDecoration('DDD + Telefone'),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(controller: _birthDateController, decoration: _inputDecoration('Data de nascimento', required: true)),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration('Senha', required: true).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) => value != null && value.length < 8 ? 'Senha deve ter no mínimo 8 caracteres' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: _inputDecoration('Confirmar senha', required: true).copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                ),
                validator: (value) => value != _passwordController.text ? 'As senhas não coincidem' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Criar conta', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
