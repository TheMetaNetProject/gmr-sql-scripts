ALTER TABLE lm_en DROP INDEX extidindx;
ALTER TABLE lm_en DROP COLUMN extid;

ALTER TABLE lm_es DROP INDEX extidindx;
ALTER TABLE lm_es DROP COLUMN extid;

ALTER TABLE lm_ru DROP INDEX extidindx;
ALTER TABLE lm_ru DROP COLUMN extid;

ALTER TABLE lm_fa DROP INDEX extidindx;
ALTER TABLE lm_fa DROP COLUMN extid;


ALTER TABLE lm_sentence_en DROP INDEX urlidx;
ALTER TABLE lm_sentence_es DROP INDEX urlidx;
ALTER TABLE lm_sentence_ru DROP INDEX urlidx;
ALTER TABLE lm_sentence_fa DROP INDEX urlidx;

ALTER TABLE source_concept DROP INDEX condim_idx;
ALTER TABLE target_concept DROP INDEX tarcon_idx;
