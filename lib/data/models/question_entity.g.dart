// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionEntityCollection on Isar {
  IsarCollection<QuestionEntity> get questionEntitys => this.collection();
}

const QuestionEntitySchema = CollectionSchema(
  name: r'QuestionEntity',
  id: -5718048655593194005,
  properties: {
    r'completionCount': PropertySchema(
      id: 0,
      name: r'completionCount',
      type: IsarType.long,
    ),
    r'emoji': PropertySchema(
      id: 1,
      name: r'emoji',
      type: IsarType.string,
    ),
    r'options': PropertySchema(
      id: 2,
      name: r'options',
      type: IsarType.stringList,
    ),
    r'pinyin': PropertySchema(
      id: 3,
      name: r'pinyin',
      type: IsarType.stringList,
    ),
    r'pinyin3': PropertySchema(
      id: 4,
      name: r'pinyin3',
      type: IsarType.stringList,
    )
  },
  estimateSize: _questionEntityEstimateSize,
  serialize: _questionEntitySerialize,
  deserialize: _questionEntityDeserialize,
  deserializeProp: _questionEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'completionCount': IndexSchema(
      id: 2239744106161724253,
      name: r'completionCount',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'completionCount',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _questionEntityGetId,
  getLinks: _questionEntityGetLinks,
  attach: _questionEntityAttach,
  version: '3.1.0+1',
);

int _questionEntityEstimateSize(
  QuestionEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.emoji.length * 3;
  bytesCount += 3 + object.options.length * 3;
  {
    for (var i = 0; i < object.options.length; i++) {
      final value = object.options[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.pinyin.length * 3;
  {
    for (var i = 0; i < object.pinyin.length; i++) {
      final value = object.pinyin[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.pinyin3.length * 3;
  {
    for (var i = 0; i < object.pinyin3.length; i++) {
      final value = object.pinyin3[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _questionEntitySerialize(
  QuestionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completionCount);
  writer.writeString(offsets[1], object.emoji);
  writer.writeStringList(offsets[2], object.options);
  writer.writeStringList(offsets[3], object.pinyin);
  writer.writeStringList(offsets[4], object.pinyin3);
}

QuestionEntity _questionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionEntity(
    completionCount: reader.readLongOrNull(offsets[0]) ?? 0,
    emoji: reader.readString(offsets[1]),
    options: reader.readStringList(offsets[2]) ?? [],
    pinyin: reader.readStringList(offsets[3]) ?? [],
    pinyin3: reader.readStringList(offsets[4]) ?? [],
  );
  object.id = id;
  return object;
}

P _questionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionEntityGetId(QuestionEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionEntityGetLinks(QuestionEntity object) {
  return [];
}

void _questionEntityAttach(
    IsarCollection<dynamic> col, Id id, QuestionEntity object) {
  object.id = id;
}

extension QuestionEntityQueryWhereSort
    on QueryBuilder<QuestionEntity, QuestionEntity, QWhere> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhere>
      anyCompletionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'completionCount'),
      );
    });
  }
}

extension QuestionEntityQueryWhere
    on QueryBuilder<QuestionEntity, QuestionEntity, QWhereClause> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      completionCountEqualTo(int completionCount) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'completionCount',
        value: [completionCount],
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      completionCountNotEqualTo(int completionCount) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completionCount',
              lower: [],
              upper: [completionCount],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completionCount',
              lower: [completionCount],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completionCount',
              lower: [completionCount],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'completionCount',
              lower: [],
              upper: [completionCount],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      completionCountGreaterThan(
    int completionCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completionCount',
        lower: [completionCount],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      completionCountLessThan(
    int completionCount, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completionCount',
        lower: [],
        upper: [completionCount],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterWhereClause>
      completionCountBetween(
    int lowerCompletionCount,
    int upperCompletionCount, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'completionCount',
        lower: [lowerCompletionCount],
        includeLower: includeLower,
        upper: [upperCompletionCount],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionEntityQueryFilter
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      completionCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      completionCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      completionCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      completionCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emoji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emoji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      emojiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'options',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'options',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'options',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'options',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'options',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      optionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pinyin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pinyin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pinyin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pinyin',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pinyin3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pinyin3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pinyin3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pinyin3',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3ElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pinyin3',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3LengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3LengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3LengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterFilterCondition>
      pinyin3LengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pinyin3',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension QuestionEntityQueryObject
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {}

extension QuestionEntityQueryLinks
    on QueryBuilder<QuestionEntity, QuestionEntity, QFilterCondition> {}

extension QuestionEntityQuerySortBy
    on QueryBuilder<QuestionEntity, QuestionEntity, QSortBy> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      sortByCompletionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionCount', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      sortByCompletionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionCount', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> sortByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }
}

extension QuestionEntityQuerySortThenBy
    on QueryBuilder<QuestionEntity, QuestionEntity, QSortThenBy> {
  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      thenByCompletionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionCount', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy>
      thenByCompletionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionCount', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension QuestionEntityQueryWhereDistinct
    on QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> {
  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct>
      distinctByCompletionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionCount');
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emoji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByOptions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'options');
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByPinyin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinyin');
    });
  }

  QueryBuilder<QuestionEntity, QuestionEntity, QDistinct> distinctByPinyin3() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pinyin3');
    });
  }
}

extension QuestionEntityQueryProperty
    on QueryBuilder<QuestionEntity, QuestionEntity, QQueryProperty> {
  QueryBuilder<QuestionEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionEntity, int, QQueryOperations>
      completionCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionCount');
    });
  }

  QueryBuilder<QuestionEntity, String, QQueryOperations> emojiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emoji');
    });
  }

  QueryBuilder<QuestionEntity, List<String>, QQueryOperations>
      optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<QuestionEntity, List<String>, QQueryOperations>
      pinyinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinyin');
    });
  }

  QueryBuilder<QuestionEntity, List<String>, QQueryOperations>
      pinyin3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pinyin3');
    });
  }
}
