// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogue.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCatalogueCollection on Isar {
  IsarCollection<Catalogue> get catalogues => this.collection();
}

const CatalogueSchema = CollectionSchema(
  name: r'Catalogue',
  id: 7968722692539278569,
  properties: {},
  estimateSize: _catalogueEstimateSize,
  serialize: _catalogueSerialize,
  deserialize: _catalogueDeserialize,
  deserializeProp: _catalogueDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'gifts': LinkSchema(
      id: -5932558816554357477,
      name: r'gifts',
      target: r'Gift',
      single: false,
      linkName: r'catalogue',
    )
  },
  embeddedSchemas: {},
  getId: _catalogueGetId,
  getLinks: _catalogueGetLinks,
  attach: _catalogueAttach,
  version: '3.1.0+1',
);

int _catalogueEstimateSize(
  Catalogue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _catalogueSerialize(
  Catalogue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Catalogue _catalogueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Catalogue();
  object.id = id;
  return object;
}

P _catalogueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _catalogueGetId(Catalogue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _catalogueGetLinks(Catalogue object) {
  return [object.gifts];
}

void _catalogueAttach(IsarCollection<dynamic> col, Id id, Catalogue object) {
  object.id = id;
  object.gifts.attach(col, col.isar.collection<Gift>(), r'gifts', id);
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
  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterWhereClause> idBetween(
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

extension CatalogueQueryFilter
    on QueryBuilder<Catalogue, Catalogue, QFilterCondition> {
  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> idBetween(
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
}

extension CatalogueQueryObject
    on QueryBuilder<Catalogue, Catalogue, QFilterCondition> {}

extension CatalogueQueryLinks
    on QueryBuilder<Catalogue, Catalogue, QFilterCondition> {
  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> gifts(
      FilterQuery<Gift> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'gifts');
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> giftsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gifts', length, true, length, true);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> giftsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gifts', 0, true, 0, true);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> giftsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gifts', 0, false, 999999, true);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> giftsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gifts', 0, true, length, include);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition>
      giftsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gifts', length, include, 999999, true);
    });
  }

  QueryBuilder<Catalogue, Catalogue, QAfterFilterCondition> giftsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'gifts', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CatalogueQuerySortBy on QueryBuilder<Catalogue, Catalogue, QSortBy> {}

extension CatalogueQuerySortThenBy
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
