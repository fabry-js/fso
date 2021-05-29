import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:starting_out/widgets/expandable_fab.dart';

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);

  Observable get stream$ => _counter.stream;
  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
  }

  decrement() {
    _counter.add(current - 1);
  }

  reset() {
    _counter.value = 0;
  }
}

Counter counterService = Counter();

class RxDartCounterExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: counterService.stream$,
          builder: (BuildContext context, AsyncSnapshot snap) {
            return Text("Contatore: ${snap.data}");
          },
        ),
        floatingActionButton: ExpandableFab(
          distance: 112.0,
          children: [
            ActionButton(
              onPressed: () => counterService.increment(),
              icon: const Icon(Icons.add),
            ),
            ActionButton(
              onPressed: () => {
                if (counterService._counter.value == 0)
                  {
                    print(
                        "Non puoi decrementare un contatore con valore pari a 0!"),
                  }
                else
                  {counterService.decrement()}
              },
              icon: const Icon(Icons.remove),
            ),
            ActionButton(
              onPressed: () => counterService.reset(),
              icon: const Icon(Icons.exposure_zero),
            ),
          ],
        ));
  }
}
