import 'package:flutter/material.dart';
import 'package:flutter_jellysidemenu/flutter_jellysidemenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  JellySideMenuSvgSpringSystemController jellySideMenuSvgController = JellySideMenuSvgSpringSystemController();

  bool is_dock = false;

  void onJellyNotUndocked() {
    // this.refs.sideMenuSvgWrapper ? this.refs.sideMenuSvgWrapper.onJellyNotUndocked() : {};
  }


  void onJellyUndocked() {
    // this.refs.sideMenuSvgWrapper ? this.refs.sideMenuSvgWrapper.onJellyUndocked() : {};
  }


  void onDropSideMenuSvg(bool isOpen) {
    if (isOpen) {
      // if (!this.state.is_dock)
      // {
      //   this.setState({
      //     is_dock: true
      //   })
      // }
    } else {

    }
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          JellySideMenu(
            controller: jellySideMenuSvgController,
            width: width,
            height: height,
            child: SideMenu(),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your other widgets can go here, such as a header or logo

        // Vertical scrollable list of menu items
        Expanded(
          child: ListView.builder(
            itemCount: 20, // Number of menu items
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${index + 1}'), // Item label
                onTap: () {
                  // Handle item tap here
                  print('Tapped on Item ${index + 1}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}