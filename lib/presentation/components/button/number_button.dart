import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/components/number-pad/model/number_pad_char_item.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class NumberButton extends StatelessWidget {
  final String? pinTitle;
  final KeywordNumber? char;
  final VoidCallback? onTap;
  const NumberButton({
    super.key,
    this.pinTitle,
    this.char,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isEmpty = pinTitle == null || pinTitle!.isEmpty;
    final isClear = pinTitle == "-2";

    return CupertinoButton(
      onPressed: isEmpty ? null : onTap,
      padding: EdgeInsets.zero,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: (isEmpty || isClear)
              ? UIColor.white
              : UIColor.grey.withOpacity(0.16),
          shape: BoxShape.circle,
        ),
        child: isEmpty
            ? const SizedBox.shrink()
            : isClear
                ? const Icon(Icons.backspace_outlined, size: 24)
                : Center(
                    child: Label(
                      text: pinTitle ?? "",
                      size: 24,
                    ),
                  ),
      ),
    );
  }
}
