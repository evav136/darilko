// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderCollection on Isar {
  IsarCollection<Order> get orders => this.collection();
}

const OrderSchema = CollectionSchema(
  name: r'Order',
  id: 103494837486634173,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'datum': PropertySchema(
      id: 1,
      name: r'datum',
      type: IsarType.string,
    ),
    r'giftId': PropertySchema(
      id: 2,
      name: r'giftId',
      type: IsarType.long,
    ),
    r'ime': PropertySchema(
      id: 3,
      name: r'ime',
      type: IsarType.string,
    ),
    r'paidFor': PropertySchema(
      id: 4,
      name: r'paidFor',
      type: IsarType.bool,
    ),
    r'total': PropertySchema(
      id: 5,
      name: r'total',
      type: IsarType.double,
    )
  },
  estimateSize: _orderEstimateSize,
  serialize: _orderSerialize,
  deserialize: _orderDeserialize,
  deserializeProp: _orderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _orderGetId,
  getLinks: _orderGetLinks,
  attach: _orderAttach,
  version: '3.1.0+1',
);

int _orderEstimateSize(
  Order object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.datum.length * 3;
  bytesCount += 3 + object.ime.length * 3;
  return bytesCount;
}

void _orderSerialize(
  Order object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.datum);
  writer.writeLong(offsets[2], object.giftId);
  writer.writeString(offsets[3], object.ime);
  writer.writeBool(offsets[4], object.paidFor);
  writer.writeDouble(offsets[5], object.total);
}

Order _orderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Order(
    datum: reader.readString(offsets[1]),
    giftId: reader.readLong(offsets[2]),
    paidFor: reader.readBool(offsets[4]),
    total: reader.readDouble(offsets[5]),
  );
  object.address = reader.readString(offsets[0]);
  object.id = id;
  object.ime = reader.readString(offsets[3]);
  return object;
}

P _orderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderGetId(Order object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderGetLinks(Order object) {
  return [];
}

void _orderAttach(IsarCollection<dynamic> col, Id id, Order object) {
  object.id = id;
}

extension OrderQueryWhereSort on QueryBuilder<Order, Order, QWhere> {
  QueryBuilder<Order, Order, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderQueryWhere on QueryBuilder<Order, Order, QWhereClause> {
  QueryBuilder<Order, Order, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OrderQueryFilter on QueryBuilder<Order, Order, QFilterCondition> {
  QueryBuilder<Order, Order, QAfterFilterCondition> addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'datum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'datum',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datum',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'datum',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> giftIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giftId',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> giftIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'giftId',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> giftIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'giftId',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> giftIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'giftId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ime',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> imeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ime',
        value: '',
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> paidForEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidFor',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension OrderQueryObject on QueryBuilder<Order, Order, QFilterCondition> {}

extension OrderQueryLinks on QueryBuilder<Order, Order, QFilterCondition> {}

extension OrderQuerySortBy on QueryBuilder<Order, Order, QSortBy> {
  QueryBuilder<Order, Order, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByDatum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datum', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByDatumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datum', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByGiftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giftId', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByGiftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giftId', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByIme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ime', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByImeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ime', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaidFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidFor', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByPaidForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidFor', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension OrderQuerySortThenBy on QueryBuilder<Order, Order, QSortThenBy> {
  QueryBuilder<Order, Order, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByDatum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datum', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByDatumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datum', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByGiftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giftId', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByGiftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giftId', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByIme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ime', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByImeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ime', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaidFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidFor', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByPaidForDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidFor', Sort.desc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<Order, Order, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension OrderQueryWhereDistinct on QueryBuilder<Order, Order, QDistinct> {
  QueryBuilder<Order, Order, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QDistinct> distinctByDatum(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datum', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QDistinct> distinctByGiftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'giftId');
    });
  }

  QueryBuilder<Order, Order, QDistinct> distinctByIme(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Order, Order, QDistinct> distinctByPaidFor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidFor');
    });
  }

  QueryBuilder<Order, Order, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension OrderQueryProperty on QueryBuilder<Order, Order, QQueryProperty> {
  QueryBuilder<Order, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Order, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Order, String, QQueryOperations> datumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datum');
    });
  }

  QueryBuilder<Order, int, QQueryOperations> giftIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'giftId');
    });
  }

  QueryBuilder<Order, String, QQueryOperations> imeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ime');
    });
  }

  QueryBuilder<Order, bool, QQueryOperations> paidForProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidFor');
    });
  }

  QueryBuilder<Order, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
