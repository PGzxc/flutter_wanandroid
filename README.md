# flutter_wanandroid
## 一 项目介绍
* 本项目基于：GetX开发
* 本项目所使用的API均来自：WanAndroid官网(https://www.wanandroid.com/blog/show/2)


## 二 开发工具及版本
* 开发系统：macos 12.4
* 开发工具：Intellij IDEA Community 2022.1.1
* Flutter：3.0.1
* Dart: 2.17.1
* .gitignore：使用的Dart类型

## 三 下载及项目预览

### APK下载
![][w-download]

### 项目预览

| ![][w-1] | ![][w-2]  | ![][w-3] | ![][w-4] |
| -------- | --------- | -------- | -------- |
| ![][w-5] | ![][w-6]  | ![][w-7]| ![][w-8] |
| ![][w-9] | ![][w-10] | ![][w-11]| ![][w-12]|
| ![][w-13]| ![][w-14] | ![][w-15]| ![][w-16]|


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

### v4.0
* 对网络访进一步封装。网络访问前对设置使用ApiProvider(比如过期时间、拦截器、Cookie...)
* 进行网络访问时，通过httpManager，其中对网络访问通过ApiProvider调用get/post等相应等方法
* 根据BaseResponse中errorCode判断，分别返回success、fail、error等数据结果
* 导入三方库flutter_native_splash。设置项目启动默认画面，防止白屏
* 导入三方库flutter_pulltorefresh，加入下拉刷新和上拉加载功能
* 导入三方库shimmer。拉表刷新时，显示前的加载框架。
* 我->排名和积分列表，功能完成
* Drawer抽屉添加，点击头像登陆和登陆后退出功能
* 修改安卓和IOS应用显示等名称
* 未登录时，不显示退出按钮。登陆后，显示退出按钮
### v5.0
* 使用google组件carousel显示首页轮播图
* 首页文章显示
* 使用三方库webview_flutter，显示网页视图
* 使用三方库badges。显示bottombar带消息的数量，并通过num控制badges的显示与否
### v6.0
* 使用google-GFSegmentTab，将导航分为：体系，常用网站，公众号三个Tab部分
* 使用google-Stick-header，构建体系页面
* 导航-体系/常用网站/公众号完成
### v7.0
* 使用google-GFSegmentTab，将导航分为：未读消息和已读消息两个部分
* 填充：未读消息和已读消息列表
* 在BaseController中根据用户是否已经登陆请求数据接口，展示消息数据
* 将MessageControlLer中读取未读消息的数据，移动到未读消息控制器中，在数据请求到同时调用此接口

### v8.0
* 项目分类、项目列表数据

### v9.0—2023年07月09日升级说明

依赖库

* 升级依赖库
* 删除badges
* 删除flutter_html

开发工具及版本

* gradle：gradle-7.4-all
* Flutter：3.10.5
* Dart：3.0.5


## 五 使用的指令
### 5.1 splash更新
flutter pub run flutter_native_splash:create

### 5.2 生成model文件
flutter pub run build_runner build

### 5.3 项目打包输出
flutter build apk --split-per-abi

## 六 开源库
* Getx:https://github.com/jonataslaw/getx
* logger: https://pub:flutter-io:cn/packages/logger
* flutter_zoom_drawer:https://pub.flutter-io.cn/packages/flutter_zoom_drawer
* shared_preferences：https://pub.flutter-io.cn/packages/shared_preferences
* connectivity_plus：https://pub.flutter-io.cn/packages/connectivity_plus
* json_annotation、json_serializable、build_runner：
* flutter_easyloading：https://pub.flutter-io.cn/packages/flutter_easyloading
* getwidget：https://pub.flutter-io.cn/packages/getwidget
* flutter_native_splash：https://pub.flutter-io.cn/packages/flutter_native_splash
* pull_to_refresh：https://pub.flutter-io.cn/packages/pull_to_refresh
* lottie：https://pub.flutter-io.cn/packages/lottie
* sprintf：https://pub.flutter-io.cn/packages/sprintf
* shimmer：https://pub.flutter-io.cn/packages/shimmer
* cached_network_image：https://pub.flutter-io.cn/packages/cached_network_image
* flutter_html：https://pub.flutter-io.cn/packages/webview_flutter
* webview_flutter：https://pub.flutter-io.cn/packages/webview_flutter
* badges：https://pub.flutter-io.cn/packages/badges



[w-download]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/apps/wanandroid-download.png

[w-1]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_login.png
[w-2]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_register.png
[w-3]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_home.png
[w-4]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_left_drawer.png
[w-5]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_nav_tree.png
[w-6]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_nav_site.png
[w-7]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_nav_wx.png
[w-8]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_nav_project.png
[w-9]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_message_unread_list.png
[w-10]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_message_read_list.png
[w-11]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_me_unlogin.png
[w-12]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_me_login.png
[w-13]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_coin_rank.png
[w-14]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_coin_sigin.png
[w-15]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_article_webpage.png
[w-16]:https://fastly.jsdelivr.net/gh/PGzxc/CDN@master/blog-resume/w_message_webpage.png




