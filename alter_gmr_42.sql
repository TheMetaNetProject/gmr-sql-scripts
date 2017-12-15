ALTER TABLE lm ADD COLUMN extid BIGINT(20);
ALTER TABLE lm ADD UNIQUE INDEX extidindx (extid);

ALTER TABLE lm_sentence ADD UNIQUE INDEX urlidx (url);

ALTER TABLE cm_source ADD UNIQUE INDEX scon_idx (source_concept);
ALTER TABLE cm_target_general ADD UNIQUE INDEX tcon_idx (target_concept);
ALTER TABLE cm_target_case ADD UNIQUE INDEX tcon_idx (target_concept);

ALTER TABLE cm_property ADD COLUMN nvalue FLOAT(6,4);
ALTER TABLE lm_property ADD COLUMN nvalue FLOAT(6,4);
