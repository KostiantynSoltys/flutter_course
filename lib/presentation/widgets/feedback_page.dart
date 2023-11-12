import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final Email email = Email(
    //   body: _feedbackController.text,
    //   subject: 'Feedback',
    //   recipients: ['theartofukraine@gmail.com'],
    //   cc: ['cc@theartofukraine@gmail.com'],
    //   bcc: ['bcc@theartofukraine@gmail.com'],
    //attachmentPaths: ['/path/to/attachment.zip'],
    //   isHTML: false,
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Тут ви можете поділитися своїм досвідом користування '
                  'застосунком, або запропонувати митців, про яких ми не в '
                  'курсі)',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: 340,
                  height: 400,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    controller: _feedbackController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onPrimary),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //hintText: 'Password',
                      fillColor: Theme.of(context).colorScheme.onInverseSurface,
                      filled: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  // await FlutterEmailSender.send(email);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('Поділитись'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
