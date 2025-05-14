class OrganizationContent {
  OrganizationContent({required this.title, required this.subItems});
  final String title;
  final List<SubItem> subItems;
}

class SubItem {
  SubItem({required this.title, required this.articleId});
  final String title;
  final int articleId;
}
