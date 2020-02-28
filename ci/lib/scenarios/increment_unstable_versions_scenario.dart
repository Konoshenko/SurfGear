import 'package:ci/domain/command.dart';
import 'package:ci/domain/element.dart';
import 'package:ci/services/parsers/pubspec_parser.dart';
import 'package:ci/tasks/checks.dart';
import 'package:ci/tasks/core/scenario.dart';
import 'package:ci/tasks/tasks.dart';

const String _helpInfo = 'Unstable version increase in modules.';

/// Сценарий для команды increment_unstable.
///
/// Пример вызова:
/// dart ci increment_unstable
class IncrementUnstableVersionsScenario extends ChangedElementScenario {
  static const String commandName = 'increment_unstable';

  IncrementUnstableVersionsScenario(Command command, PubspecParser pubspecParser)
      : super(command, pubspecParser);

  @override
  Future<void> doExecute(List<Element> elements) async {
    var incrementedList = await incrementUnstableVersion(elements);

    /// сохраняем изменения
    await saveElements(incrementedList);

    /// фиксируем изменения на репозитории
    await fixChanges(message: 'Increment unstable versions by ci.');
  }

  @override
  // TODO: implement getCommandName
  String get getCommandName => commandName;

  @override
  // TODO: implement helpInfo
  String get helpInfo => _helpInfo;
}
