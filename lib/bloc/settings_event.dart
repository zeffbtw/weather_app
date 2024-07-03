part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoadData extends SettingsEvent {}

class SettingsSaveData extends SettingsEvent {}
