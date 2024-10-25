import 'dart:convert';
GenerateAppointmentSlotsModel generateAppointmentSlotsModelFromJson(String str) => GenerateAppointmentSlotsModel.fromJson(json.decode(str));
String generateAppointmentSlotsModelToJson(GenerateAppointmentSlotsModel data) => json.encode(data.toJson());
class GenerateAppointmentSlotsModel {
  GenerateAppointmentSlotsModel({
      num? appointmentTypeId, 
      num? isScheduleRequired, 
      List<String>? selectedDays, 
      String? startTime, 
      String? endTime, 
      num? fee, 
      num? interval, 
      GeneratedSlots? generatedSlots,}){
    _appointmentTypeId = appointmentTypeId;
    _isScheduleRequired = isScheduleRequired;
    _selectedDays = selectedDays;
    _startTime = startTime;
    _endTime = endTime;
    _fee = fee;
    _interval = interval;
    _generatedSlots = generatedSlots;
}

  GenerateAppointmentSlotsModel.fromJson(dynamic json) {
    _appointmentTypeId = json['appointment_type_id'];
    _isScheduleRequired = json['is_schedule_required'];
    _selectedDays = json['selected_days'] != null ? json['selected_days'].cast<String>() : [];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _fee = json['fee'];
    _interval = json['interval'];
    _generatedSlots = json['generated_slots'] != null ? GeneratedSlots.fromJson(json['generated_slots']) : null;
  }
  num? _appointmentTypeId;
  num? _isScheduleRequired;
  List<String>? _selectedDays;
  String? _startTime;
  String? _endTime;
  num? _fee;
  num? _interval;
  GeneratedSlots? _generatedSlots;
GenerateAppointmentSlotsModel copyWith({  num? appointmentTypeId,
  num? isScheduleRequired,
  List<String>? selectedDays,
  String? startTime,
  String? endTime,
  num? fee,
  num? interval,
  GeneratedSlots? generatedSlots,
}) => GenerateAppointmentSlotsModel(  appointmentTypeId: appointmentTypeId ?? _appointmentTypeId,
  isScheduleRequired: isScheduleRequired ?? _isScheduleRequired,
  selectedDays: selectedDays ?? _selectedDays,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  fee: fee ?? _fee,
  interval: interval ?? _interval,
  generatedSlots: generatedSlots ?? _generatedSlots,
);
  num? get appointmentTypeId => _appointmentTypeId;
  num? get isScheduleRequired => _isScheduleRequired;
  List<String>? get selectedDays => _selectedDays;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  num? get fee => _fee;
  num? get interval => _interval;
  GeneratedSlots? get generatedSlots => _generatedSlots;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment_type_id'] = _appointmentTypeId;
    map['is_schedule_required'] = _isScheduleRequired;
    map['selected_days'] = _selectedDays;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['fee'] = _fee;
    map['interval'] = _interval;
    if (_generatedSlots != null) {
      map['generated_slots'] = _generatedSlots?.toJson();
    }
    return map;
  }

}

GeneratedSlots generatedSlotsFromJson(String str) => GeneratedSlots.fromJson(json.decode(str));
String generatedSlotsToJson(GeneratedSlots data) => json.encode(data.toJson());
class GeneratedSlots {
  GeneratedSlots({
      List<Sunday>? sunday, 
      List<Monday>? monday,}){
    _sunday = sunday;
    _monday = monday;
}

  GeneratedSlots.fromJson(dynamic json) {
    if (json['sunday'] != null) {
      _sunday = [];
      json['sunday'].forEach((v) {
        _sunday?.add(Sunday.fromJson(v));
      });
    }
    if (json['monday'] != null) {
      _monday = [];
      json['monday'].forEach((v) {
        _monday?.add(Monday.fromJson(v));
      });
    }
  }
  List<Sunday>? _sunday;
  List<Monday>? _monday;
GeneratedSlots copyWith({  List<Sunday>? sunday,
  List<Monday>? monday,
}) => GeneratedSlots(  sunday: sunday ?? _sunday,
  monday: monday ?? _monday,
);
  List<Sunday>? get sunday => _sunday;
  List<Monday>? get monday => _monday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sunday != null) {
      map['sunday'] = _sunday?.map((v) => v.toJson()).toList();
    }
    if (_monday != null) {
      map['monday'] = _monday?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Monday mondayFromJson(String str) => Monday.fromJson(json.decode(str));
String mondayToJson(Monday data) => json.encode(data.toJson());
class Monday {
  Monday({
      String? startTime, 
      String? endTime, 
      bool? isActive,}){
    _startTime = startTime;
    _endTime = endTime;
    _isActive = isActive;
}

  Monday.fromJson(dynamic json) {
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _isActive = json['is_active'];
  }
  String? _startTime;
  String? _endTime;
  bool? _isActive;
Monday copyWith({  String? startTime,
  String? endTime,
  bool? isActive,
}) => Monday(  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  isActive: isActive ?? _isActive,
);
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['is_active'] = _isActive;
    return map;
  }

}

Sunday sundayFromJson(String str) => Sunday.fromJson(json.decode(str));
String sundayToJson(Sunday data) => json.encode(data.toJson());
class Sunday {
  Sunday({
      String? startTime, 
      String? endTime, 
      bool? isActive,}){
    _startTime = startTime;
    _endTime = endTime;
    _isActive = isActive;
}

  Sunday.fromJson(dynamic json) {
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _isActive = json['is_active'];
  }
  String? _startTime;
  String? _endTime;
  bool? _isActive;
Sunday copyWith({  String? startTime,
  String? endTime,
  bool? isActive,
}) => Sunday(  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  isActive: isActive ?? _isActive,
);
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['is_active'] = _isActive;
    return map;
  }

}