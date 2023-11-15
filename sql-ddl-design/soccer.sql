DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    begin_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    season_id INTEGER NOT NULL REFERENCES seasons
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games,
    player_id INTEGER REFERENCES players,
    scored_at TIMESTAMP NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    game_id INTEGER REFERENCES games
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams
);
