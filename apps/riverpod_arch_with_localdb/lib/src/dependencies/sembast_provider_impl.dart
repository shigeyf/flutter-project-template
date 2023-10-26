import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastProviderImpl {
  static Future<Database> databaseDependency() async {
    final appPath = await getApplicationDocumentsDirectory();
    appPath.createSync(recursive: true);
    final dbPath = join(appPath.path, 'cakes.db');
    return await databaseFactoryIo.openDatabase(dbPath);
  }
}
