import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bespoke/utilities/components/custom_page_body.dart';
import 'package:bespoke/utilities/theme/media.dart';
import '../../../handlers/shared_handler.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> opacityAnimation;

  _setAnimation() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 300));
    opacityAnimation = Tween<double>(end: 1, begin: 0).animate(controller);
    controller.forward();
    controller.addListener(() => setState(() {}));
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (SharedHandler.instance!.getData(key: SharedKeys().isLogin, valueType: ValueType.bool)) {
          CustomNavigator.push(Routes.login);
        } else {
          CustomNavigator.push(Routes.login);
        }
      },
    );
    _setAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
     
      body: Container(
        color: HexColor("89601A"),
        width: MediaHelper.width,
        height: MediaHelper.height,
        child: Column(
          children: [
            Expanded(
              child: AnimatedContainer(

                duration: const Duration(seconds: 200),
                child: Center(
                  child: Text("Bespoke",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 55),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
