// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/cupertino.dart';
import 'package:relation/relation.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

/// Refresh indicator widget based on [StreamedState].
class StreamedSwipeRefresh extends SwipeRefresh {
  StreamedSwipeRefresh(
    SwipeRefreshStyle style, {
    @required List<Widget> children,
    @required StreamedState<SwipeRefreshState> stateStream,
    @required VoidCallback onRefresh,
    Key key,
    Color indicatorColor,
    Color backgroundColor,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
    RefreshControlIndicatorBuilder indicatorBuilder,
  }) : super(style,
            key: key,
            children: children,
            onRefresh: onRefresh,
            stateStream: stateStream.stream,
            initState: stateStream.value,
            indicatorColor: indicatorColor,
            backgroundColor: backgroundColor,
            refreshTriggerPullDistance: refreshTriggerPullDistance,
            refreshIndicatorExtent: refreshIndicatorExtent,
            indicatorBuilder: indicatorBuilder);

  StreamedSwipeRefresh.adaptive({
    @required List<Widget> children,
    @required StreamedState<SwipeRefreshState> stateStream,
    @required VoidCallback onRefresh,
    Key key,
    Color indicatorColor,
    Color backgroundColor,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
    RefreshControlIndicatorBuilder indicatorBuilder,
  }) : super.adaptive(
          key: key,
          children: children,
          onRefresh: onRefresh,
          stateStream: stateStream.stream,
          initState: stateStream.value,
          indicatorColor: indicatorColor,
          backgroundColor: backgroundColor,
          refreshTriggerPullDistance: refreshTriggerPullDistance,
          refreshIndicatorExtent: refreshIndicatorExtent,
          indicatorBuilder: indicatorBuilder,
        );

  StreamedSwipeRefresh.material({
    @required List<Widget> children,
    @required StreamedState<SwipeRefreshState> stateStream,
    @required VoidCallback onRefresh,
    Key key,
    Color indicatorColor,
    Color backgroundColor,
  }) : super.material(
            key: key,
            children: children,
            onRefresh: onRefresh,
            stateStream: stateStream.stream,
            initState: stateStream.value,
            indicatorColor: indicatorColor,
            backgroundColor: backgroundColor);

  StreamedSwipeRefresh.cupertino({
    @required List<Widget> children,
    @required StreamedState<SwipeRefreshState> stateStream,
    @required VoidCallback onRefresh,
    Key key,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
    RefreshControlIndicatorBuilder indicatorBuilder,
  }) : super.cupertino(
          key: key,
          children: children,
          onRefresh: onRefresh,
          stateStream: stateStream.stream,
          initState: stateStream.value,
          refreshTriggerPullDistance: refreshTriggerPullDistance,
          refreshIndicatorExtent: refreshIndicatorExtent,
          indicatorBuilder: indicatorBuilder,
        );
}
