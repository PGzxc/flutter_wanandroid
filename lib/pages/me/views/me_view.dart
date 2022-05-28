import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/models/person_info_response.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_typography_type.dart';
import '../../../i18n/i18n_keys.dart';
import '../../../routes/app_routes.dart';
import '../../coin/views/coin_view.dart';
import '../../login_register/utils/login_register_utils.dart';
import '../widgets/me_personinfo_cell_widget.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-me-页面
/// 说明：

class MeView extends GetView<MeController> {
  const MeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => ListView(children: [_buildHeadInfo(context), _buildCategory()]));
  }

  ///me-head信息
  Widget _buildHeadInfo(BuildContext context) {
    bool isLogin = LoginRegisterUtils().isLogin;
    PersonInfoData personInfoData = controller.personInfoData.value;
    return GestureDetector(
        onTap: () =>
            {isLogin ? null : Get.toNamed(Routes.loginRegister.nameToRoute())},
        child: SizedBox(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GFListTile(
                  avatar: const GFAvatar(
                    size: 50,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                      !isLogin
                          ? Keys.meUnLoginTitle.tr
                          : '${personInfoData.userInfo?.nickname}',
                      style: context.headline6Style),
                  icon: const Icon(Icons.chevron_right),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MePersonInfoCellWidget(
                        title: Keys.meLevel.tr,
                        value: personInfoData.coinInfo?.level.toString(),
                        onTap: () => {},
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: MePersonInfoCellWidget(
                          title: Keys.meRank.tr,
                          value: personInfoData.coinInfo?.rank,
                          onTap: () => {},
                        )),
                    Expanded(
                        flex: 1,
                        child: MePersonInfoCellWidget(
                          title: Keys.meCollect.tr,
                          value: '${personInfoData.collectArticleInfo?.count}',
                          onTap: () => {},
                        )),
                    Expanded(
                        flex: 1,
                        child: MePersonInfoCellWidget(
                          title: Keys.meCoin.tr,
                          value: '${personInfoData.coinInfo?.coinCount}',
                          onTap: () => {
                            Get.to(TabBarDemo())
                            //Get.toNamed(Routes.coin.nameToRoute())
                          },
                        )),
                  ],
                )
              ],
            )));
  }

  Widget _buildCategory() {
    List gfComponents = [
      {
        'title': Keys.meTools.tr,
        'route': '',
        'color': GFColors.PRIMARY,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meQA.tr,
        'route': '',
        'color': GFColors.SECONDARY,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meMsg.tr,
        'route': '',
        'color': GFColors.SUCCESS,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meCourse.tr,
        'route': '',
        'color': GFColors.INFO,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meToDo.tr,
        'route': '',
        'color': GFColors.WARNING,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meShareArticle.tr,
        'route': '',
        'color': GFColors.DANGER,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meShareProject.tr,
        'route': '',
        'color': GFColors.DARK,
        'shape': GFButtonShape.standard
      },
      {
        'title': Keys.meWechat.tr,
        'route': '',
        'color': GFColors.FOCUS,
        'shape': GFButtonShape.standard
      }
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Column(
        children: [
          GFTypography(
            text: Keys.meCommonTools.tr,
            type: GFTypographyType.typo5,
            //dividerWidth: 25,
            dividerColor: Color(0xFF19CA4B),
          ),
          ListView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 0, bottom: 20, top: 20, right: 0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: gfComponents.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                            onTap: () {},
                            child: GFButton(
                              onPressed: () {
                                //Get.toNamed(gfComponents[index]['route']);
                              },
                              shape: GFButtonShape.standard,
                              color: gfComponents[index]['color'],
                              child: Text(gfComponents[index]['title'],
                                  style:
                                      const TextStyle(color: GFColors.WHITE)),
                            ))),
              )
            ],
          )
        ],
      ),
    );

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: GFTypography(
            text: '常用功能',
            type: GFTypographyType.typo5,
            //dividerWidth: 25,
            dividerColor: Color(0xFF19CA4B),
          ),
        ),
        GFCard(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    shape: GFButtonShape.standard,
                    child: const Text('工具',
                        style: TextStyle(color: GFColors.WHITE)),
                    color: GFColors.PRIMARY,
                  ),
                  GFButton(
                    onPressed: () {},
                    child: const Text('问答',
                        style: TextStyle(color: GFColors.WHITE)),
                    color: GFColors.SECONDARY,
                  ),
                  GFButton(
                    onPressed: () {},
                    child: const Text('消息'),
                    color: GFColors.SUCCESS,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    child: const Text('教程'),
                    color: GFColors.WARNING,
                  ),
                  GFButton(
                    onPressed: () {},
                    child: const Text('待办清单',
                        style: TextStyle(color: GFColors.WHITE)),
                    color: GFColors.DANGER,
                  ),
                  GFButton(
                    onPressed: () {},
                    child: const Text('分享文章'),
                    color: GFColors.INFO,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFButton(
                    onPressed: () {},
                    child: const Text('分享项目'),
                    color: GFColors.LIGHT,
                  ),
                  GFButton(
                    onPressed: () {},
                    child: const Text(
                      '公众号',
                      style: TextStyle(color: GFColors.WHITE),
                    ),
                    color: GFColors.DARK,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildSquareTile(String title, IconData? icon, Widget? route) =>
      InkWell(
        onTap: () {
          Get.to(route);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF333333),
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.61),
                  blurRadius: 6,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                icon,
                color: GFColors.SUCCESS,
                size: 30,
              ),
//            Icon((icon),),
              Text(
                title,
                style: const TextStyle(color: GFColors.WHITE, fontSize: 20),
              )
            ],
          ),
        ),
      );
}
