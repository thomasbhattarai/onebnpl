import 'package:onebnpl/models/promo_card.dart';

class PromoCardRepository {
  static Future<PromoCard> fetchPromoCard() async {
    return const PromoCard(
      title: 'LEGION',
      subtitle: 'by Lenovo',
      imagePath: 'assets/images/p.png',
      ctaText: 'PRE-ORDER NOW',
    );
  }
}
