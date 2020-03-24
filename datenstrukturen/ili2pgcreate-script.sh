java -jar /opt/ili2pg-4.4.1/ili2pg-4.4.1.jar \
--dbschema alw_strukturverbesserungen --models SO_ALW_Strukturverbesserungen_20190912 \
--defaultSrsCode 2056 --strokeArcs --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createUnique --createNumChecks --nameByTopic \
--coalesceMultiLine --coalesceMultiSurface --smart2Inheritance \
--createscript alw_strukturverbesserungen_edit.sql
