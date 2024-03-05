import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/counter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                  return Text('$state',
                    style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
                  );
              },
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecreaseCounter());
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 56,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreaseCounter());
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 56,
                  ),
                ),
              ],
            ),
            OutlinedButton(onPressed: (){
              context.read<CounterBloc>().add(ResetCounter());
            }, child: const Text('Reset')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
