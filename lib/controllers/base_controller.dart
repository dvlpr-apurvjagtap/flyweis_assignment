import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  bool _isDisposed = false;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isDisposed => _isDisposed;

  void setLoading(bool loading) {
    if (!_isDisposed) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  void setError(String? error) {
    if (!_isDisposed) {
      _errorMessage = error;
      notifyListeners();
    }
  }

  void clearError() {
    if (!_isDisposed) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  void setSuccess() {
    if (!_isDisposed) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<T> handleAsyncOperation<T>(Future<T> Function() operation) async {
    try {
      setLoading(true);
      clearError();
      final result = await operation();
      setSuccess();
      return result;
    } catch (e) {
      setError(e.toString());
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
