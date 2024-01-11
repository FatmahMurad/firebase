import 'package:firebase/app/modules/auth/domain/provider/controller/auth_controller.dart';
import 'package:firebase/app/modules/auth/domain/provider/controller/text_form_provider.dart';
import 'package:firebase/app/modules/auth/domain/provider/state/auth_state.dart';
import 'package:firebase/app/modules/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authFormController =
    ChangeNotifierProvider((ref) => MyAuthFormController());

final authRepositoryProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(FirebaseAuth.instance);
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(AuthState(), AuthRepo(FirebaseAuth.instance));
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = AuthRepo(FirebaseAuth.instance);
  //ref.watch(authRepositoryProvider);
  ref.read(authControllerProvider);
  return authRepository.authStateChanged;
});
final checkIfAuthinticatedFutureProvider =
    FutureProvider((ref) => ref.watch(authStateProvider));
