import 'package:get/get.dart';

import '../controllers/project_controller.dart';
import '../project_tree_children/project_tree_children_controller.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => ProjectTreeChildrenController());
  }
}
