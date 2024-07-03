import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/settings_bloc.dart';
import 'package:weather_app/ui/widgets/primary_button.dart';
import 'package:weather_app/ui/widgets/primary_text_field.dart';
import 'package:weather_app/values.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const Text('Широта'),
              const SizedBox(height: kDefaultPadding / 2),
              PrimaryTextField(hint: 'Широта', controller: state is SettingsLoaded ? state.latController : null),
              const SizedBox(height: kDefaultPadding * 2),
              const Text('Долгота'),
              const SizedBox(height: kDefaultPadding / 2),
              PrimaryTextField(hint: 'Долгота', controller: state is SettingsLoaded ? state.lonController : null),
              const SizedBox(height: kDefaultPadding * 2),
              PrimaryButton(
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context).add(SettingsSaveData());
                },
              ),
            ],
          );
        },
      ),
    ));
  }
}
