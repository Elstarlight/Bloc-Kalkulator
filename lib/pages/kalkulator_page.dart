import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectsemester2/blocs/kalkulator_bloc.dart';
import 'package:projectsemester2/events/kalkulator_event.dart';
import 'package:projectsemester2/states/kalkulator_state.dart';
import 'package:projectsemester2/widgets/button.dart';
import 'package:projectsemester2/widgets/textfield.dart';

class KalkulatorPage extends StatelessWidget {
  KalkulatorPage({super.key});

  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Aritmatik Kalkulator',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: KalkulatorTextField(
                      controller: angka1Controller,
                      label: 'Angka 1',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: KalkulatorTextField(
                      controller: angka2Controller,
                      label: 'Angka 2',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['+', '-', 'x', ':'].map((op) {
                  return KalkulatorButton(
                    text: op,
                    onPressed: () {
                      final a =
                          double.tryParse(angka1Controller.text) ?? 0;
                      final b =
                          double.tryParse(angka2Controller.text) ?? 0;

                      context
                          .read<KalkulatorBloc>()
                          .add(HitungEvent(a, b, op));
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              BlocBuilder<KalkulatorBloc, KalkulatorState>(
                builder: (context, state) {
                  return Center(
                    child: Text(
                      'Hasil: ${state.hasil}',
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: KalkulatorButton(
          text: 'RESET',
          onPressed: () {
            angka1Controller.clear();
            angka2Controller.clear();
            context.read<KalkulatorBloc>().add(ResetEvent());
          },
        ),
      ),
    );
  }
}
