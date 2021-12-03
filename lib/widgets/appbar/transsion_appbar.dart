import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TransitionAppBar extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final double extent;

  TransitionAppBar({
    required this.avatar,
    required this.title,
    this.extent = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
          avatar: avatar, title: title, extent: extent > 200 ? extent : 200),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
      begin: EdgeInsets.only(
        bottom: 60,
        left: 0,
      ),
      end: EdgeInsets.only(left: 0.0, top: 70.0));
  final _avatarAlignTween =
      AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topCenter);

  final Widget avatar;
  final Widget title;
  final double extent;

  _TransitionAppBarDelegate(
      {required this.avatar, required this.title, this.extent = 250})
      : assert(avatar != null),
        assert(extent == null || extent >= 200),
        assert(title != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 34 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    print("Objechjkf === ${progress} ${shrinkOffset}");
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: shrinkOffset * 2,
          constraints: BoxConstraints(maxHeight: minExtent),
        ),
        Padding(
          padding: avatarMargin,
          child: Align(alignment: avatarAlign, child: avatar),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: title,
        ),
      ],
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => (maxExtent * 35) / 100;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }
}
