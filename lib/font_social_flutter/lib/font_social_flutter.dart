library font_social_flutter;

import 'package:flutter/widgets.dart';

class SocialBrand {
  static const IconData zhihu = const _MyIconData(0xe6a2);
  static const IconData wechat = const _MyIconData(0xe697);
  static const IconData alipay = const _MyIconData(0xe698);
  static const IconData weibo = const _MyIconData(0xe6ab);
  static const IconData wechat_friends = const _MyIconData(0xe6ae);
  static const IconData qq = const _MyIconData(0xe6ac);
}

class _MyIconData extends IconData {
  const _MyIconData(int codePoint)
      : super(
    codePoint,
    fontFamily: 'SocialBrand',
    fontPackage: 'font_social_flutter',
  );
}