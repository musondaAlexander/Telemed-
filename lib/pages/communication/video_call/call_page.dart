// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../utils.dart';
import 'constants.dart';
// import utils.dart';

class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.AppIDVideoCall /*input your AppID*/,
        appSign: Utils.AppSignVideoCall /*input your AppSign*/,
        userID: localUserID,
        userName: "user_$localUserID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            if (PrebuiltCallMiniOverlayPageState.idle !=
                ZegoUIKitPrebuiltCallMiniOverlayMachine().state()) {
              /// now is minimizing state, not need to navigate
              ZegoUIKitPrebuiltCallMiniOverlayMachine();
            } else {
              Navigator.of(context).pop();
            }
          }

          /// support minimizing
          ..topMenuBarConfig.isVisible = true
          ..topMenuBarConfig.buttons = [
            ZegoMenuBarButtonName.minimizingButton,
            ZegoMenuBarButtonName.showMemberListButton,
          ],
      ),
    );
  }
}
