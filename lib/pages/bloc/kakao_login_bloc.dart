import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wegotogether_login/domain/usecase/auth/kakao_login_usecase.dart';
import 'package:wegotogether_login/domain/usecase/auth/kakao_logout_usecase.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_event.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_state.dart';

class KakaoLoginBloc extends Bloc<KakaoLoginEvent, KakaoLoginState> {
  KakaoLoginBloc() : super(KakaoLoginInitial()) {
    on<LoginWithKakao>(_onLoginWithKakao);
    on<LogoutFromKakao>(_onLogoutFromKakao);
  }
  final _loginUseCase = KakaoLoginUseCase();
  final _logoutUseCase = KakaoLogoutUseCase();

  Future<void> _onLoginWithKakao(
    LoginWithKakao event,
    Emitter<KakaoLoginState> emit,
  ) async {
    emit(KakaoLoginLoading());
    try {
      final userProfile = await _loginUseCase();
      emit(KakaoLoginSuccess(userProfile));
    } catch (e) {
      emit(KakaoLoginFailure(e.toString()));
    }
  }

  Future<void> _onLogoutFromKakao(
    LogoutFromKakao event,
    Emitter<KakaoLoginState> emit,
  ) async {
    try {
      await _logoutUseCase();
      emit(KakaoLogoutComplete());
    } catch (e) {
      emit(KakaoLoginFailure(e.toString()));
    }
  }
}
