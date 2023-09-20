part of '../flutter_jellysidemenu.dart';

class JellySideMenu extends StatefulWidget {

  final JellySideMenuSvgSpringSystemController controller;
  final double width;
  final double height;
  final Widget child;

  const JellySideMenu({super.key, required this.width, required this.height, required this.child, required this.controller});

  @override
  _JellySideMenuState createState() => _JellySideMenuState();
}

class _JellySideMenuState extends State<JellySideMenu> with TickerProviderStateMixin {

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(-0.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.ease,
  ));


  bool isOpened = false;
  bool isDock = false;
  double offsetDragX = 0;
  double offsetDragY = 0;

  @override
  void initState() {
    super.initState();
    offsetDragY = widget.height / 2;
  }

  void onJellyUndocked() {
    // Handle undocking logic
  }

  void onJellyNotUndocked() {
    // Handle not undocked logic
  }


  void onDragSideMenuSvg(double x, double y) {
    setState(() {
      if (isOpened) {
        isOpened = false;
        _animationController.animateTo(0.0);
      }
    });
    widget.controller.setOffsetDrag(true, x, y);
    // this.refs.sideMenuSvgWrapper ? this.refs.sideMenuSvgWrapper.onJellyNotUndocked() : {};
    // this.refs.sideMenuSvg ? this.refs.sideMenuSvg.setOffsetDrag(x, y, false) : {};
  }



  void onDropSideMenuSvg(bool isOpen) {
    if (isOpen) {
      setState(() {
        if (!isDock) {
          isDock = true;
        }
        isOpened = true;
      });
      _animationController.animateTo(0.0);
      widget.controller.dockOffsetDrag(true, 240, widget.height);
    } else {
      setState(() {
        if (!isDock) {
          isDock = true;
        }
        isOpened = false;
      });
      _animationController.animateTo(1.0);
      widget.controller.resetOffsetDrag(true, widget.height);
    }
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        // onDropSideMenuSvg(false); // Triggered when pan starts
        setState(() {
          offsetDragX = details.localPosition.dx;
          offsetDragY = details.localPosition.dy;
        });
      },
      onPanUpdate: (details) {
        onDragSideMenuSvg(details.localPosition.dx + offsetDragX, details.localPosition.dy);
      },
      onPanEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 100) {
          onDropSideMenuSvg(true); // Triggered when the pan ends with a rightward swipe
        } else {
          onDropSideMenuSvg(false); // Triggered when the pan ends without a rightward swipe
        }
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Container(
          child: JellySideMenuSvg(
            controller: widget.controller,
            width: 240,
            height: widget.height,
            onJellyUndocked: () {},
            onJellyNotUndocked: () {},
            child: AnimatedOpacity(
              opacity: isOpened ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: SlideTransition(
                position: _offsetAnimation,
                child: SizedBox(
                  width: 240,
                  height: widget.height,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}