USE database;

-- Create a test table
CREATE TABLE IF NOT EXISTS kader (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    flaschen INT,
    musikbox INT,
    bälle INT,
    jacken INT,
    tunnel INT
);

-- Insert some sample data
INSERT INTO kader (name, flaschen, musikbox, bälle, jacken, tunnel) VALUES
    ('Boy Bröckler', 0, 0, 0, 0, 0),
    ('Dominic Günther', 0, 0, 0, 0, 0),
    ('Fabian Lehmann', 0, 0, 0, 0, 0),
    ('Falk Jörns-Anders', 0, 0, 0, 0, 0),
    ('Finn Bargiel', 0, 0, 0, 0, 0),
    ('Hauke Güntrath-Lorenzen', 0, 0, 0, 0, 0),
    ('Jakob Lange', 0, 0, 0, 0, 0),
    ('Jan Lindhorst', 0, 0, 0, 0, 0),
    ('Jan Pohlke', 0, 0, 0, 0, 0),
    ('Joe Hoffmann', 0, 0, 0, 0, 0),
    ('Kevin Raabe', 0, 0, 0, 0, 0),
    ('Kim Bischoff', 0, 0, 0, 0, 0),
    ('Kjell Boiesen', 0, 0, 0, 0, 0),
    ('Lasse Assenheimer', 0, 0, 0, 0, 0),
    ('Lasse Petersen', 0, 0, 0, 0, 0),
    ('Mads Möller', 0, 0, 0, 0, 0),
    ('Malte Klang', 0, 0, 0, 0, 0),
    ('Mattes Nissen', 0, 0, 0, 0, 0),
    ('Mick Degering', 0, 0, 0, 0, 0),
    ('Nik Plöger', 0, 0, 0, 0, 0),
    ('Ole Kreuter', 0, 0, 0, 0, 0),
    ('Patrick Arndt', 0, 0, 0, 0, 0),
    ('Paul Pompetzki', 0, 0, 0, 0, 0),
    ('Peer Hoffmann', 0, 0, 0, 0, 0),
    ('Steffen Schmück', 0, 0, 0, 0, 0),
    ('Stephan Wendel', 0, 0, 0, 0, 0),
    ('Sven Andresen', 0, 0, 0, 0, 0),
    ('Tade Bendsen', 0, 0, 0, 0, 0),
    ('Thies Freese', 0, 0, 0, 0, 0),
    ('Thomas Erichsen', 0, 0, 0, 0, 0),
    ('Thomas Schulz', 0, 0, 0, 0, 0),
    ('Tim Hinrichsen', 0, 0, 0, 0, 0),
    ('Timo Stroschein', 0, 0, 0, 0, 0),
    ('Tjark Stroschein', 0, 0, 0, 0, 0),
    ('Tobi Kufer', 0, 0, 0, 0, 0),
    ('Yannik Mahler', 0, 0, 0, 0, 0);

    CREATE TABLE IF NOT EXISTS spieltag (
        spielerId INT NOT NULL UNIQUE,
        FOREIGN KEY (spielerID) REFERENCES kader(id)
    );

    CREATE TABLE IF NOT EXISTS training (
        spielerId INT NOT NULL UNIQUE,
        FOREIGN KEY (spielerID) REFERENCES kader(id)
    );