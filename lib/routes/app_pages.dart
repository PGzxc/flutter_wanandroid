import 'package:flutter_wanandroid/pages/coin/bindings/coin_binding.dart';
import 'package:flutter_wanandroid/pages/coin/views/coin_view.dart';
import 'package:flutter_wanandroid/pages/coin_list/bindings/coin_list_binding.dart';
import 'package:flutter_wanandroid/pages/coin_list/views/coin_list_view.dart';
import 'package:flutter_wanandroid/pages/coin_rank/bindings/coin_rank_binding.dart';
import 'package:flutter_wanandroid/pages/coin_rank/views/coin_rank_view.dart';
import 'package:flutter_wanandroid/pages/login_register/bindings/login_register_binding.dart';
import 'package:flutter_wanandroid/pages/login_register/views/login_register_view.dart';
import 'package:flutter_wanandroid/pages/main/bindings/main_binding.dart';
import 'package:flutter_wanandroid/pages/main/views/main_view.dart';
import 'package:flutter_wanandroid/pages/me/bindings/me_binding.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/pages/me/views/me_view.dart';
import 'package:flutter_wanandroid/pages/message/bindings/message_detail_web_binding.dart';
import 'package:flutter_wanandroid/pages/message/views/message_detail_web_page.dart';
import 'package:flutter_wanandroid/pages/navigation/bindings/navigation_binding.dart';
import 'package:flutter_wanandroid/pages/setting/bindings/setting_binding.dart';
import 'package:flutter_wanandroid/pages/setting/views/setting_view.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/route_manager.dart';
import '../pages/article_webpage/bindings/article_detail_binding.dart';
import '../pages/article_webpage/views/article_detail_page.dart';
import '../pages/language/bindings/language_binding.dart';
import '../pages/language/views/language_view.dart';
import '../pages/message/bindings/message_binding.dart';
import '../pages/not_found/not_found_view.dart';
import '../pages/theme/bindings/theme_binding.dart';
import '../pages/theme/views/theme_view.dart';

/// 日期：2022-05-15
/// 描述：页面路由配置项
/// 说明：nameToRoute将String转换为小写，且添加'/'前缀

class AppPages {
  static String init = Routes.main.nameToRoute();

  static final unknownRoute =
      GetPage(name: Routes.notFound.nameToRoute(), page: () => const NotFound());

  static final routes = [
    ///主界面
    GetPage(
        name: Routes.main.nameToRoute(),
        page: () => const MainView(),
        title: Routes.main,
        bindings: [MainBinding(),NavigationBinding(),MessageBinding()],
       /// binding: MainBinding()
    ),

    ///设置页面
    GetPage(
        name: Routes.setting.nameToRoute(),
        page: () => const SettingView(),
        title: Routes.setting,
        binding: SettingBinding()),

    ///theme主题
    GetPage(
        name: Routes.theme.nameToRoute(),
        page: () => const ThemeView(),
        title: Routes.theme,
        binding: ThemeBinding()),

    ///Language-语言
    GetPage(
        name: Routes.language.nameToRoute(),
        page: () => const LanguageView(),
        title: Routes.language,
        binding: LanguageBinding()),

    ///登陆-注册
    GetPage(
        name: Routes.loginRegister.nameToRoute(),
        page: () => LoginRegisterView(),
        title: Routes.loginRegister,
        binding: LoginRegisterBinding()),

    ///积分-列表
    GetPage(
        name: Routes.coinList.nameToRoute(),
        page: () => const CoinListView(),
        title: Routes.coinList,
        binding: CoinListBinding()),

    ///金币-排行榜
    GetPage(
        name: Routes.coinRank.nameToRoute(),
        page: () => const CoinRankView(),
        title: Routes.coinRank,
        binding: CoinRankBinging()),
    GetPage(
      name: Routes.articleDetail.nameToRoute(),
      page: () => const ArticleDetailPage(),
      title: Routes.articleDetail,
      binding: ArticleDetailBinding()
    ),
    GetPage(
        name: Routes.messageWebView.nameToRoute(),
        page: () => const MessageDetailWebPage(),
        title: Routes.messageWebView,
        binding: MessageDetailWebBinding()
    ),

    ///金币
    // GetPage(
    //     name: Routes.coin.nameToRoute(),
    //     page: () => CoinView(),
    //     title: 'Coin',
    //     binding: CoinBindings()),
  ];
}
