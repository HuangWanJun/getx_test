import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/routes/app_pages.dart';
import 'package:myapp/pages/list_detail/index.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("导航-命名路由 home > list"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          ListTile(
            title: Text("导航-命名路由 home > list > detail"),
            subtitle: Text('Get.toNamed("/home/list/detail")'),
            onTap: () => Get.toNamed("/home/list/detail"),
          ),
          ListTile(
            title: Text("导航-类对象"),
            subtitle: Text("Get.to(DetailView())"),
            onTap: () => Get.to(DetailView()),
          ),
          ListTile(
            title: Text("导航-清除上一个"),
            subtitle: Text("Get.off(DetailView())"),
            onTap: () => Get.off(DetailView()),
          ),
          ListTile(
            title: Text("导航-清除所有"),
            subtitle: Text("Get.offAll(DetailView())"),
            onTap: () => Get.offAll(DetailView()),
          ),
          Divider(),
          ListTile(
            title: Text("导航-arguments传值+返回值"),
            subtitle: Text(
                'Get.toNamed("/home/list/detail", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail",
                  arguments: {"id": 999});
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-parameters传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail?id=666")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail?id=666");
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-参数传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail/777")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail/777");
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          Divider(),
          ListTile(
            title: Text("导航-not found"),
            subtitle: Text('Get.toNamed("/aaa/bbb/ccc/777")'),
            onTap: () async {
              await Get.toNamed("/aaa/bb/ccc/777");
            },
          ),
          ListTile(
            title: Text("导航-中间件-认证Auth"),
            subtitle: Text('Get.toNamed(AppRoutes.My)'),
            onTap: () => Get.toNamed(AppRoutes.My),
          ),
          Divider(),
        ],
      ),
    );
  }
}
