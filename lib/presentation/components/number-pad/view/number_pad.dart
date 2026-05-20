import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/components/button/number_button.dart';
import 'package:redstar_module/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:redstar_module/presentation/components/number-pad/provider/number_pad_provider.dart';

class NumberPad extends StatelessWidget {
  final Function(PinItem) onTapNumber;

  const NumberPad({
    super.key,
    required this.onTapNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NumberPadProvider(),
      child: Consumer<NumberPadProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: provider.numberPadCharacters.map((rows) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: rows.map((char) {
                    return NumberButton(
                      char: char.pin,
                      pinTitle: char.value,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        onTapNumber(char);
                      },
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
