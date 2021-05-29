import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:inobus/app_icons.dart';
import 'package:inobus/app_images.dart';
import 'package:inobus/app_colors.dart';
import 'package:inobus/routes.dart';
import 'package:inobus/models/route_argument.dart';
import 'package:inobus/models/auth_service.dart';
import 'package:inobus/widgets/app_scaffold.dart';
import 'package:inobus/widgets/circle_button.dart';
import 'package:inobus/widgets/circle_box.dart';

/// 바코드
class BarcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouteArgument argument = ModalRoute.of(context).settings.arguments;
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return AppScaffold(
      title: argument.title,
      body: Expanded(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.9),
              child: Text(
                "스캐너는 여기에서 찾을 수 있어요!",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -0.7),
              child: Container(
                child: AppImages.deviceInput.image(),
                height: screenHeight * 0.2,
              ),
            ),
            // 바코드 생성
            Align(
              alignment: Alignment(0.0, -0.05),
              child: OutlineRoundedRectangleBorderBox(
                child: Container(
                  child: BarcodeWidget(
                    data: AuthService.user.uid,
                    barcode: Barcode.code128(),
                    drawText: false, //바코드값 보이지 않게
                  ),
                ),
                height: screenHeight * 0.2,
                width: screenHeight * 0.42,
                bordercolor: AppColors.primary,
                borderwidth: 3,
                padding: 20,
                radius: 20,
              ),
            ),
            // 아래 동그란 버튼
            Align(
              alignment: Alignment(0.0, 0.5),
              child: OutlineCircleButton(
                radius: screenWidth * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenWidth * 0.15,
                      width: screenWidth * 0.15,
                      child: Image.asset(
                        AppIcons.document.path,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.2,
                      child: Text(
                        "이용안내",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                borderColor: Colors.grey,
                borderSize: 1.0,
                onPressed: () => Navigator.pushNamed(
                  context,
                  Routes.infoExplan,
                  arguments: RouteArgument(
                    title: "이용방법",
                    selectList: 0, // 0:이용방법, 1:서비스 안내
                  ),
                ),
              ),
            ),
            // 아래 설명 텍스트
            Align(
              alignment: Alignment(0.0, 0.8),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '이용방법을 모를 경우 ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: "이용방법 ",
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: "버튼을 눌러주세요.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
