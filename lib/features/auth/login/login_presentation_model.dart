import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/features/auth/domain/model/log_in_failure.dart';
import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : loginResult = const FutureResult.empty(),
        username = '',
        password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.loginResult,
    required this.username,
    required this.password,
  });

  final FutureResult<Either<LogInFailure, Unit>> loginResult;
  final String username;
  final String password;

  @override
  bool get isLoading => loginResult.isPending();

  @override
  bool get isLoginEnabled => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    FutureResult<Either<LogInFailure, Unit>>? loginResult,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      loginResult: loginResult ?? this.loginResult,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get isLoginEnabled;
}
