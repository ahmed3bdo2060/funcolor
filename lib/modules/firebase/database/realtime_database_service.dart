import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class RealtimeDatabaseService {
  Future<void> set(String path, dynamic data);
  Future<void> update(String path, Map<String, dynamic> data);
  Future<void> push(String path, dynamic data);
  Future<void> remove(String path);
  Stream<DatabaseEvent> watch(String path);
  Future<DataSnapshot> get(String path);
}

class FirebaseRealtimeDatabaseService implements RealtimeDatabaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  @override
  Future<void> set(String path, dynamic data) async {
    try {
      await _database.ref(path).set(data);
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  @override
  Future<void> update(String path, Map<String, dynamic> data) async {
    try {
      await _database.ref(path).update(data);
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  @override
  Future<void> push(String path, dynamic data) async {
    try {
      await _database.ref(path).push().set(data);
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  @override
  Future<void> remove(String path) async {
    try {
      await _database.ref(path).remove();
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  @override
  Stream<DatabaseEvent> watch(String path) {
    try {
      return _database.ref(path).onValue;
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  @override
  Future<DataSnapshot> get(String path) async {
    try {
      return await _database.ref(path).get();
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  // Helper method to handle database transaction
  Future<void> runTransaction(String path, Function(dynamic) update) async {
    try {
      await _database.ref(path).runTransaction((Object? data) {
        return Transaction.success(update(data));
      });
    } catch (e) {
      throw _handleDatabaseError(e);
    }
  }

  Exception _handleDatabaseError(dynamic e) {
    if (e is FirebaseException) {
      return Exception('Database error: ${e.message}');
    }
    return Exception('An unexpected database error occurred: $e');
  }
}
