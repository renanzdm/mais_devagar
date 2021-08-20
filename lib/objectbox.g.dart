// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/modules/core/models/config_model_box.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(3, 2776312429260680589),
      name: 'ConfigModelBox',
      lastPropertyId: const IdUid(3, 2097318013945418043),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 229268345246542443),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 2097318013945418043),
            name: 'showIntroductionPages',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 2776312429260680589),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [7842855195899546948, 2280892050179889008],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        7861693057952538371,
        4409372443559661008,
        4038517413976094987,
        3778370860309467186,
        8512347369406974535
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ConfigModelBox: EntityDefinition<ConfigModelBox>(
        model: _entities[0],
        toOneRelations: (ConfigModelBox object) => [],
        toManyRelations: (ConfigModelBox object) => {},
        getId: (ConfigModelBox object) => object.id,
        setId: (ConfigModelBox object, int id) {
          object.id = id;
        },
        objectToFB: (ConfigModelBox object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addBool(2, object.showIntroductionPages);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ConfigModelBox(
              showIntroductionPages:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 8, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ConfigModelBox] entity fields to define ObjectBox queries.
class ConfigModelBox_ {
  /// see [ConfigModelBox.id]
  static final id =
      QueryIntegerProperty<ConfigModelBox>(_entities[0].properties[0]);

  /// see [ConfigModelBox.showIntroductionPages]
  static final showIntroductionPages =
      QueryBooleanProperty<ConfigModelBox>(_entities[0].properties[1]);
}
