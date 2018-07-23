CREATE DATABASE xeq;
USE xeq;

CREATE TABLE player
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nick VARCHAR (15) NOT NULL UNIQUE,
	email VARCHAR (30) NOT NULL UNIQUE,
	password VARCHAR (64) NOT NULL,
	image VARCHAR (10) NOT NULL,
	online BOOLEAN NOT NULL
);

CREATE TABLE game
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (30) NOT NULL UNIQUE,
	min_players INT (3) NOT NULL,
	max_players INT (3) NOT NULL,
	image VARCHAR (10) NOT NULL
);

CREATE TABLE friends
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	state INT (2) NOT NULL,
	player1_id INT UNSIGNED NOT NULL,
	player2_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (player1_id) REFERENCES player (id),
	FOREIGN KEY (player2_id) REFERENCES player (id)
);

CREATE TABLE challenge
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	state INT (2) NOT NULL,
	player1_id INT UNSIGNED NOT NULL,
	player2_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (player1_id) REFERENCES player (id),
	FOREIGN KEY (player2_id) REFERENCES player (id)
);

CREATE TABLE play
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	stars INT NOT NULL,
	game_id INT UNSIGNED NOT NULL,
	player_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (player_id) REFERENCES player (id),
	FOREIGN KEY (game_id) REFERENCES game (id)
);
