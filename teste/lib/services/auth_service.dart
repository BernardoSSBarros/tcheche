import 'package:cloud_firestore/cloud_firestore.dart';
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
