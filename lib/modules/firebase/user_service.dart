import 'package:firebase_auth/firebase_auth.dart';
import 'auth/auth_service.dart';
import 'models/user_model.dart';
import 'firebase_service_locator.dart';

class UserService {
  final _serviceLocator = FirebaseServiceLocator();
  static const String _usersCollection = 'users';
  static const String _userDataPath = 'userData';

  // Authentication methods
  Future<UserModel> signUpWithEmail(String email, String password) async {
    final authResult = await _serviceLocator.auth.createUserWithEmailAndPassword(
      email,
      password,
    );

    final user = UserModel(
      id: authResult.user!.uid,
      email: email,
    );

    // Store user data in both Firestore and Realtime Database
    await _serviceLocator.firestore
        .setDocument(_usersCollection, user.id, user.toJson());
    
    await _serviceLocator.realtimeDb
        .set('$_userDataPath/${user.id}', user.toJson());

    return user;
  }

  Future<UserModel> signInWithEmail(String email, String password) async {
    final authResult = await _serviceLocator.auth.signInWithEmailAndPassword(
      email,
      password,
    );
    
    return await getUserData(authResult.user!.uid);
  }

  Future<void> signInWithPhone(String phoneNumber) async {
    await _serviceLocator.auth.verifyPhoneNumber(phoneNumber);
  }

  Future<void> verifyOTP(String smsCode) async {
    if (_serviceLocator.auth is FirebaseAuthService) {
      await (_serviceLocator.auth as FirebaseAuthService).signInWithOTP(smsCode);
    }
  }

  Future<void> signOut() async {
    await _serviceLocator.auth.signOut();
  }

  // User data methods
  Future<UserModel> getUserData(String userId) async {
    // Try to get from Firestore first
    final firestoreDoc = await _serviceLocator.firestore
        .getDocument(_usersCollection, userId);

    if (firestoreDoc.exists) {
      return UserModel.fromJson(firestoreDoc.data() as Map<String, dynamic>);
    }

    // Fallback to Realtime Database
    final realtimeData = await _serviceLocator.realtimeDb
        .get('$_userDataPath/$userId');

    if (realtimeData.exists) {
      return UserModel.fromJson(
          realtimeData.value as Map<String, dynamic>);
    }

    throw Exception('User data not found');
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    // Update both databases
    await Future.wait([
      _serviceLocator.firestore
          .updateDocument(_usersCollection, userId, data),
      _serviceLocator.realtimeDb
          .update('$_userDataPath/$userId', data),
    ]);
  }

  // Real-time user data updates
  Stream<UserModel> watchUserData(String userId) {
    // You can choose either Firestore or Realtime Database for real-time updates
    // Here we're using Firestore
    return _serviceLocator.firestore
        .watchDocument(_usersCollection, userId)
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>));
  }

  // Auth state changes
  Stream<User?> get authStateChanges => _serviceLocator.auth.authStateChanges;
}
