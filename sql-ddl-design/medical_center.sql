DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE patients (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE visit (
    id INTEGER PRIMARY KEY,
    visit_date DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL
);

CREATE TABLE diagnosis (
    id INTEGER PRIMARY KEY,
    visit_id INTEGER NOT NULL
);

CREATE TABLE diseases (
    id INTEGER PRIMARY KEY,
    disease_name TEXT NOT NULL,
    diagnosis_id INTEGER REFERENCES diagnosis
);




