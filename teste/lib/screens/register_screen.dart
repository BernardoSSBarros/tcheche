import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _cepController = TextEditingController();

  String userType = 'comum';
  List<String> workerTags = [];
  final allTags = ['Marceneiro', 'Encanador', 'Eletricista'];

  bool validarCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length != 11) return false;
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int resto = (soma * 10) % 11;
    if (resto == 10) resto = 0;
    if (resto != int.parse(cpf[9])) return false;

    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    resto = (soma * 10) % 11;
    if (resto == 10) resto = 0;
    if (resto != int.parse(cpf[10])) return false;

    return true;
  }

  bool isCepValid(String cep) =>
      RegExp(r'^\d{5}-?\d{3}$').hasMatch(cep);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: userType,
              items: const [
                DropdownMenuItem(value: 'comum', child: Text('Usuário Comum')),
                DropdownMenuItem(value: 'trabalhador', child: Text('Trabalhador')),
              ],
              onChanged: (val) => setState(() => userType = val!),
            ),
            if (userType == 'trabalhador') ...[
              TextField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextField(
                controller: _cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Wrap(
                spacing: 8,
                children: allTags.map((tag) {
                  final selected = workerTags.contains(tag);
                  return FilterChip(
                    label: Text(tag),
                    selected: selected,
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          workerTags.add(tag);
                        } else {
                          workerTags.remove(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (userType == 'trabalhador') {
                    if (!validarCPF(_cpfController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('CPF inválido')),
                      );
                      return;
                    }
                    if (!isCepValid(_cepController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('CEP inválido')),
                      );
                      return;
                    }
                  }

                  await _auth.register(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userType: userType,
                    cpf: _cpfController.text.replaceAll(RegExp(r'[^0-9]'), ''),
                    cep: _cepController.text,
                    tags: workerTags,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cadastro realizado com sucesso!')),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro: $e')),
                  );
                }
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
