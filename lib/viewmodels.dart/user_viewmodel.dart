import 'package:flutter/material.dart';
import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/models/user.dart';
import 'package:mat_lgs/repository/user_repository.dart';
import 'package:mat_lgs/services/auth_base_service.dart';

enum ViewState { idle, busy }

class UserViewModel with ChangeNotifier implements AuthBaseService {
  UserViewModel() {
    currentUser();
  }
  ViewState _state = ViewState.idle;
  final UserRepository _userRepository = locator<UserRepository>();
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
      print("UserViewmodel currentUser HATA !${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool> isSignOut() async {
    try {
      state = ViewState.busy;
      return _userRepository.isSignOut();
    } catch (e) {
      print("UserViewmodel isSignOut HATA !${e.toString()}");
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
      print("UserViewmodel signInEmailPassword HATA !${e.toString()}");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }
}
