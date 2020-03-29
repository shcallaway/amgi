CREATE TABLE card(
  id SERIAL PRIMARY KEY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  due_on TIMESTAMP NOT NULL DEFAULT NOW(),
  created_on TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE collection(
  id SERIAL PRIMARY KEY,
  name VARCHAR(500),
  created_on TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE card_collection(
  card_id INTEGER NOT NULL,
  collection_id INTEGER NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT NOW(),
  PRIMARY KEY (card_id, collection_id),
  CONSTRAINT card_collection_card_id_fkey FOREIGN KEY (card_id) REFERENCES card (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT card_collection_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES collection (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE attempt(
  id SERIAL PRIMARY KEY,
  card_id INTEGER NOT NULL,
  correct BOOLEAN NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT NOW(),
  CONSTRAINT attempt_card_id_fkey FOREIGN KEY (card_id) REFERENCES card (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Create some dummy cards
INSERT INTO
  card (question, answer)
VALUES
  ('What is the capital of Alabama?', 'Montgomery'),
  ('What is the capital of Alaska?', 'Juneau'),
  ('What is the capital of Arizona?', 'Phoenix'),
  ('What is the capital of Arkansas?', 'Little Rock'),
  ('What is the capital of California?', 'Sacramento'),
  ('What is the capital of Colorado?', 'Denver'),
  ('What is the capital of Connecticut?', 'Hartford'),
  ('What is the capital of Delaware?', 'Dover'),
  ('What is the capital of Florida?', 'Tallahassee'),
  ('What is the capital of Georgia?', 'Atlanta'),
  ('What is the capital of Hawaii?', 'Honolulu'),
  ('What is the capital of Idaho?', 'Boise'),
  ('What is the capital of Illinois?', 'Springfield'),
  ('What is the capital of Indiana?', 'Indianapolis'),
  ('What is the capital of Iowa?', 'Des Moines'),
  ('What is the capital of Kansas?', 'Topeka'),
  ('What is the capital of Kentucky?', 'Frankfort'),
  ('What is the capital of Louisiana?', 'Baton Rouge'),
  ('What is the capital of Maine?', 'Augusta'),
  ('What is the capital of Maryland?', 'Annapolis'),
  ('What is the capital of Massachusetts?', 'Boston'),
  ('What is the capital of Michigan?', 'Lansing'),
  ('What is the capital of Minnesota?', 'Saint Paul'),
  ('What is the capital of Mississippi?', 'Jackson'),
  ('What is the capital of Missouri?', 'Jefferson City'),
  ('What is the capital of Montana?', 'Helena'),
  ('What is the capital of Nebraska?', 'Lincoln'),
  ('What is the capital of Nevada?', 'Carson City'),
  ('What is the capital of New Hampshire?', 'Concord'),
  ('What is the capital of New Jersey?', 'Trenton'),
  ('What is the capital of New Mexico?', 'Santa Fe'),
  ('What is the capital of New York?', 'Albany'),
  ('What is the capital of North Carolina?', 'Raleigh'),
  ('What is the capital of North Dakota?', 'Bismarck'),
  ('What is the capital of Ohio?', 'Columbus'),
  ('What is the capital of Oklahoma?', 'Oklahoma City'),
  ('What is the capital of Oregon?', 'Salem'),
  ('What is the capital of Pennsylvania?', 'Harrisburg'),
  ('What is the capital of Rhode Island?', 'Providence'),
  ('What is the capital of South Carolina?', 'Columbia'),
  ('What is the capital of South Dakota?', 'Pierre'),
  ('What is the capital of Tennessee?', 'Nashville'),
  ('What is the capital of Texas?', 'Austin'),
  ('What is the capital of Utah?', 'Salt Lake City'),
  ('What is the capital of Vermont?', 'Montpelier'),
  ('What is the capital of Virginia?', 'Richmond'),
  ('What is the capital of Washington?', 'Olympia'),
  ('What is the capital of West Virginia?', 'Charleston'),
  ('What is the capital of Wisconsin?', 'Madison'),
  ('What is the capital of Wyoming?', 'Cheyenne'),
  ('Montgomery is the capital of what state?', 'Alabama'),
  ('Juneau is the capital of what state?', 'Alaska'),
  ('Phoenix is the capital of what state?', 'Arizona'),
  ('Little Rock is the capital of what state?', 'Arkansas'),
  ('Sacramento is the capital of what state?', 'California'),
  ('Denver is the capital of what state?', 'Colorado'),
  ('Hartford is the capital of what state?', 'Connecticut'),
  ('Dover is the capital of what state?', 'Delaware'),
  ('Tallahassee is the capital of what state?', 'Florida'),
  ('Atlanta is the capital of what state?', 'Georgia'),
  ('Honolulu is the capital of what state?', 'Hawaii'),
  ('Boise is the capital of what state?', 'Idaho'),
  ('Springfield is the capital of what state?', 'Illinois'),
  ('Indianapolis is the capital of what state?', 'Indiana'),
  ('Des Moines is the capital of what state?', 'Iowa'),
  ('Topeka is the capital of what state?', 'Kansas'),
  ('Frankfort is the capital of what state?', 'Kentucky'),
  ('Baton Rouge is the capital of what state?', 'Louisiana'),
  ('Augusta is the capital of what state?', 'Maine'),
  ('Annapolis is the capital of what state?', 'Maryland'),
  ('Boston is the capital of what state?', 'Massachusetts'),
  ('Lansing is the capital of what state?', 'Michigan'),
  ('Saint Paul is the capital of what state?', 'Minnesota'),
  ('Jackson is the capital of what state?', 'Mississippi'),
  ('Jefferson City is the capital of what state?', 'Missouri'),
  ('Helena is the capital of what state?', 'Montana'),
  ('Lincoln is the capital of what state?', 'Nebraska'),
  ('Carson City is the capital of what state?', 'Nevada'),
  ('Concord is the capital of what state?', 'New Hampshire'),
  ('Trenton is the capital of what state?', 'New Jersey'),
  ('Santa Fe is the capital of what state?', 'New Mexico'),
  ('Albany is the capital of what state?', 'New York'),
  ('Raleigh is the capital of what state?', 'North Carolina'),
  ('Bismarck is the capital of what state?', 'North Dakota'),
  ('Columbus is the capital of what state?', 'Ohio'),
  ('Oklahoma City is the capital of what state?', 'Oklahoma'),
  ('Salem is the capital of what state?', 'Oregon'),
  ('Harrisburg is the capital of what state?', 'Pennsylvania'),
  ('Providence is the capital of what state?', 'Rhode Island'),
  ('Columbia is the capital of what state?', 'South Carolina'),
  ('Pierre is the capital of what state?', 'South Dakota'),
  ('Nashville is the capital of what state?', 'Tennessee'),
  ('Austin is the capital of what state?', 'Texas'),
  ('Salt Lake City is the capital of what state?', 'Utah'),
  ('Montpelier is the capital of what state?', 'Vermont'),
  ('Richmond is the capital of what state?', 'Virginia'),
  ('Olympia is the capital of what state?', 'Washington'),
  ('Charleston is the capital of what state?', 'West Virginia'),
  ('Madison is the capital of what state?', 'Wisconsin'),
  ('Cheyenne is the capital of what state?', 'Wyoming');

-- Create a collection
INSERT INTO
  collection (name)
VALUES
  ('U.S. Sate Capitals');

-- Create card-collection association for each of the U.S. State Capitals cards
INSERT INTO card_collection (card_id, collection_id) SELECT id, (SELECT id FROM collection WHERE name = 'U.S. Sate Capitals') FROM card;

-- List all cards with collection names
SELECT question, answer, name AS collection_name FROM card INNER JOIN card_collection ON (card.id = card_collection.card_id) INNER JOIN collection ON (collection.id = card_collection.collection_id);

-- Insert some dummy attempts into the attempt table
INSERT INTO attempt (card_id, correct) VALUES ((SELECT id FROM card LIMIT 1), FALSE);
INSERT INTO attempt (card_id, correct) VALUES ((SELECT id FROM card LIMIT 1), TRUE);

-- Get the most recent attempt for a given card id
SELECT card_id, created_on, correct FROM attempt WHERE created_on IN (SELECT MAX(created_on) FROM attempt GROUP BY card_id);

-- List all cards with latest attempt and attempt result, if any
SELECT card.id, question, answer, attempt.created_on AS last_attempted, attempt.correct FROM card LEFT JOIN attempt ON (card.id = attempt.card_id) WHERE attempt.created_on IN (SELECT MAX(created_on) FROM attempt GROUP BY card_id) OR attempt.id IS NULL;

-- Create a trigger to update card.due_on whenever an attempt is created
CREATE OR REPLACE FUNCTION update_card_due_on() RETURNS TRIGGER AS $BODY$
  BEGIN
    IF NEW.correct IS TRUE THEN
      UPDATE card SET due_on = ('now'::TIMESTAMP + '1 day'::INTERVAL) WHERE id = NEW.card_id;
    END IF;
    RETURN NEW;
  END;
$BODY$ language plpgsql;

CREATE TRIGGER update_card_due_on AFTER INSERT ON attempt FOR EACH ROW EXECUTE PROCEDURE update_card_due_on();

-- List cards that are due
SELECT * FROM card WHERE due_on <= NOW();
