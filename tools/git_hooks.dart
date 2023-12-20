import 'package:git_hooks/git_hooks.dart';
import 'dart:io';

void main(List<String> arguments) {
  Map<Git, UserBackFun> params = {
    Git.preCommit: preCommit,
  };
  GitHooks.call(arguments, params);
}

Future<bool> preCommit() async {
  // Linterの実行
  print("Running Dart Fix...");
  var result = await Process.run('dart', ['fix', '--apply', 'lib']);
  if (result.exitCode != 0) {
    print(result.stdout);
    return false;
  }

  // Importのソート
  print("Sorting Dart Imports...");
  var importResult =
      await Process.run('flutter', ['pub', 'run', 'import_sorter:main']);
  if (importResult.exitCode != 0) {
    print(importResult.stdout);
    return false;
  }

  // Dartフォーマットの実行
  print("Running Dart Format...");
  var formatResult = await Process.run('dart', ['format', '.']);
  if (formatResult.exitCode != 0) {
    print(formatResult.stdout);
    return false;
  }

  // Flutter テストの実行
  // print("Running Flutter Tests...");
  // var testResult = await Process.run('flutter', ['test']);
  // if (testResult.exitCode != 0) {
  //   print(testResult.stdout);
  //   return false;
  // }

  // Dartファイルのみをステージングに追加
  await addFilesToStage('lib/**/*.dart');

  return true;
}

Future<void> addFilesToStage(String pattern) async {
  var result = await Process.run('git', ['diff', '--name-only', '--cached']);
  if (result.exitCode == 0) {
    var files = result.stdout as String;
    for (var file in files.split('\n')) {
      if (file.endsWith('.dart')) {
        await Process.run('git', ['add', file]);
      }
    }
  }
}
