import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Цей застосунок створювався в рамках навчання як курсовий '
                'проект. Може поки він виглядає не на всі безкоштовні гроші, '
                'але ми будемо його розвивати та підтримувати. Якщо ви маєте '
                'пропозиціїї щодо покращення або зауваження, у розділі'
                ' "Ваш хід" ви можете поділитись ними',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'P.S. Всі використані матеріали є в відкритому доступі в '
                'інтернеті, ми намагались всюди вставляти посилання на '
                'першоджерело, як ні, пишіть, виправимо. Проект не переслідує '
                'комерційні інтереси і створений виключно через бажання '
                'ширити та ділитись інформацією про українське мистецтво та '
                'митців',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'P.P.S. Якщо вам зайшло, то можете задонатити "Повернись живим",'
                ' а як ні, то все одно можете задонатити)',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
