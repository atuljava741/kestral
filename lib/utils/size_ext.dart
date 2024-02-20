import 'utils.dart';

extension SizeExt on num {
  double get Sw => Utils.getWidth(this);

  double get Sh => Utils.getHeight(this);

}
