ALTER TABLE lm DROP INDEX extidindx;
ALTER TABLE lm DROP COLUMN extid;

ALTER TABLE lm_sentence DROP INDEX urlidx;

ALTER TABLE cm_source DROP INDEX scon_idx;
ALTER TABLE cm_target_general DROP INDEX tcon_idx;
ALTER TABLE cm_target_case DROP INDEX tcon_idx;
