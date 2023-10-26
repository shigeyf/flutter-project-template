import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../features/cakes/domain/models/cake.dart';

class IsarProviderImpl {
  static Future<Isar> isarDependency() async {
    final appPath = await getApplicationDocumentsDirectory();
    appPath.createSync(recursive: true);
    return await Isar.open([CakeSchema], directory: appPath.path);
  }
}
