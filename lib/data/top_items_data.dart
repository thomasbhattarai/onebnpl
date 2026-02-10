import 'package:onebnpl/models/top_item.dart';

class TopItemsRepository {
  static Future<List<TopItem>> fetchTopItems() async {
    return const [
      TopItem(label: 'Lenovo', assetPath: 'assets/images/lenovo.png'),
      TopItem(label: 'Dell', assetPath: 'assets/images/dell.png'),
      TopItem(label: 'Asus', assetPath: 'assets/images/asus.png'),
      TopItem(label: 'Epson', assetPath: 'assets/images/epson.png'),
    ];
  }
}
