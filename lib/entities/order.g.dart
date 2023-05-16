// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetOrderCollection on Isar {
  IsarCollection<Order> get orders => collection();
}

const OrderSchema = CollectionSchema(
  name: r'Order',
  schema:
      r'{"name":"Order","idName":"id","properties":[{"name":"address","type":"String"},{"name":"datum","type":"Long"},{"name":"paidFor","type":"Bool"},{"name":"total","type":"Double"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'address': 0, r'datum': 1, r'paidFor': 2, r'total': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {r'gifts': 0},
  backlinkLinkNames: {r'gifts': r'order'},
  getId: _orderGetId,
  setId: _orderSetId,
  getLinks: _orderGetLinks,
  attachLinks: _orderAttachLinks,
  serializeNative: _orderSerializeNative,
  deserializeNative: _orderDeserializeNative,
  deserializePropNative: _orderDeserializePropNative,
  serializeWeb: _orderSerializeWeb,
  deserializeWeb: _orderDeserializeWeb,
  deserializePropWeb: _orderDeserializePropWeb,
  version: 4,
);

int? _orderGetId(Order object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _orderSetId(Order object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _orderGetLinks(Order object) {
  return [object.gifts];
}

void _orderSerializeNative(IsarCollection<Order> collection, IsarCObject cObj,
    Order object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  final address$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.address);
  final size = (staticSize + 3 + (address$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeByteList(offsets[0], address$Bytes);
  writer.writeDateTime(offsets[1], object.datum);
  writer.writeBool(offsets[2], object.paidFor);
  writer.writeDouble(offsets[3], object.total);
}

Order _orderDeserializeNative(IsarCollection<Order> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Order();
  object.address = reader.readString(offsets[0]);
  object.datum = reader.readDateTime(offsets[1]);
  object.id = id;
  object.paidFor = reader.readBool(offsets[2]);
  object.total = reader.readDouble(offsets[3]);
  _orderAttachLinks(collection, id, object);
  return object;
}

P _orderDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _orderSerializeWeb(IsarCollection<Order> collection, Order object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'address', object.address);
  IsarNative.jsObjectSet(
      jsObj, r'datum', object.datum.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'paidFor', object.paidFor);
  IsarNative.jsObjectSet(jsObj, r'total', object.total);
  return jsObj;
}

Order _orderDeserializeWeb(IsarCollection<Order> collection, Object jsObj) {
  final object = Order();
  object.address = IsarNative.jsObjectGet(jsObj, r'address') ?? '';
  object.datum = IsarNative.jsObjectGet(jsObj, r'datum') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'datum') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.paidFor = IsarNative.jsObjectGet(jsObj, r'paidFor') ?? false;
  object.total =
      IsarNative.jsObjectGet(jsObj, r'total') ?? double.negativeInfinity;
  _orderAttachLinks(collection, IsarNative.jsObjectGet(jsObj, r'id'), object);
  return object;
}

P _orderDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'address':
      return (IsarNative.jsObjectGet(jsObj, r'address') ?? '') as P;
    case r'datum':
      return (IsarNative.jsObjectGet(jsObj, r'datum') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'datum') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'paidFor':
      return (IsarNative.jsObjectGet(jsObj, r'paidFor') ?? false) as P;
    case r'total':
      return (IsarNative.jsObjectGet(jsObj, r'total') ??
          double.negativeInfinity) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _orderAttachLinks(IsarCollection<dynamic> col, int id, Order object) {
  object.gifts.attach(col, col.isar.gifts, r'gifts', id);
}

extension OrderQueryWhereSort on QueryBuilder<Order, Order, QWhere> {
  QueryBuilder<Order, Order, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderQueryWhere on QueryBuilder<Order, Order, QWhereClause> {
  QueryBuilder<Order, Order, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Order, Order, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Order, Order, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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

  QueryBuilder<Order, Order, QAfterFilterCondition> datumEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datum',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datum',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datum',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> datumBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> idGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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

  QueryBuilder<Order, Order, QAfterFilterCondition> paidForEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidFor',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalGreaterThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalLessThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<Order, Order, QAfterFilterCondition> totalBetween(
      double lower, double upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }
}

extension OrderQueryLinks on QueryBuilder<Order, Order, QFilterCondition> {
  QueryBuilder<Order, Order, QAfterFilterCondition> gifts(FilterQuery<Gift> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(
        query.collection.isar.gifts,
        q,
        r'gifts',
      );
    });
  }
}

extension OrderQueryWhereSortBy on QueryBuilder<Order, Order, QSortBy> {
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

extension OrderQueryWhereSortThenBy on QueryBuilder<Order, Order, QSortThenBy> {
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

  QueryBuilder<Order, Order, QDistinct> distinctByDatum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datum');
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

  QueryBuilder<Order, DateTime, QQueryOperations> datumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datum');
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
