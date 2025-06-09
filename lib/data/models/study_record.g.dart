// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudyRecordCollection on Isar {
  IsarCollection<StudyRecord> get studyRecords => this.collection();
}

const StudyRecordSchema = CollectionSchema(
  name: r'StudyRecord',
  id: 655454931358026723,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'averageTimePerQuestion': PropertySchema(
      id: 1,
      name: r'averageTimePerQuestion',
      type: IsarType.double,
    ),
    r'studyTime': PropertySchema(
      id: 2,
      name: r'studyTime',
      type: IsarType.dateTime,
    ),
    r'totalQuestions': PropertySchema(
      id: 3,
      name: r'totalQuestions',
      type: IsarType.long,
    ),
    r'totalTimeInSeconds': PropertySchema(
      id: 4,
      name: r'totalTimeInSeconds',
      type: IsarType.long,
    ),
    r'wrongQuestions': PropertySchema(
      id: 5,
      name: r'wrongQuestions',
      type: IsarType.long,
    )
  },
  estimateSize: _studyRecordEstimateSize,
  serialize: _studyRecordSerialize,
  deserialize: _studyRecordDeserialize,
  deserializeProp: _studyRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _studyRecordGetId,
  getLinks: _studyRecordGetLinks,
  attach: _studyRecordAttach,
  version: '3.1.0+1',
);

int _studyRecordEstimateSize(
  StudyRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _studyRecordSerialize(
  StudyRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeDouble(offsets[1], object.averageTimePerQuestion);
  writer.writeDateTime(offsets[2], object.studyTime);
  writer.writeLong(offsets[3], object.totalQuestions);
  writer.writeLong(offsets[4], object.totalTimeInSeconds);
  writer.writeLong(offsets[5], object.wrongQuestions);
}

StudyRecord _studyRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudyRecord(
    studyTime: reader.readDateTime(offsets[2]),
    totalQuestions: reader.readLong(offsets[3]),
    totalTimeInSeconds: reader.readLong(offsets[4]),
    wrongQuestions: reader.readLong(offsets[5]),
  );
  object.id = id;
  return object;
}

P _studyRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studyRecordGetId(StudyRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studyRecordGetLinks(StudyRecord object) {
  return [];
}

void _studyRecordAttach(
    IsarCollection<dynamic> col, Id id, StudyRecord object) {
  object.id = id;
}

extension StudyRecordQueryWhereSort
    on QueryBuilder<StudyRecord, StudyRecord, QWhere> {
  QueryBuilder<StudyRecord, StudyRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudyRecordQueryWhere
    on QueryBuilder<StudyRecord, StudyRecord, QWhereClause> {
  QueryBuilder<StudyRecord, StudyRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<StudyRecord, StudyRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterWhereClause> idBetween(
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

extension StudyRecordQueryFilter
    on QueryBuilder<StudyRecord, StudyRecord, QFilterCondition> {
  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      averageTimePerQuestionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageTimePerQuestion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      averageTimePerQuestionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageTimePerQuestion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      averageTimePerQuestionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageTimePerQuestion',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      averageTimePerQuestionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageTimePerQuestion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      studyTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      studyTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      studyTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studyTime',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      studyTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studyTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalQuestionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalQuestionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalQuestionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalQuestionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuestions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalTimeInSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTimeInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalTimeInSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTimeInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalTimeInSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTimeInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      totalTimeInSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTimeInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      wrongQuestionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      wrongQuestionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrongQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      wrongQuestionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrongQuestions',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterFilterCondition>
      wrongQuestionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrongQuestions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudyRecordQueryObject
    on QueryBuilder<StudyRecord, StudyRecord, QFilterCondition> {}

extension StudyRecordQueryLinks
    on QueryBuilder<StudyRecord, StudyRecord, QFilterCondition> {}

extension StudyRecordQuerySortBy
    on QueryBuilder<StudyRecord, StudyRecord, QSortBy> {
  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByAverageTimePerQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTimePerQuestion', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByAverageTimePerQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTimePerQuestion', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByStudyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyTime', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByStudyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyTime', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByTotalQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByTotalTimeInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeInSeconds', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByTotalTimeInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeInSeconds', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> sortByWrongQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongQuestions', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      sortByWrongQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongQuestions', Sort.desc);
    });
  }
}

extension StudyRecordQuerySortThenBy
    on QueryBuilder<StudyRecord, StudyRecord, QSortThenBy> {
  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByAverageTimePerQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTimePerQuestion', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByAverageTimePerQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageTimePerQuestion', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByStudyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyTime', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByStudyTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyTime', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByTotalQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuestions', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByTotalTimeInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeInSeconds', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByTotalTimeInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTimeInSeconds', Sort.desc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy> thenByWrongQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongQuestions', Sort.asc);
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QAfterSortBy>
      thenByWrongQuestionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongQuestions', Sort.desc);
    });
  }
}

extension StudyRecordQueryWhereDistinct
    on QueryBuilder<StudyRecord, StudyRecord, QDistinct> {
  QueryBuilder<StudyRecord, StudyRecord, QDistinct> distinctByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracy');
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QDistinct>
      distinctByAverageTimePerQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageTimePerQuestion');
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QDistinct> distinctByStudyTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studyTime');
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QDistinct> distinctByTotalQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuestions');
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QDistinct>
      distinctByTotalTimeInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTimeInSeconds');
    });
  }

  QueryBuilder<StudyRecord, StudyRecord, QDistinct> distinctByWrongQuestions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrongQuestions');
    });
  }
}

extension StudyRecordQueryProperty
    on QueryBuilder<StudyRecord, StudyRecord, QQueryProperty> {
  QueryBuilder<StudyRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudyRecord, double, QQueryOperations> accuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracy');
    });
  }

  QueryBuilder<StudyRecord, double, QQueryOperations>
      averageTimePerQuestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageTimePerQuestion');
    });
  }

  QueryBuilder<StudyRecord, DateTime, QQueryOperations> studyTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studyTime');
    });
  }

  QueryBuilder<StudyRecord, int, QQueryOperations> totalQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuestions');
    });
  }

  QueryBuilder<StudyRecord, int, QQueryOperations>
      totalTimeInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTimeInSeconds');
    });
  }

  QueryBuilder<StudyRecord, int, QQueryOperations> wrongQuestionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongQuestions');
    });
  }
}
