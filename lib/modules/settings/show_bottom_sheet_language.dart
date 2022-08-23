import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ShowlanguageBottomSheet extends StatefulWidget {
  @override
  State<ShowlanguageBottomSheet> createState() =>
      _ShowlanguageBottomSheetState();
}

class _ShowlanguageBottomSheetState extends State<ShowlanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProviderApp>(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
                pro.changeLanguage('en');
              },
              child: showLanguageSelected(
                  'English', pro.AppLanguage == 'en' ? true : false)),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                pro.changeLanguage('ar');
              },
              child: showLanguageSelected(
                  'العربية', pro.AppLanguage == 'ar' ? true : false)),
        ],
      ),
    );
  }

  Widget showLanguageSelected(String text, bool selected) {
    if (selected) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Icon(
            Icons.check,
          )
        ],
      );
    }
  }
}
