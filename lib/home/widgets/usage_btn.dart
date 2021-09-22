import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsageBtn extends StatelessWidget {
  const UsageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _onPressed(context),
      icon: FaIcon(
        FontAwesomeIcons.question,
        color: Colors.white,
        size: 20,
      ),
      label: Text(
        'Usage',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _UsageDialog(),
    );
  }
}

class _UsageDialog extends StatelessWidget {
  const _UsageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text('Usage'),
          content: SizedBox(
            width: size.width * 0.6,
            height: size.height * 0.6,
            child: state.themeUsage != null
                ? _UsageContent(usage: state.themeUsage!)
                : Center(child: CircularProgressIndicator()),
          ),
          actions: [
            TextButton(
              key: const Key('usageBtn_closeBtn'),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _UsageContent extends StatelessWidget {
  final ThemeUsage usage;

  const _UsageContent({Key? key, required this.usage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return usage.markdownData != null
        ? Markdown(
            selectable: true,
            data: usage.markdownData!,
            onTapLink: (String text, String? href, String title) {
              if (href != null) UtilService.launchUrl(href);
            },
          )
        : _UsageFallback(
            key: const Key('usageBtn_usageFallback'),
          );
  }
}

class _UsageFallback extends StatelessWidget {
  const _UsageFallback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.exclamationTriangle,
          color: Colors.yellow,
          size: 48,
        ),
        VerticalPadding(),
        RichText(
          text: TextSpan(
            text: 'Failed to fetch usage details. Please visit ',
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: 'this',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UtilService.launchUrl(ThemeUsage.markdownUrl),
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(text: ' page instead.'),
            ],
          ),
        ),
      ],
    );
  }
}
