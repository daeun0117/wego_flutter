import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogoutUseCase {
  Future<void> call() async {
    await UserApi.instance.unlink();
  }
}
