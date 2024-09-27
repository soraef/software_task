import 'package:software_task/domain/user/user.dart';
import 'package:uuid/uuid.dart';

extension type ProjectId(String value) implements String {
  factory ProjectId.create() {
    return ProjectId(const Uuid().v4());
  }
}

class Project {
  final ProjectId id;
  final List<UserId> memberIds;

  Project({
    required this.id,
    required this.memberIds,
  });

  bool isMember(UserId userId) {
    return memberIds.contains(userId);
  }

  Project addMember(UserId invitedUserId, UserId inviterUserId) {
    if (!isMember(inviterUserId)) {
      throw Exception('Only members can invite new members');
    }

    return Project(
      id: id,
      memberIds: [...memberIds, invitedUserId],
    );
  }
}
