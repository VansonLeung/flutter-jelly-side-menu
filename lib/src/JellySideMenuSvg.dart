part of '../flutter_jellysidemenu.dart';

class JellySideMenuSvg extends StatefulWidget {

  final JellySideMenuSvgSpringSystemController controller;
  final double width;
  final double height;
  final Function onJellyUndocked;
  final Function onJellyNotUndocked;
  final Widget child;

  const JellySideMenuSvg({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.onJellyUndocked,
    required this.onJellyNotUndocked,
    required this.child,
  });

  @override
  JellySideMenuSvgState createState() => JellySideMenuSvgState();
}




class JellySideMenuSvgState extends State<JellySideMenuSvg> with TickerProviderStateMixin {


  bool is_dock = false;
  bool is_undocked = true;
  double offsetDragX = 0;
  double offsetDragY = 0;
  double offsetDragXSm = 0;

  @override
  void initState() {
    super.initState();
    offsetDragY = widget.height / 2;
    widget.controller.initState(
      this,
      widget.height,
    );
    widget.controller.componentDidMount();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.componentWillUnmount();
  }

  void onJellyUndocked() {
    widget.onJellyUndocked();
  }

  void onJellyNotUndocked() {
    widget.onJellyNotUndocked();
  }


  @override
  Widget build(BuildContext context) {

    var pathSide = "";
    var path = "";

    pathSide = "M$offsetDragXSm 0";
    pathSide += " Q$offsetDragX 0 $offsetDragX $offsetDragY";
    pathSide += " Q$offsetDragX ${widget.height} $offsetDragXSm ${widget.height}";
    path = "$pathSide L0 ${widget.height} L0 0 Z";

    String svgString = '''
      <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 ${widget.width} ${widget.height}">
        <path fill="#42A5F5" fill-opacity=".8" d="$path" />
      </svg>
    ''';

    return Stack(
        children: [
          SvgPicture.string(
            svgString,
            semanticsLabel: '',
            fit: BoxFit.fill,
            width: widget.width,
            height: widget.height,
            allowDrawingOutsideViewBox: true,
          ),
          widget.child,
        ],
    );
  }
}




