import 'package:onebnpl/models/user_profile.dart';

class UserProfileRepository {
  static Future<UserProfile> fetchProfile() async {
    return const UserProfile(fullName: 'Thomas Bhattarai');
  }
}
