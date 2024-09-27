import 'package:software_task/domain/project/project.dart';

extension type UserId(String value) implements String {}

class User {
  final UserId id;

  User({
    required this.id,
  });

  Project createProject() {
    return Project(
      id: ProjectId.create(),
      memberIds: [id],
    );
  }
}
