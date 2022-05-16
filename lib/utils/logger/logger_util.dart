import 'package:logger/logger.dart';
import '../../config/global_config.dart';

/// 日期：2022-05-15
/// 描述：Logger工具类
/// 说明：此为使用第三方库LoggerUtil打印


class LoggerUtil {
  LoggerUtil.v(dynamic v) {
    if (Config.isDebug) {
      Logger().v(v);
    }
  }

  /// 调试
  LoggerUtil.d(dynamic d, {dynamic tag}) {
    if (Config.isDebug) {
      Logger().d(d, tag);
    }
  }

  /// 信息
  LoggerUtil.i(dynamic i, {dynamic tag}) {
    if (Config.isDebug) {
      Logger().i(i, tag);
    }
  }

  /// 错误
  LoggerUtil.e(dynamic e, {dynamic tag}) {
    if (Config.isDebug) {
      Logger().e(e, tag);
    }
  }

  /// 警告
  LoggerUtil.w(dynamic w) {
    if (Config.isDebug) {
      Logger().w(w);
    }
  }

  /// WTF
  LoggerUtil.wtf(dynamic wtf) {
    if (Config.isDebug) {
      Logger().wtf(wtf);
    }
  }
}
