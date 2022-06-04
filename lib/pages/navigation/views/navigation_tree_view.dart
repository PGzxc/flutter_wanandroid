import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_tree_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/sticky_header/gf_sticky_header.dart';
import '../../../models/tree_response.dart';
import '../../../provider/refresh/common_state_page.dart';
import '../../../widgets/tree_chip_wrap.dart';

class NavigationTreeView extends GetView<NavigationTreeController> {
  const NavigationTreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonStatePage<NavigationTreeController>(
      controller: controller,
      onPressed: () => controller.initNavigationTreeData(),
      child: _buildBody(),
    ));
  }

  Widget _buildBody() {
    return ListView.builder(
        itemCount: controller.treeList.length,
        itemBuilder: (context, index) => GFStickyHeader(
            // enableHeaderOverlap: true,
            // direction: Axis.horizontal,
            // stickyContentPosition: GFPosition.end,
            stickyContent: Container(
              alignment: AlignmentDirectional.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF42335d),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    controller.treeList[index].name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            content: TreeChipWrap(
              chipList: controller.treeList[index].children,
              onTap: (Children value, int treeModelIndex) {
                // Get.toNamed(
                //   AppRoutes.treeTabContainerPage,
                //   arguments: {
                //     "treeModel": controller.treeList[index],
                //     "treeModelIndex": treeModelIndex,
                //   },
                // );
              },
            )));
  }
}
