import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/settings/show_bottom_sheet_language.dart';
import 'package:to_do/modules/settings/show_bottom_sheet_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('${AppLocalizations.of(context)!.language}',
              style: Theme.of(context).textTheme.subtitle1),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetLanguage();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    provider.AppLanguage == 'en' ? 'English' : 'العربية',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${AppLocalizations.of(context)!.theme}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetTheme();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    provider.themeMode == ThemeMode.light
                        ? '${AppLocalizations.of(context)!.light}'
                        : '${AppLocalizations.of(context)!.dark}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void ShowBottomSheetLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowlanguageBottomSheet();
        });
  }

  void ShowBottomSheetTheme() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowThemeBottomSheet();
        });
  }
}
