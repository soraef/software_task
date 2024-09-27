import 'package:software_task/domain/project/project.dart';
import 'package:software_task/domain/user/user.dart';
import 'package:uuid/uuid.dart';

extension type TaskEntryId(String value) implements String {
  factory TaskEntryId.create() {
    return TaskEntryId(const Uuid().v4());
  }
}

class TaskEntry {
  final TaskEntryId id;
  final ProjectId projectId;
  final UserId creatorId;

  TaskEntry({
    required this.id,
    required this.projectId,
    required this.creatorId,
  });

  factory TaskEntry.create(ProjectId projectId, UserId creatorId) {
    return TaskEntry(
      id: TaskEntryId.create(),
      projectId: projectId,
      creatorId: creatorId,
    );
  }
}
