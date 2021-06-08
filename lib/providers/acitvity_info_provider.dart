import 'package:hooks_riverpod/hooks_riverpod.dart';

/// when you are too lazy to use TextEdittingControllers 😅

final activityName = StateProvider<String>((_) => "");
final activityType = StateProvider<String>((_) => "");

final activityStartDate = StateProvider<DateTime>((_) => DateTime.now());
final activityEndDate =
    StateProvider<DateTime>((_) => DateTime.now().add(Duration(days: 1)));
