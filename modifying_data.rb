# Paste all your sql queries here.
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE congress_members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(64) NOT NULL,
  party VARCHAR(64) NOT NULL,
  location VARCHAR(64) NOT NULL,
  grade_1996 REAL, 
  grade_current REAL, 
  years_in_congress INTEGER,
  dw1_score REAL
, created_at DATETIME, updated_at DATETIME);
CREATE TABLE voters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(64) NOT NULL,
    last_name  VARCHAR(64) NOT NULL,
    gender VARCHAR(64) NOT NULL,
    party VARCHAR(64) NOT NULL,
    party_duration INTEGER, 
    age INTEGER,
    married INTEGER,
    children_count INTEGER,
    homeowner INTEGER, 
    employed INTEGER, 
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
  );
CREATE TABLE votes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    voter_id INTEGER,
    politician_id INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY(voter_id) REFERENCES voters(id),
    FOREIGN KEY(politician_id) REFERENCES congress_members(id)
  );
sqlite> .trace
Usage: .trace FILE|off
sqlite> .schema
CREATE TABLE congress_members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(64) NOT NULL,
  party VARCHAR(64) NOT NULL,
  location VARCHAR(64) NOT NULL,
  grade_1996 REAL, 
  grade_current REAL, 
  years_in_congress INTEGER,
  dw1_score REAL
, created_at DATETIME, updated_at DATETIME);
CREATE TABLE voters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(64) NOT NULL,
    last_name  VARCHAR(64) NOT NULL,
    gender VARCHAR(64) NOT NULL,
    party VARCHAR(64) NOT NULL,
    party_duration INTEGER, 
    age INTEGER,
    married INTEGER,
    children_count INTEGER,
    homeowner INTEGER, 
    employed INTEGER, 
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
  );
CREATE TABLE votes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    voter_id INTEGER,
    politician_id INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY(voter_id) REFERENCES voters(id),
    FOREIGN KEY(politician_id) REFERENCES congress_members(id)
  );
sqlite> INSERT INTO congress_members(name, party, location, grade_1996, grade_current, years_in_congress, dw1_score, created_at, updated_at)VALUES
   ...> ('Robert De Niro', 'R', 'Tx', 5.8876, 7.66678, 1, 0.754, NOW, NOW);
Error: no such column: NOW
sqlite> INSERT INTO congress_members(name, party, location, grade_1996, grade_current, years_in_congress, dw1_score, created_at, updated_at)
   ...> VALUES ('Robert De Niro', 'R', 'Tx', 5.8876, 7.66678, 1, 0.754, 'now', 'now');
sqlite> UPDATE congress_members SET name = 'Donald Trump' WHERE location = 'NJ';
sqlite> DELETE FROM congress_members WHERE 
   ...> DELETE FROM congress_members
   ...> ;
Error: near "DELETE": syntax error
sqlite> DELETE congress_members
   ...> DELETE congress_members WHERE party != 'R' AND 'D'.
   ...> DELETE congress_members WHERE party != 'R' AND 'D';
Error: near "congress_members": syntax error
sqlite> DELETE FROM congress_members WHERE party != 'R' AND 'D'.
   ...> DELETE FROM congress_members WHERE party != 'R' AND 'D';
Error: near "DELETE": syntax error
sqlite> DELETE FROM congress_members WHERE party != 'R' AND 'D';
sqlite> .quit
