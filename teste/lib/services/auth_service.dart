/*mport 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> register({
    required String email,
    required String password,
    required String userType,
    String? cpf,
    String? cep,
    List<String>? tags,
  }) async {
    UserCredential userCred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCred.user!.uid;

    await _db.collection('users').doc(uid).set({
      'email': email,
      'userType': userType,
      'cpf': cpf,
      'cep': cep,
      'tags': tags ?? [],
    });
  }

  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
*/
class AuthService {
  // Lista simulando o banco de dados em memória
  final List<Map<String, dynamic>> _users = [
    {
      'email': 'teste@exemplo.com',
      'password': '123456',
      'userType': 'comum',
      'cpf': null,
      'cep': null,
      'tags': [],
    },
    {
      'email': 'trabalhador@exemplo.com',
      'password': 'abcdef',
      'userType': 'trabalhador',
      'cpf': '53671272821',
      'cep': '12345-678',
      'tags': ['Marceneiro'],
    }
  ];

  // Simula o login
  Future<void> login({required String email, required String password}) async {
    final user = _users.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => throw Exception('Usuário ou senha inválidos'),
    );
    // Aqui você poderia armazenar o "usuário logado" em memória se precisar
  }

  // Simula o cadastro
  Future<void> register({
    required String email,
    required String password,
    required String userType,
    String? cpf,
    String? cep,
    List<String>? tags,
  }) async {
    // Verifica se email já existe
    if (_users.any((u) => u['email'] == email)) {
      throw Exception('Email já cadastrado');
    }

    _users.add({
      'email': email,
      'password': password,
      'userType': userType,
      'cpf': cpf,
      'cep': cep,
      'tags': tags ?? [],
    });
  }

  // Para testes: retorna lista de usuários
  List<Map<String, dynamic>> getAllUsers() => _users;
}

