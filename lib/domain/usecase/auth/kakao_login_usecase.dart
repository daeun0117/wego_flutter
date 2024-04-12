import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:wegotogether_login/domain/entities/user_profile.dart';

class KakaoLoginUseCase {
  Future<UserProfile> call() async {
    bool isInstalled = await isKakaoTalkInstalled();
    if (isInstalled) {
      await UserApi.instance.loginWithKakaoTalk();
    } else {
      await UserApi.instance.loginWithKakaoAccount();
    }
    final user = await UserApi.instance.me();
    return UserProfile(nickName: user.kakaoAccount?.profile?.nickname);
  }
}
