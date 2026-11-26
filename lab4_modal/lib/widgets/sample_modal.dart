import 'package:flutter/material.dart';

/// A reusable modal dialog displaying a header, top image asset,
/// bounded scrollable long text, and a CLOSE button that dismisses the dialog.
class SampleModal extends StatelessWidget {
  const SampleModal({super.key});

  static const Color _brandGreen = Color(0xFF1F6A42);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: screenHeight * 0.78,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Modal header bar
            Container(
              color: _brandGreen,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: const Text(
                'SampleModal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Image asset at the top of the dialog body
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/sample_modal_image.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE6F2EC),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_outlined,
                          size: 48,
                          color: _brandGreen,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bounded scrollable area for long text
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: const Text(
                      "What if I told you that I've fallen?\n"
                      "And I like the way you say my name\n"
                      "My heart skips a beat when I hear you calling\n"
                      "And I like that it won't go away\n"
                      "But never mind, don't wanna give you any trouble\n"
                      "Never mind, never mind\n"
                      "I'm okay with being by your side for as long as I can hide\n"
                      "What if I told you that I've fallen?\n"
                      "What if I told you that I've fallen?\n"
                      "A heart shaped arrow through my chest\n"
                      "I'll make you breakfast every morning\n"
                      "And pick you up when you're a mess\n"
                      "I know that it won't ever stop\n"
                      "You know I'll be there when you call me whether you like it or not\n"
                      "Without a warning, now I'm falling for this picture on my phone\n"
                      "But don't mind me I'm just falling, I'll get back up on my own\n"
                      "Please don't say my name, help me put out this flame\n"
                      "I'd rather hold onto this feeling that you don't even believe in\n"
                      "What if I told you that I've fallen?",
                      style: TextStyle(fontSize: 15, height: 1.7),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom CLOSE button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: _brandGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'CLOSE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
