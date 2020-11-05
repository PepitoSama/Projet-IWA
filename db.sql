DROP DATABASE IF EXISTS covid_alert;
CREATE DATABASE covid_alert;

\c covid_alert;

CREATE TABLE users(
    user_id serial NOT NULL PRIMARY KEY,
    pseudo_user varchar(30) NOT NULL,
    password_user varchar(100) NOT NULL
);

CREATE TABLE geolocation(
    user_id serial NOT NULL REFERENCES users (user_id),
    geolocation_timestamp timestamp without time zone NOT NULL,
    latitude numeric(18, 16) NOT NULL,
    longitude numeric(18, 16) NOT NULL,
    PRIMARY KEY(user_id, geolocation_timestamp)
);

CREATE TABLE infected(
    user_id integer NOT NULL REFERENCES users (user_id),
    date_start_infected timestamp without time zone NOT NULL,
    date_end_infected timestamp without time zone,
    contact boolean,
    PRIMARY KEY(user_id, date_start_infected)
);

CREATE TABLE alert (
    user_alerted_id serial NOT NULL REFERENCES users (user_id),
    user_infected_id serial NOT NULL REFERENCES users (user_id),
    date_alert timestamp without time zone,
    PRIMARY KEY(user_alerted_id, user_infected_id, date_alert)
);


