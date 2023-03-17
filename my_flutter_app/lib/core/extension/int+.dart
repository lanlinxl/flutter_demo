import 'package:my_flutter_app/common/size_fit.dart';

extension IntFit on int {
  double get px {
    return LLSizeFit.setPx(toDouble());
  }

  double get rpx {
    return LLSizeFit.setRpx(toDouble());
  }
}