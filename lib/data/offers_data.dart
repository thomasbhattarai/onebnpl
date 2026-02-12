import 'package:onebnpl/models/offer.dart';

class OffersRepository {
  static Future<List<Offer>> fetchOffers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const Offer(
        title: 'Lenovo ThinkPad E14',
        subtitle: 'Grab your at 15% off',
        oldPrice: '80,000',
        newPrice: '68,000',
        imagePath: 'assets/images/dell.png',
      ),
      const Offer(
        title: 'HP Pavilion 15',
        subtitle: 'Grab your at 15% off',
        oldPrice: '80,000',
        newPrice: '68,000',
        imagePath: 'assets/images/dell.png',
      ),
      const Offer(
        title: 'Samsung Galaxy S24 Ultra',
        subtitle: 'Grab your at 6% off',
        oldPrice: '2,70,000',
        newPrice: '2,53,800',
        imagePath: 'assets/images/dell.png',
      ),
      const Offer(
        title: 'Apple MacBook Air M2',
        subtitle: 'Grab your at 6% off',
        oldPrice: '2,70,000',
        newPrice: '2,53,800',
        imagePath: 'assets/images/dell.png',
      ),
    ];
  }
}
