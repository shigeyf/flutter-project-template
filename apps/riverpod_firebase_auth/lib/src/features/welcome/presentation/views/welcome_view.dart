import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import '../../../../app/localization/app_localizations_context.dart';
import '../../../../app/widgets/responsive_center.dart';
import '../controllers/welcome_controller.dart';
import '../../../../app/constants.dart';

class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(welcomeControllerProvider);

    return ResponsiveCenter(
      maxContentWidth: 450,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.locale.welcome_message,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const Gap(48.0),
          SizedBox(
            height: 48.0,
            child: ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(welcomeControllerProvider.notifier)
                          .completeWelcome();
                      if (context.mounted) {
                        // go to sign in page after completing welcome page.
                        context.goNamed(AppRoute.signin.name);
                      }
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      context.locale.get_started,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
