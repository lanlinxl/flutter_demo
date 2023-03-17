import 'package:my_flutter_app/common/size_fit.dart';


extension DoubleFit on double {
  double get px {
    return LLSizeFit.setPx(this);
  }

  double get rpx {
    return LLSizeFit.setRpx(this);
  }
}