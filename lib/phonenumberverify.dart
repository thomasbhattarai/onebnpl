import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'verificationcode.dart';

class Country {
  final String name;
  final String code;
  final String dialCode;

  const Country({
    required this.name,
    required this.code,
    required this.dialCode,
  });
}

class Phonenumberverify extends StatefulWidget {
  const Phonenumberverify({super.key});

  @override
  State<Phonenumberverify> createState() => _PhonenumberverifyState();
}

class _PhonenumberverifyState extends State<Phonenumberverify> {
  static const List<Country> _countries = [
    Country(name: 'Nepal', code: 'NP', dialCode: '+977'),
    Country(name: 'Afghanistan', code: 'AF', dialCode: '+93'),
    Country(name: 'Albania', code: 'AL', dialCode: '+355'),
    Country(name: 'Algeria', code: 'DZ', dialCode: '+213'),
    Country(name: 'Andorra', code: 'AD', dialCode: '+376'),
    Country(name: 'Angola', code: 'AO', dialCode: '+244'),
    Country(name: 'Antigua and Barbuda', code: 'AG', dialCode: '+1'),
    Country(name: 'Argentina', code: 'AR', dialCode: '+54'),
    Country(name: 'Armenia', code: 'AM', dialCode: '+374'),
    Country(name: 'Australia', code: 'AU', dialCode: '+61'),
    Country(name: 'Austria', code: 'AT', dialCode: '+43'),
    Country(name: 'Azerbaijan', code: 'AZ', dialCode: '+994'),
    Country(name: 'Bahamas', code: 'BS', dialCode: '+1'),
    Country(name: 'Bahrain', code: 'BH', dialCode: '+973'),
    Country(name: 'Bangladesh', code: 'BD', dialCode: '+880'),
    Country(name: 'Barbados', code: 'BB', dialCode: '+1'),
    Country(name: 'Belarus', code: 'BY', dialCode: '+375'),
    Country(name: 'Belgium', code: 'BE', dialCode: '+32'),
    Country(name: 'Belize', code: 'BZ', dialCode: '+501'),
    Country(name: 'Benin', code: 'BJ', dialCode: '+229'),
    Country(name: 'Bhutan', code: 'BT', dialCode: '+975'),
    Country(name: 'Bolivia', code: 'BO', dialCode: '+591'),
    Country(name: 'Bosnia and Herzegovina', code: 'BA', dialCode: '+387'),
    Country(name: 'Botswana', code: 'BW', dialCode: '+267'),
    Country(name: 'Brazil', code: 'BR', dialCode: '+55'),
    Country(name: 'Brunei', code: 'BN', dialCode: '+673'),
    Country(name: 'Bulgaria', code: 'BG', dialCode: '+359'),
    Country(name: 'Burkina Faso', code: 'BF', dialCode: '+226'),
    Country(name: 'Burundi', code: 'BI', dialCode: '+257'),
    Country(name: 'Cabo Verde', code: 'CV', dialCode: '+238'),
    Country(name: 'Cambodia', code: 'KH', dialCode: '+855'),
    Country(name: 'Cameroon', code: 'CM', dialCode: '+237'),
    Country(name: 'Canada', code: 'CA', dialCode: '+1'),
    Country(name: 'Central African Republic', code: 'CF', dialCode: '+236'),
    Country(name: 'Chad', code: 'TD', dialCode: '+235'),
    Country(name: 'Chile', code: 'CL', dialCode: '+56'),
    Country(name: 'China', code: 'CN', dialCode: '+86'),
    Country(name: 'Colombia', code: 'CO', dialCode: '+57'),
    Country(name: 'Comoros', code: 'KM', dialCode: '+269'),
    Country(name: 'Congo (Congo-Brazzaville)', code: 'CG', dialCode: '+242'),
    Country(name: 'Costa Rica', code: 'CR', dialCode: '+506'),
    Country(name: 'Croatia', code: 'HR', dialCode: '+385'),
    Country(name: 'Cuba', code: 'CU', dialCode: '+53'),
    Country(name: 'Cyprus', code: 'CY', dialCode: '+357'),
    Country(name: 'Czechia', code: 'CZ', dialCode: '+420'),
    Country(
      name: 'Democratic Republic of the Congo',
      code: 'CD',
      dialCode: '+243',
    ),
    Country(name: 'Denmark', code: 'DK', dialCode: '+45'),
    Country(name: 'Djibouti', code: 'DJ', dialCode: '+253'),
    Country(name: 'Dominica', code: 'DM', dialCode: '+1'),
    Country(name: 'Dominican Republic', code: 'DO', dialCode: '+1'),
    Country(name: 'Ecuador', code: 'EC', dialCode: '+593'),
    Country(name: 'Egypt', code: 'EG', dialCode: '+20'),
    Country(name: 'El Salvador', code: 'SV', dialCode: '+503'),
    Country(name: 'Equatorial Guinea', code: 'GQ', dialCode: '+240'),
    Country(name: 'Eritrea', code: 'ER', dialCode: '+291'),
    Country(name: 'Estonia', code: 'EE', dialCode: '+372'),
    Country(name: 'Eswatini', code: 'SZ', dialCode: '+268'),
    Country(name: 'Ethiopia', code: 'ET', dialCode: '+251'),
    Country(name: 'Fiji', code: 'FJ', dialCode: '+679'),
    Country(name: 'Finland', code: 'FI', dialCode: '+358'),
    Country(name: 'France', code: 'FR', dialCode: '+33'),
    Country(name: 'Gabon', code: 'GA', dialCode: '+241'),
    Country(name: 'Gambia', code: 'GM', dialCode: '+220'),
    Country(name: 'Georgia', code: 'GE', dialCode: '+995'),
    Country(name: 'Germany', code: 'DE', dialCode: '+49'),
    Country(name: 'Ghana', code: 'GH', dialCode: '+233'),
    Country(name: 'Greece', code: 'GR', dialCode: '+30'),
    Country(name: 'Grenada', code: 'GD', dialCode: '+1'),
    Country(name: 'Guatemala', code: 'GT', dialCode: '+502'),
    Country(name: 'Guinea', code: 'GN', dialCode: '+224'),
    Country(name: 'Guinea-Bissau', code: 'GW', dialCode: '+245'),
    Country(name: 'Guyana', code: 'GY', dialCode: '+592'),
    Country(name: 'Haiti', code: 'HT', dialCode: '+509'),
    Country(name: 'Holy See', code: 'VA', dialCode: '+379'),
    Country(name: 'Honduras', code: 'HN', dialCode: '+504'),
    Country(name: 'Hungary', code: 'HU', dialCode: '+36'),
    Country(name: 'Iceland', code: 'IS', dialCode: '+354'),
    Country(name: 'India', code: 'IN', dialCode: '+91'),
    Country(name: 'Indonesia', code: 'ID', dialCode: '+62'),
    Country(name: 'Iran', code: 'IR', dialCode: '+98'),
    Country(name: 'Iraq', code: 'IQ', dialCode: '+964'),
    Country(name: 'Ireland', code: 'IE', dialCode: '+353'),
    Country(name: 'Israel', code: 'IL', dialCode: '+972'),
    Country(name: 'Italy', code: 'IT', dialCode: '+39'),
    Country(name: 'Jamaica', code: 'JM', dialCode: '+1'),
    Country(name: 'Japan', code: 'JP', dialCode: '+81'),
    Country(name: 'Jordan', code: 'JO', dialCode: '+962'),
    Country(name: 'Kazakhstan', code: 'KZ', dialCode: '+7'),
    Country(name: 'Kenya', code: 'KE', dialCode: '+254'),
    Country(name: 'Kiribati', code: 'KI', dialCode: '+686'),
    Country(name: 'Kuwait', code: 'KW', dialCode: '+965'),
    Country(name: 'Kyrgyzstan', code: 'KG', dialCode: '+996'),
    Country(name: 'Laos', code: 'LA', dialCode: '+856'),
    Country(name: 'Latvia', code: 'LV', dialCode: '+371'),
    Country(name: 'Lebanon', code: 'LB', dialCode: '+961'),
    Country(name: 'Lesotho', code: 'LS', dialCode: '+266'),
    Country(name: 'Liberia', code: 'LR', dialCode: '+231'),
    Country(name: 'Libya', code: 'LY', dialCode: '+218'),
    Country(name: 'Liechtenstein', code: 'LI', dialCode: '+423'),
    Country(name: 'Lithuania', code: 'LT', dialCode: '+370'),
    Country(name: 'Luxembourg', code: 'LU', dialCode: '+352'),
    Country(name: 'Madagascar', code: 'MG', dialCode: '+261'),
    Country(name: 'Malawi', code: 'MW', dialCode: '+265'),
    Country(name: 'Malaysia', code: 'MY', dialCode: '+60'),
    Country(name: 'Maldives', code: 'MV', dialCode: '+960'),
    Country(name: 'Mali', code: 'ML', dialCode: '+223'),
    Country(name: 'Malta', code: 'MT', dialCode: '+356'),
    Country(name: 'Marshall Islands', code: 'MH', dialCode: '+692'),
    Country(name: 'Mauritania', code: 'MR', dialCode: '+222'),
    Country(name: 'Mauritius', code: 'MU', dialCode: '+230'),
    Country(name: 'Mexico', code: 'MX', dialCode: '+52'),
    Country(name: 'Micronesia', code: 'FM', dialCode: '+691'),
    Country(name: 'Moldova', code: 'MD', dialCode: '+373'),
    Country(name: 'Monaco', code: 'MC', dialCode: '+377'),
    Country(name: 'Mongolia', code: 'MN', dialCode: '+976'),
    Country(name: 'Montenegro', code: 'ME', dialCode: '+382'),
    Country(name: 'Morocco', code: 'MA', dialCode: '+212'),
    Country(name: 'Mozambique', code: 'MZ', dialCode: '+258'),
    Country(name: 'Myanmar (Burma)', code: 'MM', dialCode: '+95'),
    Country(name: 'Namibia', code: 'NA', dialCode: '+264'),
    Country(name: 'Nauru', code: 'NR', dialCode: '+674'),
    Country(name: 'Netherlands', code: 'NL', dialCode: '+31'),
    Country(name: 'New Zealand', code: 'NZ', dialCode: '+64'),
    Country(name: 'Nicaragua', code: 'NI', dialCode: '+505'),
    Country(name: 'Niger', code: 'NE', dialCode: '+227'),
    Country(name: 'Nigeria', code: 'NG', dialCode: '+234'),
    Country(name: 'North Korea', code: 'KP', dialCode: '+850'),
    Country(name: 'North Macedonia', code: 'MK', dialCode: '+389'),
    Country(name: 'Norway', code: 'NO', dialCode: '+47'),
    Country(name: 'Oman', code: 'OM', dialCode: '+968'),
    Country(name: 'Pakistan', code: 'PK', dialCode: '+92'),
    Country(name: 'Palau', code: 'PW', dialCode: '+680'),
    Country(name: 'Palestine State', code: 'PS', dialCode: '+970'),
    Country(name: 'Panama', code: 'PA', dialCode: '+507'),
    Country(name: 'Papua New Guinea', code: 'PG', dialCode: '+675'),
    Country(name: 'Paraguay', code: 'PY', dialCode: '+595'),
    Country(name: 'Peru', code: 'PE', dialCode: '+51'),
    Country(name: 'Philippines', code: 'PH', dialCode: '+63'),
    Country(name: 'Poland', code: 'PL', dialCode: '+48'),
    Country(name: 'Portugal', code: 'PT', dialCode: '+351'),
    Country(name: 'Qatar', code: 'QA', dialCode: '+974'),
    Country(name: 'Romania', code: 'RO', dialCode: '+40'),
    Country(name: 'Russia', code: 'RU', dialCode: '+7'),
    Country(name: 'Rwanda', code: 'RW', dialCode: '+250'),
    Country(name: 'Saint Kitts and Nevis', code: 'KN', dialCode: '+1'),
    Country(name: 'Saint Lucia', code: 'LC', dialCode: '+1'),
    Country(
      name: 'Saint Vincent and the Grenadines',
      code: 'VC',
      dialCode: '+1',
    ),
    Country(name: 'Samoa', code: 'WS', dialCode: '+685'),
    Country(name: 'San Marino', code: 'SM', dialCode: '+378'),
    Country(name: 'Sao Tome and Principe', code: 'ST', dialCode: '+239'),
    Country(name: 'Saudi Arabia', code: 'SA', dialCode: '+966'),
    Country(name: 'Senegal', code: 'SN', dialCode: '+221'),
    Country(name: 'Serbia', code: 'RS', dialCode: '+381'),
    Country(name: 'Seychelles', code: 'SC', dialCode: '+248'),
    Country(name: 'Sierra Leone', code: 'SL', dialCode: '+232'),
    Country(name: 'Singapore', code: 'SG', dialCode: '+65'),
    Country(name: 'Slovakia', code: 'SK', dialCode: '+421'),
    Country(name: 'Slovenia', code: 'SI', dialCode: '+386'),
    Country(name: 'Solomon Islands', code: 'SB', dialCode: '+677'),
    Country(name: 'Somalia', code: 'SO', dialCode: '+252'),
    Country(name: 'South Africa', code: 'ZA', dialCode: '+27'),
    Country(name: 'South Korea', code: 'KR', dialCode: '+82'),
    Country(name: 'South Sudan', code: 'SS', dialCode: '+211'),
    Country(name: 'Spain', code: 'ES', dialCode: '+34'),
    Country(name: 'Sri Lanka', code: 'LK', dialCode: '+94'),
    Country(name: 'Sudan', code: 'SD', dialCode: '+249'),
    Country(name: 'Suriname', code: 'SR', dialCode: '+597'),
    Country(name: 'Sweden', code: 'SE', dialCode: '+46'),
    Country(name: 'Switzerland', code: 'CH', dialCode: '+41'),
    Country(name: 'Syria', code: 'SY', dialCode: '+963'),
    Country(name: 'Tajikistan', code: 'TJ', dialCode: '+992'),
    Country(name: 'Tanzania', code: 'TZ', dialCode: '+255'),
    Country(name: 'Thailand', code: 'TH', dialCode: '+66'),
    Country(name: 'Timor-Leste', code: 'TL', dialCode: '+670'),
    Country(name: 'Togo', code: 'TG', dialCode: '+228'),
    Country(name: 'Tonga', code: 'TO', dialCode: '+676'),
    Country(name: 'Trinidad and Tobago', code: 'TT', dialCode: '+1'),
    Country(name: 'Tunisia', code: 'TN', dialCode: '+216'),
    Country(name: 'Turkey', code: 'TR', dialCode: '+90'),
    Country(name: 'Turkmenistan', code: 'TM', dialCode: '+993'),
    Country(name: 'Tuvalu', code: 'TV', dialCode: '+688'),
    Country(name: 'Uganda', code: 'UG', dialCode: '+256'),
    Country(name: 'Ukraine', code: 'UA', dialCode: '+380'),
    Country(name: 'United Arab Emirates', code: 'AE', dialCode: '+971'),
    Country(name: 'United Kingdom', code: 'GB', dialCode: '+44'),
    Country(name: 'United States of America', code: 'US', dialCode: '+1'),
    Country(name: 'Uruguay', code: 'UY', dialCode: '+598'),
    Country(name: 'Uzbekistan', code: 'UZ', dialCode: '+998'),
    Country(name: 'Vanuatu', code: 'VU', dialCode: '+678'),
    Country(name: 'Venezuela', code: 'VE', dialCode: '+58'),
    Country(name: 'Vietnam', code: 'VN', dialCode: '+84'),
    Country(name: 'Yemen', code: 'YE', dialCode: '+967'),
    Country(name: 'Zambia', code: 'ZM', dialCode: '+260'),
    Country(name: 'Zimbabwe', code: 'ZW', dialCode: '+263'),
  ];

  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countries.firstWhere(
      (country) => country.code == 'NP',
      orElse: () => _countries.first,
    );
  }

  String _flagEmoji(String countryCode) {
    final upper = countryCode.toUpperCase();
    if (upper.length != 2) {
      return '';
    }
    final codeUnits = upper.codeUnits.map((c) => c + 127397).toList();
    return String.fromCharCodes(codeUnits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
          ),

          // Top centered logo and tagline
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/bnpllogo.png',
                  width: 380,
                  height: 280,
                  fit: BoxFit.contain,
                ),
                Transform.translate(
                  offset: const Offset(0, -110), // move text upwards
                  child: const Text(
                    'Live Your Dreams Now',
                    textAlign: TextAlign.center, // center text
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                      height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main content card
          Positioned(
            left: 14,
            right: 14,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
              child: Container(
                height: 480,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF3F0FF), Color(0xFF7A69FF)],
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Welcome text and credit card on same line
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Welcome,",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFF4C3EA6),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Image.asset(
                                'assets/images/creditcard.png',
                                width: 80,
                                height: 80,
                              ),
                            ],
                          ),

                          // Negative gap using Transform
                          Transform.translate(
                            offset: const Offset(0, -20), // move up by 4 pixels
                            child: const Text(
                              "Verify with phone number or email.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6F6F6F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          const Text(
                            "Enter Your Mobile Number :",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Phone number input with country selector
                          Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3D6C63C8),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<Country>(
                                    value: _selectedCountry,
                                    isDense: true,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    items: _countries
                                        .map(
                                          (
                                            country,
                                          ) => DropdownMenuItem<Country>(
                                            value: country,
                                            child: Row(
                                              children: [
                                                Text(
                                                  _flagEmoji(country.code),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  '${country.code} ${country.dialCode}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF4C3EA6),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      setState(() {
                                        _selectedCountry = value;
                                      });
                                    },
                                  ),
                                ),
                                const VerticalDivider(
                                  width: 16,
                                  thickness: 1,
                                  color: Color(0xFFE0E0E0),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: "",
                                      hintStyle: TextStyle(
                                        fontSize: 12.5,
                                        color: Color(0xFF6F6F6F),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),

                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFBDBDBD),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF6F6F6F),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Color(0xFFBDBDBD),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          const Text(
                            "Enter Your Email :",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4C3EA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Email input
                          Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3D6C63C8),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "",
                                hintStyle: TextStyle(
                                  fontSize: 12.5,
                                  color: Color(0xFF6F6F6F),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Continue button
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 150,
                              height: 42,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Verificationcode(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4E46D9),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Next",
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),

                          // Terms and conditions
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 251, 251),
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      "By Creating this account you agree with our ",
                                ),
                                TextSpan(
                                  text: "Terms and Conditions",
                                  style: const TextStyle(
                                    color: Color(0xFFE53935),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to terms and conditions
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bottom illustration
                    Positioned(
                      left: 10,
                      bottom: 55,
                      child: SizedBox(
                        width: 190,
                        height: 130,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 10,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/gigure.png',
                                width: 180,
                                height: 140,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
