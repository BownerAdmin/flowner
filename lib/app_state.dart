import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _checkListState =
          prefs.getStringList('ff_checkListState') ?? _checkListState;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentUser')) {
        try {
          final serializedData = prefs.getString('ff_currentUser') ?? '{}';
          _currentUser =
              CurrentUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isFirstTime = prefs.getBool('ff_isFirstTime') ?? _isFirstTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  OccupancyStruct _selectedOccupancy = OccupancyStruct();
  OccupancyStruct get selectedOccupancy => _selectedOccupancy;
  set selectedOccupancy(OccupancyStruct _value) {
    _selectedOccupancy = _value;
  }

  void updateSelectedOccupancyStruct(Function(OccupancyStruct) updateFn) {
    updateFn(_selectedOccupancy);
  }

  List<String> _checkListState = [];
  List<String> get checkListState => _checkListState;
  set checkListState(List<String> _value) {
    _checkListState = _value;
    prefs.setStringList('ff_checkListState', _value);
  }

  void addToCheckListState(String _value) {
    _checkListState.add(_value);
    prefs.setStringList('ff_checkListState', _checkListState);
  }

  void removeFromCheckListState(String _value) {
    _checkListState.remove(_value);
    prefs.setStringList('ff_checkListState', _checkListState);
  }

  void removeAtIndexFromCheckListState(int _index) {
    _checkListState.removeAt(_index);
    prefs.setStringList('ff_checkListState', _checkListState);
  }

  void updateCheckListStateAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _checkListState[_index] = updateFn(_checkListState[_index]);
    prefs.setStringList('ff_checkListState', _checkListState);
  }

  void insertAtIndexInCheckListState(int _index, String _value) {
    _checkListState.insert(_index, _value);
    prefs.setStringList('ff_checkListState', _checkListState);
  }

  CurrentUserStruct _currentUser = CurrentUserStruct();
  CurrentUserStruct get currentUser => _currentUser;
  set currentUser(CurrentUserStruct _value) {
    _currentUser = _value;
    prefs.setString('ff_currentUser', _value.serialize());
  }

  void updateCurrentUserStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(_currentUser);
    prefs.setString('ff_currentUser', _currentUser.serialize());
  }

  bool _isFirstTime = true;
  bool get isFirstTime => _isFirstTime;
  set isFirstTime(bool _value) {
    _isFirstTime = _value;
    prefs.setBool('ff_isFirstTime', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
