part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial();
  @override
  List<Object> get props => [];
}

final class SettingsLoaded extends SettingsState {
  final TextEditingController latController;
  final TextEditingController lonController;
  const SettingsLoaded({required this.latController, required this.lonController});
  @override
  List<Object> get props => [latController, lonController];
}

final class SettingsSaved extends SettingsState {
  const SettingsSaved();
  @override
  List<Object> get props => [];
}
