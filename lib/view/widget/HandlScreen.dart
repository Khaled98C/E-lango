import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:project/Static/StaticInternet/Statusrequest.dart';

class HandilingdataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Future<void> Function()? onRefresh;
  final Widget widget;
  const HandilingdataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            child: Center(
            child: Lottie.asset("lot/loading.json"),
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? Stack(
                children: [
                  LiquidPullToRefresh(
                    onRefresh: onRefresh!,
                    height: 150,
                    animSpeedFactor: 2,
                    backgroundColor: Colors.deepPurple,
                    color: Color(0xffc385c7),
                    borderWidth: 2,
                    showChildOpacityTransition: false,
                    springAnimationDurationInMilliseconds: 1500,
                    child: widget,
                  ),
                  Center(child: Lottie.asset("lot/offline.json"))
                ],
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset("lot/Error.json"),
                  )
                : statusRequest == StatusRequest.Nodata
                    ? Center(child: Lottie.asset("lot/nodata.json"))
                    : widget;
  }
}
