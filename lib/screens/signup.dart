import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';

class Country {
  final String name;
  final String code;

  const Country({required this.name, required this.code});
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  static const List<Country> _countries = [
    Country(name: 'Nepal', code: 'NP'),
    Country(name: 'Afghanistan', code: 'AF'),
    Country(name: 'Albania', code: 'AL'),
    Country(name: 'Algeria', code: 'DZ'),
    Country(name: 'Andorra', code: 'AD'),
    Country(name: 'Angola', code: 'AO'),
    Country(name: 'Antigua and Barbuda', code: 'AG'),
    Country(name: 'Argentina', code: 'AR'),
    Country(name: 'Armenia', code: 'AM'),
    Country(name: 'Australia', code: 'AU'),
    Country(name: 'Austria', code: 'AT'),
    Country(name: 'Azerbaijan', code: 'AZ'),
    Country(name: 'Bahamas', code: 'BS'),
    Country(name: 'Bahrain', code: 'BH'),
    Country(name: 'Bangladesh', code: 'BD'),
    Country(name: 'Barbados', code: 'BB'),
    Country(name: 'Belarus', code: 'BY'),
    Country(name: 'Belgium', code: 'BE'),
    Country(name: 'Belize', code: 'BZ'),
    Country(name: 'Benin', code: 'BJ'),
    Country(name: 'Bhutan', code: 'BT'),
    Country(name: 'Bolivia', code: 'BO'),
    Country(name: 'Bosnia and Herzegovina', code: 'BA'),
    Country(name: 'Botswana', code: 'BW'),
    Country(name: 'Brazil', code: 'BR'),
    Country(name: 'Brunei', code: 'BN'),
    Country(name: 'Bulgaria', code: 'BG'),
    Country(name: 'Burkina Faso', code: 'BF'),
    Country(name: 'Burundi', code: 'BI'),
    Country(name: 'Cabo Verde', code: 'CV'),
    Country(name: 'Cambodia', code: 'KH'),
    Country(name: 'Cameroon', code: 'CM'),
    Country(name: 'Canada', code: 'CA'),
    Country(name: 'Central African Republic', code: 'CF'),
    Country(name: 'Chad', code: 'TD'),
    Country(name: 'Chile', code: 'CL'),
    Country(name: 'China', code: 'CN'),
    Country(name: 'Colombia', code: 'CO'),
    Country(name: 'Comoros', code: 'KM'),
    Country(name: 'Congo (Congo-Brazzaville)', code: 'CG'),
    Country(name: 'Costa Rica', code: 'CR'),
    Country(name: 'Croatia', code: 'HR'),
    Country(name: 'Cuba', code: 'CU'),
    Country(name: 'Cyprus', code: 'CY'),
    Country(name: 'Czechia', code: 'CZ'),
    Country(name: 'Democratic Republic of the Congo', code: 'CD'),
    Country(name: 'Denmark', code: 'DK'),
    Country(name: 'Djibouti', code: 'DJ'),
    Country(name: 'Dominica', code: 'DM'),
    Country(name: 'Dominican Republic', code: 'DO'),
    Country(name: 'Ecuador', code: 'EC'),
    Country(name: 'Egypt', code: 'EG'),
    Country(name: 'El Salvador', code: 'SV'),
    Country(name: 'Equatorial Guinea', code: 'GQ'),
    Country(name: 'Eritrea', code: 'ER'),
    Country(name: 'Estonia', code: 'EE'),
    Country(name: 'Eswatini', code: 'SZ'),
    Country(name: 'Ethiopia', code: 'ET'),
    Country(name: 'Fiji', code: 'FJ'),
    Country(name: 'Finland', code: 'FI'),
    Country(name: 'France', code: 'FR'),
    Country(name: 'Gabon', code: 'GA'),
    Country(name: 'Gambia', code: 'GM'),
    Country(name: 'Georgia', code: 'GE'),
    Country(name: 'Germany', code: 'DE'),
    Country(name: 'Ghana', code: 'GH'),
    Country(name: 'Greece', code: 'GR'),
    Country(name: 'Grenada', code: 'GD'),
    Country(name: 'Guatemala', code: 'GT'),
    Country(name: 'Guinea', code: 'GN'),
    Country(name: 'Guinea-Bissau', code: 'GW'),
    Country(name: 'Guyana', code: 'GY'),
    Country(name: 'Haiti', code: 'HT'),
    Country(name: 'Holy See', code: 'VA'),
    Country(name: 'Honduras', code: 'HN'),
    Country(name: 'Hungary', code: 'HU'),
    Country(name: 'Iceland', code: 'IS'),
    Country(name: 'India', code: 'IN'),
    Country(name: 'Indonesia', code: 'ID'),
    Country(name: 'Iran', code: 'IR'),
    Country(name: 'Iraq', code: 'IQ'),
    Country(name: 'Ireland', code: 'IE'),
    Country(name: 'Israel', code: 'IL'),
    Country(name: 'Italy', code: 'IT'),
    Country(name: 'Jamaica', code: 'JM'),
    Country(name: 'Japan', code: 'JP'),
    Country(name: 'Jordan', code: 'JO'),
    Country(name: 'Kazakhstan', code: 'KZ'),
    Country(name: 'Kenya', code: 'KE'),
    Country(name: 'Kiribati', code: 'KI'),
    Country(name: 'Kuwait', code: 'KW'),
    Country(name: 'Kyrgyzstan', code: 'KG'),
    Country(name: 'Laos', code: 'LA'),
    Country(name: 'Latvia', code: 'LV'),
    Country(name: 'Lebanon', code: 'LB'),
    Country(name: 'Lesotho', code: 'LS'),
    Country(name: 'Liberia', code: 'LR'),
    Country(name: 'Libya', code: 'LY'),
    Country(name: 'Liechtenstein', code: 'LI'),
    Country(name: 'Lithuania', code: 'LT'),
    Country(name: 'Luxembourg', code: 'LU'),
    Country(name: 'Madagascar', code: 'MG'),
    Country(name: 'Malawi', code: 'MW'),
    Country(name: 'Malaysia', code: 'MY'),
    Country(name: 'Maldives', code: 'MV'),
    Country(name: 'Mali', code: 'ML'),
    Country(name: 'Malta', code: 'MT'),
    Country(name: 'Marshall Islands', code: 'MH'),
    Country(name: 'Mauritania', code: 'MR'),
    Country(name: 'Mauritius', code: 'MU'),
    Country(name: 'Mexico', code: 'MX'),
    Country(name: 'Micronesia', code: 'FM'),
    Country(name: 'Moldova', code: 'MD'),
    Country(name: 'Monaco', code: 'MC'),
    Country(name: 'Mongolia', code: 'MN'),
    Country(name: 'Montenegro', code: 'ME'),
    Country(name: 'Morocco', code: 'MA'),
    Country(name: 'Mozambique', code: 'MZ'),
    Country(name: 'Myanmar (Burma)', code: 'MM'),
    Country(name: 'Namibia', code: 'NA'),
    Country(name: 'Nauru', code: 'NR'),
    Country(name: 'Netherlands', code: 'NL'),
    Country(name: 'New Zealand', code: 'NZ'),
    Country(name: 'Nicaragua', code: 'NI'),
    Country(name: 'Niger', code: 'NE'),
    Country(name: 'Nigeria', code: 'NG'),
    Country(name: 'North Korea', code: 'KP'),
    Country(name: 'North Macedonia', code: 'MK'),
    Country(name: 'Norway', code: 'NO'),
    Country(name: 'Oman', code: 'OM'),
    Country(name: 'Pakistan', code: 'PK'),
    Country(name: 'Palau', code: 'PW'),
    Country(name: 'Palestine State', code: 'PS'),
    Country(name: 'Panama', code: 'PA'),
    Country(name: 'Papua New Guinea', code: 'PG'),
    Country(name: 'Paraguay', code: 'PY'),
    Country(name: 'Peru', code: 'PE'),
    Country(name: 'Philippines', code: 'PH'),
    Country(name: 'Poland', code: 'PL'),
    Country(name: 'Portugal', code: 'PT'),
    Country(name: 'Qatar', code: 'QA'),
    Country(name: 'Romania', code: 'RO'),
    Country(name: 'Russia', code: 'RU'),
    Country(name: 'Rwanda', code: 'RW'),
    Country(name: 'Saint Kitts and Nevis', code: 'KN'),
    Country(name: 'Saint Lucia', code: 'LC'),
    Country(name: 'Saint Vincent and the Grenadines', code: 'VC'),
    Country(name: 'Samoa', code: 'WS'),
    Country(name: 'San Marino', code: 'SM'),
    Country(name: 'Sao Tome and Principe', code: 'ST'),
    Country(name: 'Saudi Arabia', code: 'SA'),
    Country(name: 'Senegal', code: 'SN'),
    Country(name: 'Serbia', code: 'RS'),
    Country(name: 'Seychelles', code: 'SC'),
    Country(name: 'Sierra Leone', code: 'SL'),
    Country(name: 'Singapore', code: 'SG'),
    Country(name: 'Slovakia', code: 'SK'),
    Country(name: 'Slovenia', code: 'SI'),
    Country(name: 'Solomon Islands', code: 'SB'),
    Country(name: 'Somalia', code: 'SO'),
    Country(name: 'South Africa', code: 'ZA'),
    Country(name: 'South Korea', code: 'KR'),
    Country(name: 'South Sudan', code: 'SS'),
    Country(name: 'Spain', code: 'ES'),
    Country(name: 'Sri Lanka', code: 'LK'),
    Country(name: 'Sudan', code: 'SD'),
    Country(name: 'Suriname', code: 'SR'),
    Country(name: 'Sweden', code: 'SE'),
    Country(name: 'Switzerland', code: 'CH'),
    Country(name: 'Syria', code: 'SY'),
    Country(name: 'Tajikistan', code: 'TJ'),
    Country(name: 'Tanzania', code: 'TZ'),
    Country(name: 'Thailand', code: 'TH'),
    Country(name: 'Timor-Leste', code: 'TL'),
    Country(name: 'Togo', code: 'TG'),
    Country(name: 'Tonga', code: 'TO'),
    Country(name: 'Trinidad and Tobago', code: 'TT'),
    Country(name: 'Tunisia', code: 'TN'),
    Country(name: 'Turkey', code: 'TR'),
    Country(name: 'Turkmenistan', code: 'TM'),
    Country(name: 'Tuvalu', code: 'TV'),
    Country(name: 'Uganda', code: 'UG'),
    Country(name: 'Ukraine', code: 'UA'),
    Country(name: 'United Arab Emirates', code: 'AE'),
    Country(name: 'United Kingdom', code: 'GB'),
    Country(name: 'United States of America', code: 'US'),
    Country(name: 'Uruguay', code: 'UY'),
    Country(name: 'Uzbekistan', code: 'UZ'),
    Country(name: 'Vanuatu', code: 'VU'),
    Country(name: 'Venezuela', code: 'VE'),
    Country(name: 'Vietnam', code: 'VN'),
    Country(name: 'Yemen', code: 'YE'),
    Country(name: 'Zambia', code: 'ZM'),
    Country(name: 'Zimbabwe', code: 'ZW'),
  ];
  static const List<String> _provinces = [
    'Koshi',
    'Madhesh',
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpashchim',
  ];

  static const Map<String, List<String>> _districtsByProvince = {
    'Koshi': [
      'Bhojpur',
      'Dhankuta',
      'Ilam',
      'Jhapa',
      'Khotang',
      'Morang',
      'Okhaldhunga',
      'Panchthar',
      'Sankhuwasabha',
      'Solukhumbu',
      'Sunsari',
      'Taplejung',
      'Terhathum',
      'Udayapur',
    ],
    'Madhesh': [
      'Bara',
      'Dhanusha',
      'Mahottari',
      'Parsa',
      'Rautahat',
      'Saptari',
      'Sarlahi',
      'Siraha',
    ],
    'Bagmati': [
      'Bhaktapur',
      'Chitwan',
      'Dhading',
      'Dolakha',
      'Kathmandu',
      'Kavrepalanchok',
      'Lalitpur',
      'Makwanpur',
      'Nuwakot',
      'Ramechhap',
      'Rasuwa',
      'Sindhuli',
      'Sindhupalchok',
    ],
    'Gandaki': [
      'Baglung',
      'Gorkha',
      'Kaski',
      'Lamjung',
      'Manang',
      'Mustang',
      'Myagdi',
      'Nawalpur',
      'Parbat',
      'Syangja',
      'Tanahun',
    ],
    'Lumbini': [
      'Arghakhanchi',
      'Banke',
      'Bardiya',
      'Dang',
      'Gulmi',
      'Kapilvastu',
      'Nawalparasi West',
      'Palpa',
      'Pyuthan',
      'Rolpa',
      'Rupandehi',
      'Rukum East',
    ],
    'Karnali': [
      'Dailekh',
      'Dolpa',
      'Humla',
      'Jumla',
      'Kalikot',
      'Mugu',
      'Rukum West',
      'Salyan',
      'Surkhet',
    ],
    'Sudurpashchim': [
      'Achham',
      'Baitadi',
      'Bajhang',
      'Bajura',
      'Dadeldhura',
      'Darchula',
      'Doti',
      'Kailali',
      'Kanchanpur',
    ],
  };

  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedGender;
  late Country _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countries.firstWhere(
      (country) => country.code == 'NP',
      orElse: () => _countries.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
            ),

            // Top left sign in
            const Positioned(
              top: 175,
              left: 18,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Top right logo and tagline
            Positioned(
              top: 1,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // center children horizontally
                children: [
                  SizedBox(
                    height: 150, // logo height
                    child: Image.asset(
                      'assets/images/bnpllogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -60), // move text upwards
                    child: const Text(
                      'Live Your Dreams Now',
                      textAlign: TextAlign.center, // center text
                      style: TextStyle(
                        fontSize: 10,
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
                  height: 680,
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
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Welcome,',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF4C3EA6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/creditcard.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ],
                            ),
                            Transform.translate(
                              offset: const Offset(0, -10),
                              child: const Text(
                                'Hello there, sign in to continue.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF6F6F6F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),

                            Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFF7B6FF0),
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Personal Details',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: Color(0xFF4C3EA6),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Divider(
                                    color: Color(0xFF7B6FF0),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            const LabeledInput(label: 'First Name :'),
                            const SizedBox(height: 6),
                            const LabeledInput(label: 'Middle Name :'),
                            const SizedBox(height: 6),
                            const LabeledInput(label: 'Last Name :'),
                            const SizedBox(height: 6),

                            const Text(
                              'Gender :',
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GenderOption(
                                  label: 'Male',
                                  isSelected: _selectedGender == 'Male',
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = 'Male';
                                    });
                                  },
                                ),
                                GenderOption(
                                  label: 'Female',
                                  isSelected: _selectedGender == 'Female',
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = 'Female';
                                    });
                                  },
                                ),
                                GenderOption(
                                  label: 'Others',
                                  isSelected: _selectedGender == 'Others',
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = 'Others';
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            LabeledCountryDropdown(
                              label: 'Country :',
                              value: _selectedCountry,
                              items: _countries,
                              hintText: 'Select Country',
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedCountry = value;
                                  if (_selectedCountry.name != 'Nepal') {
                                    _selectedProvince = null;
                                    _selectedDistrict = null;
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 6),
                            if (_selectedCountry.name == 'Nepal')
                              LabeledDropdown(
                                label: 'Province :',
                                value: _selectedProvince,
                                items: _provinces,
                                hintText: 'Select Province',
                                onChanged: (value) {
                                  setState(() {
                                    _selectedProvince = value;
                                    _selectedDistrict = null;
                                  });
                                },
                              )
                            else
                              const LabeledInput(label: 'Address :'),
                            const SizedBox(height: 6),
                            if (_selectedCountry.name == 'Nepal')
                              LabeledDropdown(
                                label: 'District :',
                                value: _selectedDistrict,
                                items: _selectedProvince == null
                                    ? const []
                                    : _districtsByProvince[_selectedProvince] ??
                                          const [],
                                hintText: _selectedProvince == null
                                    ? 'Select Province First'
                                    : 'Select District',
                                onChanged: _selectedProvince == null
                                    ? null
                                    : (value) {
                                        setState(() {
                                          _selectedDistrict = value;
                                        });
                                      },
                              )
                            else
                              const SizedBox.shrink(),
                            const SizedBox(height: 6),
                            const LabeledInput(label: 'Email :'),

                            const SizedBox(height: 20),

                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 130,
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.password);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4E46D9),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom illustration
                      Positioned(
                        left: 8,
                        bottom: 10,
                        child: SizedBox(
                          width: 170,
                          height: 110,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                bottom: 0,
                                child: Image.asset(
                                  'assets/images/gigure.png',
                                  width: 160,
                                  height: 120,
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
      ),
    );
  }
}

class LabeledInput extends StatelessWidget {
  final String label;

  const LabeledInput({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const TextField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 12, height: 1.2),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            ),
          ),
        ),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
                color: Color(0xFF4C3EA6),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 28,
              height: 26,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF4E46D9)
                      : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3D6C63C8),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 16,
                        color: Color(0xFF4E46D9),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class LabeledDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final String hintText;
  final ValueChanged<String?>? onChanged;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              isDense: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF6F6F6F),
              ),
              hint: Text(
                hintText,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6F6F6F),
                  fontWeight: FontWeight.w400,
                ),
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4C3EA6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class LabeledCountryDropdown extends StatelessWidget {
  final String label;
  final Country value;
  final List<Country> items;
  final String hintText;
  final ValueChanged<Country?>? onChanged;

  const LabeledCountryDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            color: Color(0xFF4C3EA6),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3D6C63C8),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Country>(
              value: value,
              isExpanded: true,
              isDense: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF6F6F6F),
              ),
              hint: Text(
                hintText,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6F6F6F),
                  fontWeight: FontWeight.w400,
                ),
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<Country>(
                      value: item,
                      child: Row(
                        children: [
                          Text(
                            _flagEmoji(item.code),
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4C3EA6),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
