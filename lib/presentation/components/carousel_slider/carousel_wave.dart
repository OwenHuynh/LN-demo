import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_indicators.dart';
import 'package:lnsp/presentation/components/carousel_slider/carousel_transforms.dart';
import 'package:lnsp/utils/screen_util.dart';

const _kCarouselMaxValue = 200000000000;
const _kCarouselMiddleValue = 100000;

typedef CarouselSlideWaveBuilder = Widget Function(int index);

class CarouselSliderWave extends StatefulWidget {
  CarouselSliderWave({
    Key? key,
    required List<Widget> this.children,
    required this.maxHeight,
    this.slideTransform = const DefaultSlideTransform(),
    this.slideIndicator,
    this.viewportFraction = 1,
    this.enableAutoSlider = false,
    this.autoSliderDelay = const Duration(seconds: 5),
    this.autoSliderTransitionTime = const Duration(seconds: 2),
    this.autoSliderTransitionCurve = Curves.easeOutQuad,
    this.keepPage = true,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.horizontal,
    this.unlimitedMode = false,
    this.initialPage = 0,
    this.sizeBoxImage = 0,
    this.onSlideChanged,
    this.onSlideStart,
    this.onSlideEnd,
    this.controller,
    this.bottomWidget,
    this.addWidgetInStack,
    this.clipBehavior = Clip.hardEdge,
  })  : slideBuilder = null,
        itemCount = children.length,
        super(key: key);

  CarouselSliderWave.builder({
    Key? key,
    required this.slideBuilder,
    required this.maxHeight,
    this.slideTransform = const DefaultSlideTransform(),
    this.slideIndicator,
    required this.itemCount,
    this.viewportFraction = 1,
    this.enableAutoSlider = false,
    this.autoSliderDelay = const Duration(seconds: 5),
    this.autoSliderTransitionTime = const Duration(seconds: 2),
    this.autoSliderTransitionCurve = Curves.easeOutQuad,
    this.keepPage = true,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.horizontal,
    this.unlimitedMode = false,
    this.initialPage = 0,
    this.onSlideChanged,
    this.onSlideStart,
    this.onSlideEnd,
    this.controller,
    this.sizeBoxImage,
    this.clipBehavior = Clip.hardEdge,
    this.bottomWidget,
    this.addWidgetInStack,
  })  : children = null,
        super(key: key);

  final CarouselSlideWaveBuilder? slideBuilder;
  final List<Widget>? children;
  final int itemCount;
  final SlideTransform slideTransform;
  final SlideIndicator? slideIndicator;
  final double viewportFraction;
  final bool enableAutoSlider;

  /// Waiting time before starting the auto slider
  final Duration autoSliderDelay;

  final Duration autoSliderTransitionTime;
  final Curve autoSliderTransitionCurve;
  final bool unlimitedMode;
  final bool keepPage;
  final ScrollPhysics scrollPhysics;
  final Axis scrollDirection;
  final int initialPage;
  final ValueChanged<int>? onSlideChanged;
  final VoidCallback? onSlideStart;
  final VoidCallback? onSlideEnd;
  final double? sizeBoxImage;
  final Widget? bottomWidget;
  final Widget? addWidgetInStack;
  final double maxHeight;
  final Clip clipBehavior;
  final CarouselSliderController? controller;

  @override
  State<StatefulWidget> createState() => _CarouselSliderWaveState();
}

class CarouselSliderController {
  _CarouselSliderWaveState? _state;

  void nextPage([Duration? transitionDuration]) {
    if (_state != null && _state!.mounted) {
      _state!._nextPage(transitionDuration);
    }
  }

  void previousPage([Duration? transitionDuration]) {
    if (_state != null && _state!.mounted) {
      _state!._previousPage(transitionDuration);
    }
  }

  void setAutoSliderEnabled(bool isEnabled) {
    if (_state != null && _state!.mounted) {
      _state!._setAutoSliderEnabled(isEnabled);
    }
  }

  void jumToPage(int page) {
    _state!._jumToPage(page);
  }

  void dispose() {
    if (_state != null && _state!.mounted) {
      _state!.dispose();
    }
  }
}

class _CarouselSliderWaveState extends State<CarouselSliderWave> {
  PageController? _pageController;
  Timer? _timer;
  int? _currentPage;
  double _pageDelta = 0;
  late bool _isPlaying;

  @override
  Widget build(BuildContext context) {
    final itemSize = widget.bottomWidget != null
        ? (ScreenUtil.deviceWidth / widget.itemCount)
        : 0.0;

    return Stack(
      children: <Widget>[
        if (widget.itemCount > 0)

          /// Notification Listener added in order to capture Slide Start
          /// and Slide End events
          Padding(
            padding: EdgeInsets.only(bottom: widget.sizeBoxImage ?? itemSize),
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  widget.onSlideStart?.call();
                } else if (notification is ScrollEndNotification) {
                  widget.onSlideEnd?.call();
                }
                return true;
              },
              child: PageView.builder(
                onPageChanged: (val) {
                  widget.onSlideChanged?.call(val);
                },
                clipBehavior: widget.clipBehavior,
                scrollBehavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                  overscroll: false,
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  },
                ),
                itemCount: widget.unlimitedMode
                    ? _kCarouselMaxValue
                    : widget.itemCount,
                controller: _pageController,
                scrollDirection: widget.scrollDirection,
                physics: widget.scrollPhysics,
                itemBuilder: (context, index) {
                  final slideIndex = index % widget.itemCount;
                  final Widget slide = widget.children == null
                      ? widget.slideBuilder!(slideIndex)
                      : widget.children![slideIndex];
                  return widget.slideTransform.transform(context, slide, index,
                      _currentPage, _pageDelta, widget.itemCount);
                },
              ),
            ),
          ),
        if (widget.addWidgetInStack != null) widget.addWidgetInStack!,
        if (widget.slideIndicator != null && widget.itemCount > 0)
          Padding(
            padding: EdgeInsets.only(bottom: widget.sizeBoxImage ?? itemSize),
            child: widget.slideIndicator!.build(
                _currentPage! % widget.itemCount, _pageDelta, widget.itemCount),
          ),
        if (widget.bottomWidget != null)
          Positioned.fill(
            top: widget.maxHeight - itemSize,
            child: Align(
                alignment: Alignment.bottomCenter, child: widget.bottomWidget),
          ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant CarouselSliderWave oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enableAutoSlider != widget.enableAutoSlider) {
      _setAutoSliderEnabled(widget.enableAutoSlider);
    }
    if (oldWidget.itemCount != widget.itemCount) {
      _initPageController();
    }
    _initCarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController?.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.enableAutoSlider;
    _currentPage = widget.initialPage;
    _initCarouselSliderController();
    _initPageController();
    _setAutoSliderEnabled(_isPlaying);
  }

  void _initCarouselSliderController() {
    if (widget.controller != null) {
      widget.controller!._state = this;
    }
  }

  void _initPageController() {
    _pageController?.dispose();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      keepPage: widget.keepPage,
      initialPage: widget.unlimitedMode
          ? _kCarouselMiddleValue * widget.itemCount + _currentPage!
          : _currentPage!,
    );
    _pageController!.addListener(() {
      setState(() {
        _currentPage = _pageController!.page!.floor();
        _pageDelta = _pageController!.page! - _pageController!.page!.floor();
      });
    });
  }

  void _nextPage(Duration? transitionDuration) {
    _pageController!.nextPage(
      duration: transitionDuration ?? widget.autoSliderTransitionTime,
      curve: widget.autoSliderTransitionCurve,
    );
  }

  void _jumToPage(int page) {
    _pageController!.jumpToPage(page);
  }

  void _previousPage(Duration? transitionDuration) {
    _pageController!.previousPage(
      duration: transitionDuration ?? widget.autoSliderTransitionTime,
      curve: widget.autoSliderTransitionCurve,
    );
  }

  void _setAutoSliderEnabled(bool isEnabled) {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (isEnabled) {
      _timer = Timer.periodic(widget.autoSliderDelay, (timer) {
        _pageController!.nextPage(
          duration: widget.autoSliderTransitionTime,
          curve: widget.autoSliderTransitionCurve,
        );
      });
    }
  }
}
