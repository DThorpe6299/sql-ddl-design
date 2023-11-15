DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text_content TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    location VARCHAR(255),
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

