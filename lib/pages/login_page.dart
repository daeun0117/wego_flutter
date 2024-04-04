import 'package:flutter/material.dart';
import 'package:wegotogether_login/pages/kakaoLoginService.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 348,
            ),
            const Text(
              "We Go Together",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 203,
            ),
            kakaoLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget kakaoLoginButton() {
    return InkWell(
      onTap: () {
        KakaoLoginService().loginKakao();
      },
      child: Container(
        //width: 500,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.yellow),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 70,
        child: const Center(
          child: Text(
            "카카오 로그인",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/*Future<void> loginKakao() async {
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');

      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}
*/
