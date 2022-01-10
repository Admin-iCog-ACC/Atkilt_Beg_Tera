class AttributeClass {
  int? id;
  String? name;
  String? type;

  AttributeClass();

  AttributeClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }

  @override
  String toString() {
    return 'AttributeClass{id: $id, name: $name, type: $type}';
  }
}
