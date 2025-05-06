import 'package:possy_app/src/feature/account_screen/model/faq_model.dart';

List<FAQModel> faqList = [
  FAQModel(
    isExpanded: true,
    question: "What is Posse?",
    answer:
    "Posse is a social platform designed to connect people with similar interests, allowing them to create and join groups (called possets) for shared activities, events, and discussions.",
  ),
  FAQModel(
    isExpanded: false,
    question: "How can I make a posse?",
    answer:
    "To create a posse, simply sign up for an account, navigate to the 'Create Posse' section, and choose the topics, goals, and members you'd like to have in your posse. You can customize your posse's settings and start inviting others to join.",
  ),
  FAQModel(
    isExpanded: false,
    question: "How to close a Posse account?",
    answer:
    "To close your Posse account, go to your account settings, select 'Account Management', and then choose 'Delete Account'. Please note that this action is irreversible, and you will lose access to your possets and data.",
  ),
];
