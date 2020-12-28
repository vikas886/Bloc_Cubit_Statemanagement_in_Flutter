import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mngmt/logic/cubit/counter_cubit.dart';
// import 'package:state_mngmt/presentation/screens/second_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncrement == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented !'),
                      duration: Duration(milliseconds: 100),
                    ),
                  );
                } else if (state.wasIncrement == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented !'),
                      duration: Duration(milliseconds: 100),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR,NAGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY,EVEN ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).decrement();
            //       },
            //       tooltip: 'Decrement',
            //       heroTag: Text('btn11'),
            //       child: Icon(Icons.remove),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).increment();
            //       },
            //       heroTag: Text('btn12'),
            //       tooltip: 'Increment',
            //       child: Icon(Icons.add),
            //     ),
            //   ],
            // ),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text(
                'Go  to Second screen',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.redAccent,
            ),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                'Go  to Third screen',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}
