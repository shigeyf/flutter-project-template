import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import '../features/todo/domain/models/todo.dart';

class IsarProviderImpl {
  static Future<Isar> isarDependency() async {
    final appPath = await getApplicationDocumentsDirectory();
    appPath.createSync(recursive: true);
    return await Isar.open([TodoSchema], directory: appPath.path);
  }
}
