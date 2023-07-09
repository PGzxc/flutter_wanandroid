import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

/// 日期：2022-05-15
/// 描述：路由跳转错误页面
/// 说明：点击按钮返回到主页

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${Get.routing.current} Page Not Found', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 25),
            GFButton(
              shape: GFButtonShape.standard,
              color: Colors.amber,
              onPressed: () => Get.offNamed('/main'),
              child: const Text('返回主页', style: TextStyle(fontSize: 30)),
            )
          ],
        ),
      ),
    );
  }
}
