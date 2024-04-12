import 'package:equatable/equatable.dart';
import 'package:wegotogether_login/domain/entities/user_profile.dart';

abstract class KakaoLoginState extends Equatable {
  const KakaoLoginState();

  @override
  List<Object> get props => [];
}

class KakaoLoginInitial extends KakaoLoginState {}

class KakaoLoginLoading extends KakaoLoginState {}

class KakaoLoginSuccess extends KakaoLoginState {
  final UserProfile user;

  const KakaoLoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class KakaoLoginFailure extends KakaoLoginState {
  final String error;
  const KakaoLoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

class KakaoLogoutComplete extends KakaoLoginState {}
