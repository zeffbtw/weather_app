import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsRepository settingsRepository = SettingsRepository();
  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();

  SettingsBloc() : super(const SettingsInitial()) {
    on<SettingsLoadData>((event, emit) async {
      latController.text = (await settingsRepository.getSavedLatitude()).toString();
      lonController.text = (await settingsRepository.getSavedLongitude()).toString();
      emit(SettingsLoaded(latController: latController, lonController: lonController));
    });
    on<SettingsSaveData>((event, emit) {
      settingsRepository.saveLatitude(double.parse(latController.text));
      settingsRepository.saveLongitude(double.parse(lonController.text));
      emit(const SettingsSaved());
      emit(SettingsLoaded(latController: latController, lonController: lonController));
    });
  }
}
