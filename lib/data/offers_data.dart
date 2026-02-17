import 'package:onebnpl/models/offer.dart';

class OffersRepository {
  static Future<List<Offer>> fetchOffers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const Offer(
        id: '1',
        title: 'Lenovo ThinkPad E14',
        subtitle: 'Grab your at 15% off',
        oldPrice: '80,000',
        newPrice: '68,000',
        imagePath: 'assets/images/dell.png',
      ),
      const Offer(
        id: '2',
        title: 'HP Pavilion 15',
        subtitle: 'Grab your at 15% off',
        oldPrice: '80,000',
        newPrice: '68,000',
        imagePath: 'assets/images/dell.png',
      ),
    ];
  }
}
