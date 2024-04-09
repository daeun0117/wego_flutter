import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:wegotogether_login/domain/entities/user.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_event.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_state.dart';

class KakaoLoginBloc extends Bloc<KakaoLoginEvent, KakaoLoginState> {
  KakaoLoginBloc() : super(KakaoLoginInitial()) {
    on<LoginWithKakao>(_onLoginWithKakao);
    on<LogoutFromKakao>(_onLogoutFromKakao);
  }

  Future<void> _onLoginWithKakao(
    LoginWithKakao event,
    Emitter<KakaoLoginState> emit,
  ) async {
    emit(KakaoLoginLoading());
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      final user = await UserApi.instance.me();
      //print('\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
      //'\n이메일: ${user.kakaoAccount?.email}');
      emit(KakaoLoginSuccess(
          UserProfile(nickName: user.kakaoAccount?.profile?.nickname)));
    } catch (e) {
      emit(KakaoLoginFailure(e.toString()));
    }
  }

  Future<void> _onLogoutFromKakao(
    LogoutFromKakao event,
    Emitter<KakaoLoginState> emit,
  ) async {
    try {
      await UserApi.instance.unlink();
      emit(KakaoLogoutComplete());
    } catch (e) {
      emit(KakaoLoginFailure(e.toString()));
    }
  }
}
