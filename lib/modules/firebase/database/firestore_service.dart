import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService {
  Future<void> setDocument(String collection, String documentId, Map<String, dynamic> data);
  Future<void> updateDocument(String collection, String documentId, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String documentId);
  Future<DocumentSnapshot> getDocument(String collection, String documentId);
  Future<QuerySnapshot> getCollection(String collection);
  Stream<DocumentSnapshot> watchDocument(String collection, String documentId);
  Stream<QuerySnapshot> watchCollection(String collection);
  Future<QuerySnapshot> query(String collection, List<QueryFilter> filters);
}

class QueryFilter {
  final String field;
  final dynamic value;
  final String operator;

  QueryFilter(this.field, this.operator, this.value);
}

class FirebaseFirestoreService implements FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> setDocument(String collection, String documentId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(documentId).set(data);
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Future<void> updateDocument(String collection, String documentId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Future<void> deleteDocument(String collection, String documentId) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Future<DocumentSnapshot> getDocument(String collection, String documentId) async {
    try {
      return await _firestore.collection(collection).doc(documentId).get();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Future<QuerySnapshot> getCollection(String collection) async {
    try {
      return await _firestore.collection(collection).get();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Stream<DocumentSnapshot> watchDocument(String collection, String documentId) {
    try {
      return _firestore.collection(collection).doc(documentId).snapshots();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Stream<QuerySnapshot> watchCollection(String collection) {
    try {
      return _firestore.collection(collection).snapshots();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  @override
  Future<QuerySnapshot> query(String collection, List<QueryFilter> filters) async {
    try {
      Query query = _firestore.collection(collection);
      
      for (var filter in filters) {
        query = query.where(filter.field, isEqualTo: filter.value);
      }
      
      return await query.get();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  // Batch operations
  Future<void> batchWrite(List<BatchOperation> operations) async {
    try {
      final batch = _firestore.batch();
      
      for (var operation in operations) {
        final docRef = _firestore.collection(operation.collection).doc(operation.documentId);
        
        switch (operation.type) {
          case BatchOperationType.set:
            batch.set(docRef, operation.data!);
            break;
          case BatchOperationType.update:
            batch.update(docRef, operation.data!);
            break;
          case BatchOperationType.delete:
            batch.delete(docRef);
            break;
        }
      }
      
      await batch.commit();
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  // Transaction operations
  Future<T> runTransaction<T>(Future<T> Function(Transaction) operation) async {
    try {
      return await _firestore.runTransaction(operation);
    } catch (e) {
      throw _handleFirestoreError(e);
    }
  }

  Exception _handleFirestoreError(dynamic e) {
    if (e is FirebaseException) {
      return Exception('Firestore error: ${e.message}');
    }
    return Exception('An unexpected Firestore error occurred: $e');
  }
}

enum BatchOperationType { set, update, delete }

class BatchOperation {
  final String collection;
  final String documentId;
  final Map<String, dynamic>? data;
  final BatchOperationType type;

  BatchOperation({
    required this.collection,
    required this.documentId,
    this.data,
    required this.type,
  });
}
