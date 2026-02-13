import 'package:dio/dio.dart';
import 'database_service.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final DatabaseService _dbService = DatabaseService();

  // Signup - Save user locally
  Future<Map<String, dynamic>> signup({
    required String fullName,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      print('🔐 Starting signup for: $phoneNumber');

      // Check if user already exists locally
      final userExists = await _dbService.userExists(phoneNumber);
      if (userExists) {
        print('❌ User already exists locally');
        return {
          'success': false,
          'message': 'User with this phone number already exists',
        };
      }

      // Save to local database
      try {
        print('💾 Saving to local database...');
        await _dbService.insertUser(
          fullName: fullName,
          phoneNumber: phoneNumber,
          password: password,
        );
        print('✅ User saved successfully');

        return {
          'success': true,
          'message': 'Signup successful',
          'data': {'full_name': fullName, 'phone_number': phoneNumber},
        };
      } catch (dbError) {
        print('❌ Local save failed: $dbError');
        return {'success': false, 'message': 'Failed to save signup: $dbError'};
      }
    } catch (e) {
      print('❌ Signup error: $e');
      return {'success': false, 'message': 'Error: $e'};
    }
  }

  // Login - Validate against local database + DummyJSON API
  Future<Map<String, dynamic>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      print('🔓 Attempting login for: $phoneNumber');

      // Debug: print all users in database
      await _dbService.printAllUsers();

      // Check local database first
      final user = await _dbService.getUserByPhone(phoneNumber);
      if (user == null) {
        print('❌ Login failed: User not found in database');
        return {
          'success': false,
          'message': 'User not found. Please sign up first.',
        };
      }

      print('✅ User found: ${user['full_name']}');

      // Verify password locally
      if (user['password'] != password) {
        print('❌ Login failed: Invalid password');
        return {'success': false, 'message': 'Invalid password'};
      }

      print('✅ Password verified');

      // Try to verify with DummyJSON API (optional)
      try {
        print('📤 Verifying with DummyJSON API...');
        final response = await _dio.post(
          '/auth/login',
          data: {
            'username': phoneNumber,
            'password': password,
            'expiresInMins': 30,
          },
          options: Options(contentType: 'application/json'),
        );

        if (response.statusCode == 200) {
          print('✅ API verification successful');
          return {
            'success': true,
            'message': 'Login successful',
            'data': {
              'id': user['id'],
              'full_name': user['full_name'],
              'phone_number': user['phone_number'],
              'access_token': response.data['accessToken'],
              'token_type': 'bearer',
            },
          };
        }
      } catch (e) {
        // API verification failed, but local verification passed
        print('⚠️ API verification failed, using local auth only');
        return {
          'success': true,
          'message': 'Login successful (offline mode)',
          'data': {
            'id': user['id'],
            'full_name': user['full_name'],
            'phone_number': user['phone_number'],
            'access_token': 'offline_token',
            'token_type': 'bearer',
          },
        };
      }

      print('✅ Login successful');
      return {
        'success': true,
        'message': 'Login successful',
        'data': {
          'id': user['id'],
          'full_name': user['full_name'],
          'phone_number': user['phone_number'],
        },
      };
    } catch (e) {
      print('❌ Login error: $e');
      return {'success': false, 'message': 'Login error: $e'};
    }
  }

  // Logout
  Future<void> logout() async {
    print('🚪 Logging out...');
    // Clear any stored tokens or session data here
  }
}
