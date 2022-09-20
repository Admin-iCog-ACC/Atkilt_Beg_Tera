class FilterValue {
  String? filterLabel;
  String? filterType;
  String? condition;
  int? filterValue;
  int? filterUpperBound;
  int? filterLowerBound;

  FilterValue(
      {this.condition,
      this.filterLabel,
      this.filterType,
      this.filterLowerBound,
      this.filterUpperBound,
      this.filterValue});
}
