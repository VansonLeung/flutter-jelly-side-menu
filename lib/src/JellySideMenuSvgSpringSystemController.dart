part of '../flutter_jellysidemenu.dart';

class JellySideMenuSvgSpringSystemController {
  bool is_mounted = false;
  bool isBusy = false;
  bool isBusyY = false;
  bool isBusySm = false;

  late SpringSystem springSystem;
  late SpringSystem springSystem2;
  late Spring ssOffsetDragX;
  late Spring ssOffsetDragY;
  late Spring ssOffsetDragXSm;

  void initState(
      JellySideMenuSvgState state,
      double height,
      ) {
    springSystem = SpringSystem.create(state);
    springSystem2 = SpringSystem.create(state);

    ssOffsetDragX = springSystem.createSpring();
    ssOffsetDragY = springSystem2.createSpring();
    ssOffsetDragXSm = springSystem2.createSpring();

    ssOffsetDragX.setCurrentValue(0);
    ssOffsetDragY.setCurrentValue(height / 2);
    ssOffsetDragXSm.setCurrentValue(0);

    SpringConfig sscX = ssOffsetDragX.getSpringConfig();
    SpringConfig sscY = ssOffsetDragY.getSpringConfig();
    SpringConfig sscXSm = ssOffsetDragXSm.getSpringConfig();

    sscX.tension = 500;
    sscX.friction = 10;

    sscY.tension = 500;
    sscY.friction = 10;

    sscXSm.tension = 500;
    sscXSm.friction = 15;

    ssOffsetDragX.addListener(SimpleSpringListener(
        updateCallback: (spring) {
          if (!is_mounted) { return; }
          // if (isBusy) { return; }
          //
          // isBusy = true;
          if (ssOffsetDragX.getEndValue() <= 0) {
            if (state.offsetDragX <= 0 && !state.is_undocked) {
              state.setState(() {
                state.offsetDragX = ssOffsetDragX.getCurrentValue();
                if (!state.is_undocked) {
                  state.is_undocked = true;
                  state.onJellyUndocked();
                }
              });
              ssOffsetDragX.setCurrentValue(0);
              ssOffsetDragXSm.setCurrentValue(0);
              return;
            } else {
              state.setState(() {
                state.offsetDragX = ssOffsetDragX.getCurrentValue();
              });
              return;
            }
          } else {
            if (state.is_undocked) {
              state.setState(() {
                state.offsetDragX = ssOffsetDragX.getCurrentValue();
                if (state.is_undocked) {
                  state.is_undocked = false;
                  state.onJellyNotUndocked();
                }
              });
              return;
            } else {
              state.setState(() {
                state.offsetDragX = ssOffsetDragX.getCurrentValue();
              });
              return;
            }
          }
        }
    ));

    ssOffsetDragY.addListener(SimpleSpringListener(
        updateCallback: (spring) {
          if (!is_mounted) { return; }
          // if (isBusyY) { return; }
          //
          // isBusyY = true;

          state.setState(() {
            state.offsetDragY = ssOffsetDragY.getCurrentValue();
          });
        }
    ));

    ssOffsetDragXSm.addListener(SimpleSpringListener(
        updateCallback: (spring) {
          if (!is_mounted) { return; }
          // if (isBusySm) { return; }
          //
          // isBusySm = true;

          state.setState(() {
            state.offsetDragXSm = ssOffsetDragXSm.getCurrentValue();
          });
        }
    ));
  }



  void componentDidMount() {
    is_mounted = true;
    isBusy = false;
    isBusyY = false;
    isBusySm = false;
  }

  void componentWillUnmount() {
    is_mounted = false;
  }


  void setOffsetDrag(
      bool animated,
      double x,
      double y,
      ) {
    if (animated) {
      ssOffsetDragX.setEndValue(x / 2);
      ssOffsetDragY.setEndValue(y);
      ssOffsetDragXSm.setEndValue(x / 5);
    } else {
      ssOffsetDragX.setCurrentValue(x / 2);
      ssOffsetDragY.setCurrentValue(y);
      ssOffsetDragXSm.setCurrentValue(x / 5);
    }
  }

  void resetOffsetDrag(
      bool animated,
      double height,
      ) {
    if (animated) {
      ssOffsetDragX.setEndValue(0);
      ssOffsetDragY.setEndValue(height / 2);
      ssOffsetDragXSm.setEndValue(0);
    } else {
      ssOffsetDragX.setCurrentValue(0);
      ssOffsetDragY.setCurrentValue(height / 2);
      ssOffsetDragXSm.setCurrentValue(0);
    }
  }

  void dockOffsetDrag(
      bool animated,
      double dockWidth,
      double height,
      ) {
    if (animated) {
      ssOffsetDragX.setEndValue(dockWidth);
      ssOffsetDragY.setEndValue(height / 2);
      ssOffsetDragXSm.setEndValue(dockWidth);
    } else {
      ssOffsetDragX.setCurrentValue(dockWidth);
      ssOffsetDragY.setCurrentValue(height / 2);
      ssOffsetDragXSm.setCurrentValue(dockWidth);
    }
  }

}

