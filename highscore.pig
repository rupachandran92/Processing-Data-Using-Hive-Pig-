REGISTER pig-examples.jar;
records = LOAD 'input' USING CutLoadFunc('1-3,4-8,9-11') AS
(classId: chararray, studentId:chararray, score:int);

filtered_records = FILTER records BY score != 0;
grouped_records = GROUP filtered_records BY classId;
max_score = FOREACH grouped_records GENERATE group,
MAX(filtered_records.score);
DUMP max_score;
