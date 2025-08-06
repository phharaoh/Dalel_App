import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';

void saveData() {
  getIt<CacheHelper>().setData(key: 'isVisited', value: true);
}
