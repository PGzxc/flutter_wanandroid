# flutter_wanandroid
## 一 项目介绍
* 本项目基于：GetX开发
* 本项目所使用的API均来自：WanAndroid官网(https://www.wanandroid.com/blog/show/2)


## 二 开发工具及版本
* 开发系统：macos 12.3.1
* 开发工具：Intellij IDEA Community 2021.1
* Flutter：3.0.0
* Dart: 2.17.0
* .gitignore：使用的Dart类型

## 三 项目预览

## 四 版本
### v1.0
* 项目框架搭建(抽屉+BottomBar)
* 抽屉显示快捷信息
* BottomBar：显示导航信息

### v2.0
* 添加设置页面
* 添加切换主题和语言功能
* 添加shared_preferences工具库

### v3.0
* 使用GetConnect搭建网络访问框架，使用baseResponse进行结果解析
* 接口返回的结果，使用https://caijinglong.github.io/json2dart/index.html快速生成，放到models包中
* 登陆注册界面及功能完成
* 登陆/注册之后的Cookie数据保存到SharedPreference中，在接口请求前，读取SharedPreference中到Cookie数据
* 导入google的UI Kit工具库
* 删除之前到flutter_zoom_drawer，使用google自带的drawer
* 列表项需要缓存，只需要使用 KeepAliveWrapper包裹，防止多次加载

## 五 开源库
* Getx:https://github.com/jonataslaw/getx
* logger: https://pub:flutter-io:cn/packages/logger
* flutter_zoom_drawer:https://pub.flutter-io.cn/packages/flutter_zoom_drawer
* shared_preferences：https://pub.flutter-io.cn/packages/shared_preferences
* connectivity_plus：https://pub.flutter-io.cn/packages/connectivity_plus
* json_annotation、json_serializable、build_runner：
* flutter_easyloading：https://pub.flutter-io.cn/packages/flutter_easyloading
* getwidget：https://pub.flutter-io.cn/packages/getwidget




