// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetCatalogueCollection on Isar {
  IsarCollection<Catalogue> get catalogues => collection();
}

const CatalogueSchema = CollectionSchema(
  name: r'Catalogue',
  schema:
      r'{"name":"Catalogue","idName":"id","properties":[],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {r'gifts': 0},
  backlinkLinkNames: {r'gifts': r'catalogue'},
  getId: _catalogueGetId,
  setId: _catalogueSetId,
  getLinks: _catalogueGetLinks,
  attachLinks: _catalogueAttachLinks,
  serializeNative: _catalogueSerializeNative,
  deserializeNative: _catalogueDeserializeNative,
  deserializePropNative: _catalogueDeserializePropNative,
  serializeWeb: _catalogueSerializeWeb,
  deserializeWeb: _catalogueDeserializeWeb,
  deserializePropWeb: _catalogueDeserializePropWeb,
  version: 4,
);

int? _catalogueGetId(Catalogue object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _catalogueSetId(Catalogue object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _catalogueGetLinks(Catalogue object) {
  return [object.gifts];
}

void _catalogueSerializeNative(
    IsarCollection<Catalogue> collection,
    IsarCObject cObj,
    Catalogue object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final size = (staticSize) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
}

Catalogue _catalogueDeserializeNative(IsarCollection<Catalogue> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Catalogue();
  object.id = id;
  _catalogueAttachLinks(collection, id, object);
  return object;
}

P _catalogueDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _catalogueSerializeWeb(
    IsarCollection<Catalogue> collection, Catalogue object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  return jsObj;
}

Catalogue _catalogueDeserializeWeb(
    IsarCollection<Catalogue> collection, Object jsObj) {
  final object = Catalogue();
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  _catalogueAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, r'id'), object);
  return object;
}

P _catalogueDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _catalogueAttachLinks(
    IsarCollection<dynamic> col, int id, Catalogue object) {
  object.gifts.attach(col, col.isar.gifts, r'gifts', id);
}

extension CatalogueQueryWhereSort
    on QueryBuilder<Catalogue, Catalogue, QWhere> {
  QueryBuilder<Catalogue, Catalogue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CatalogueQueryWhere
    on QueryBuilder<Catalogue, Catalogue, QWhereClause> {
  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idBetween(
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

extension CatalogueQueryFilter
    on QueryBuilder<Catalogue, Catalogue, QFilterCondition> {
  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idBetween(
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
}

extension CatalogueQueryLinks
    on QueryBuilder<Catalogue, Catalogue, QFilterCondition> {
  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> gifts(
      FilterQuery<Gift> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(
        query.collection.isar.gifts,
        q,
        r'gifts',
      );
    });
  }
}

extension CatalogueQueryWhereSortBy
    on QueryBuilder<Catalogue, Catalogue, QSortBy> {}

extension CatalogueQueryWhereSortThenBy
    on QueryBuilder<Catalogue, Catalogue, QSortThenBy> {
  QueryBuilder<Catalogue, Catalogue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CatalogueQueryWhereDistinct
    on QueryBuilder<Catalogue, Catalogue, QDistinct> {}

extension CatalogueQueryProperty
    on QueryBuilder<Catalogue, Catalogue, QQueryProperty> {
  QueryBuilder<Catalogue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
