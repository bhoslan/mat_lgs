import 'package:flutter/material.dart';
import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/models/user.dart';
import 'package:mat_lgs/repository/user_repository.dart';
import 'package:mat_lgs/services/auth_base_service.dart';

enum ViewState { idle, busy }

class UserViewModel extends ChangeNotifier implements AuthBaseService {
  UserViewModel() {
    currentUser();
  }
  final UserRepository _userRepository = locator<UserRepository>();
  ViewState _state = ViewState.idle;
  MyUser? _myUser;
  MyUser? get myUser => _myUser;

  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<MyUser?> currentUser() async {
    try {
      state = ViewState.busy;
      _myUser = await _userRepository.currentUser();
      return _myUser;
    } catch (e) {
      debugPrint("UserViewmodel currentUser HATA !${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool> isSignOut() async {
    try {
      state = ViewState.busy;
      bool result = await _userRepository.isSignOut();
      _myUser = null;
      return result;
    } catch (e) {
      debugPrint("UserViewmodel isSignOut HATA !${e.toString()}");
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<MyUser?> signInEmailPassword(String email, String password) async {
    try {
      state = ViewState.busy;
      _myUser = await _userRepository.signInEmailPassword(email, password);
      return _myUser;
    } catch (e) {
      debugPrint("UserViewmodel signInEmailPassword HATA !${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      state = ViewState.busy;
      _userRepository.signOut();
    } catch (e) {
      debugPrint("UserViewmodel signOut HATA !${e.toString()}");
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future register(String email, String password ) async {
    try {
      state = ViewState.busy;
      _userRepository.register(email, password );
    } catch (e) {
      debugPrint("UserViewmodel register HATA !${e.toString()}");
    } finally {
      state = ViewState.idle;
    }
  }
}
