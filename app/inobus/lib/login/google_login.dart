import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barcode_widget/barcode_widget.dart';

class UserObj {
  static String id;
  static String name;
  static int point;
  static BarcodeWidget barcod = BarcodeWidget(
    data: id,
    barcode: Barcode.code128(),
    drawText: false,
  );

  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final FirebaseAuth auth = FirebaseAuth.instance;
}

void loginGoogle() async {
  try {
    // Google 인증 흐름을 Trigger 시작
    final GoogleSignInAccount googleUser = await UserObj.googleSignIn.signIn();
    // 요청에서 인증 세부 정보를 얻기
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // 새로운 자격 증명 만들기
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // firebase를 구글로 Sign in : 사용자 자격 증명용
    await UserObj.auth.signInWithCredential(credential);
    // 유저 정보 firebase에서 가져오기
    UserObj.id = UserObj.auth.currentUser.uid;
    UserObj.name = UserObj.auth.currentUser.displayName;

    // 디버깅
    if (UserObj.id != null) {
      print("유저 정보 확인 성공");
      print(UserObj.name);
    } else {
      print("유저 정보 못 받아옴");
    }
  } catch (err) {
    print("구글 로그인 실패");
    print(err);
  }
}

void logoutGoogle() {
  try {
    // Google 인증 흐름을 Trigger 해제
    UserObj.googleSignIn.signOut();
    // 사용자 정보 삭제
    UserObj.name = null;
    UserObj.id = null;
    print("로그아웃 완료");
  } catch (err) {
    print(err);
  }
}
