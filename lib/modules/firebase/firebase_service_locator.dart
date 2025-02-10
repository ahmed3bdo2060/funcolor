import 'auth/auth_service.dart';
import 'database/firestore_service.dart';
import 'database/realtime_database_service.dart';

class FirebaseServiceLocator {
  static final FirebaseServiceLocator _instance = FirebaseServiceLocator._internal();
  
  factory FirebaseServiceLocator() {
    return _instance;
  }

  FirebaseServiceLocator._internal();

  // Lazy initialization of services
  late final AuthService _authService = FirebaseAuthService();
  late final FirestoreService _firestoreService = FirebaseFirestoreService();
  late final RealtimeDatabaseService _realtimeDbService = FirebaseRealtimeDatabaseService();

  // Getters for services
  AuthService get auth => _authService;
  FirestoreService get firestore => _firestoreService;
  RealtimeDatabaseService get realtimeDb => _realtimeDbService;
}
