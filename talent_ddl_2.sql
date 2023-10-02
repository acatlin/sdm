-- talent_ddl_2.sql
-- add basic referential integrity
-- NOTE: When you implement referential integrity, the order in which you drop and add tables matters!
-- If you provide a DDL script to drop and create tables in a database, consider using a small amount of 
--   sample data (as below), and test the script by running it *twice*!

DROP TABLE IF EXISTS team_member_talents;
DROP TABLE IF EXISTS talents;
DROP TABLE IF EXISTS team_members;

CREATE TABLE talents
(
  talent_id int PRIMARY KEY,
  talent varchar(20)
);

CREATE TABLE team_members(
  team_member_id int PRIMARY KEY,
  team_member varchar(20) UNIQUE
);

CREATE TABLE team_member_talents(
  team_member_id int,
  talent_id int,
  PRIMARY KEY(team_member_id, talent_id),
  CONSTRAINT fk_team_member_id FOREIGN KEY (team_member_id) REFERENCES team_members(team_member_id),
  CONSTRAINT fk_talent_id FOREIGN KEY (talent_id) REFERENCES talents(talent_id)
);

INSERT INTO talents (talent_id, talent) VALUES (2, 'Data wrangling');
INSERT INTO talents (talent_id, talent) VALUES (3, 'Data analysis');
INSERT INTO talents (talent_id, talent) VALUES (4, 'Subject expertise');
INSERT INTO talents (talent_id, talent) VALUES (5, 'Design');
INSERT INTO talents (talent_id, talent) VALUES (6, 'Storytelling');

INSERT INTO talents
  (talent_id, talent)
VALUES
  (1, 'Project management');
  
INSERT INTO team_members (team_member_id, team_member) VALUES (1, 'Anand');
INSERT INTO team_members (team_member_id, team_member) VALUES (2, 'Cameron');
INSERT INTO team_members (team_member_id, team_member) VALUES (3, 'Emily');
INSERT INTO team_members (team_member_id, team_member) VALUES (4, 'Kevin');
INSERT INTO team_members (team_member_id, team_member) VALUES (5, 'Roberto');
INSERT INTO team_members (team_member_id, team_member) VALUES (6, 'Stephani');
INSERT INTO team_members (team_member_id, team_member) VALUES (7, 'Susan');
INSERT INTO team_members (team_member_id, team_member) VALUES (8, 'Xia_Li');

INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (1,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (1,6);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (2,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (3,1);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (4,1);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (4,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (6,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (6,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (7,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (7,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,6);

SELECT * FROM talents;
SELECT * FROM team_members;
SELECT * FROM team_member_talents;

SELECT t.talent_id, talent, COUNT(*)
  FROM team_member_talents tmt INNER JOIN talents t 
    ON tmt.talent_id = t.talent_id
  GROUP BY t.talent_id, t.talent
  ORDER BY t.talent_id;