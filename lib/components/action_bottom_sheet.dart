import 'package:flutter/material.dart';

/// ボトムシートを表示するためのカスタムコンポーネント。
///
/// Flutterの`showModalBottomSheet`をラップしている。
///
/// 主な構造:
/// - `ActionBottomSheet`: ボトムシートのUI構造を定義するクラス。
///   - 引数として受け取った`actions`（アクションのリスト）を表示。
/// - `ActionItem`: ボトムシート内で個々のアクション項目を表すウィジェット。
///   - アイコン、テキスト、およびタップ時の処理を設定可能。
///
/// 主な機能:
/// - `ActionBottomSheet.show`: ボトムシートを表示する静的メソッド。
///   - 呼び出し元でアクションを指定し、ボトムシートを簡単に表示。
/// - ボトムシート内の各アクションは、タップ時にボトムシートを閉じ、
///   必要に応じてカスタム処理を実行。
///
/// 使用例:
/// ```dart
/// await ActionBottomSheet.show(
///   context,
///   actions: [
///     ActionItem(
///       icon: Icons.edit,
///       text: "編集",
///       onTap: () {
///         print("編集が選択されました");
///       },
///     ),
///     ActionItem(
///       icon: Icons.delete,
///       text: "削除",
///       onTap: () {
///         print("削除が選択されました");
///       },
///     ),
///   ],
/// );
/// ```

class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet({
    required this.actions,
    super.key,
  });

  final List<ActionItem> actions;

  static Future<void> show(
    BuildContext context, {
    required List<ActionItem> actions,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (context) => ActionBottomSheet(actions: actions),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: actions,
        ),
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({
    required this.icon,
    required this.text,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
      ),
    );
  }
}
