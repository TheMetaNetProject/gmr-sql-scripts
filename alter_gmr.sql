ALTER TABLE lm_en ADD COLUMN extid BIGINT(20);
ALTER TABLE lm_en ADD UNIQUE INDEX extidindx (extid);

ALTER TABLE lm_es ADD COLUMN extid BIGINT(20);
ALTER TABLE lm_es ADD UNIQUE INDEX extidindx (extid);

ALTER TABLE lm_ru ADD COLUMN extid BIGINT(20);
ALTER TABLE lm_ru ADD UNIQUE INDEX extidindx (extid);

ALTER TABLE lm_fa ADD COLUMN extid BIGINT(20);
ALTER TABLE lm_fa ADD UNIQUE INDEX extidindx (extid);

ALTER TABLE lm_sentence_en ADD UNIQUE INDEX urlidx (url);
ALTER TABLE lm_sentence_es ADD UNIQUE INDEX urlidx (url);
ALTER TABLE lm_sentence_ru ADD UNIQUE INDEX urlidx (url);
ALTER TABLE lm_sentence_fa ADD UNIQUE INDEX urlidx (url);

ALTER TABLE source_concept ADD UNIQUE INDEX condim_idx (source_concept_en, source_dimension_en);
ALTER TABLE target_concept ADD UNIQUE INDEX tarcon_idx (target_concept_en);
