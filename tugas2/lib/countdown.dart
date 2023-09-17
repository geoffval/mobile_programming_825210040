import 'dart:async';
import 'package:flutter/material.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  bool isTicking = true;
  int seconds = 0;
  int milliseconds = 0;
  late Timer timer;
  final itemHeight = 60.0;
  final scrollController = ScrollController();
  final _secondsController = TextEditingController();

  void _onTick(Timer time){
    setState(() {
      milliseconds -= 100;
    });
  }

  String _secondString(int milliseconds){
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void dispose(){
    timer.cancel();
    super.dispose();
  }

  void _inputTimer(){
    _passInput();
    _startTimer();
  }

  void _startTimer(){
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      isTicking = true;
    });
  }

  void _stopTimer(){
    timer.cancel();

    setState(() {
      isTicking = false;
    });
  }

  void _resetTimer(){
    timer.cancel();

    setState(() {
      //seconds = 0;
      milliseconds = 0;
    });
  }

  void _passInput(){
    seconds = int.parse(_secondsController.text);
    milliseconds = seconds*1000;

    _secondString(milliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown"),
      ),
      body: Center(
        child: _buildCounter(context),
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _secondString(milliseconds),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          SizedBox(width: 20),
          _buildControls(),
          SizedBox(height: 20,),
          _buildInput()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () => _startTimer(),
            child: Text('Start')
        ),
        SizedBox(width:20),

        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => _stopTimer(),
          child: Text('Stop'),
        ),
        SizedBox(width: 20,),

        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () => _resetTimer(),
          child: Text('Reset'),
        ),
      ],
    );
  }

  Widget _buildInput(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
            child: TextFormField(
              controller: _secondsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Seconds',
                border: OutlineInputBorder(),
              ),
              validator: (number) {
                if(number!.isEmpty){
                  return 'Enter seconds.';
                }
                return null;
              },
            ),
        ),
        SizedBox(width:20),
        Flexible(
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () => _inputTimer(),
              child: Text("Enter")
          )
        ),
      ],
    );
  }
}
