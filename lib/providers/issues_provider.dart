import 'package:iseneca/config/helpers/loggin_model_answer.dart';
import '../domain/entities/issue_entity.dart';
import 'package:flutter/material.dart';

class IssuesProvider extends ChangeNotifier
{
  List<IssuesEntity> issuesList = [];

  final getIssues = GetIssuesModel();

  Future <void> showIssues() async
  {
    final issues = await getIssues.getIssues();

    issuesList.clear();
    issuesList.addAll(issues);

    notifyListeners();
  }

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Future <void> createIssue(IssuesEntity) async
  {
    getIssues.postIssue(IssuesEntity);
    notifyListeners();
  }
}
