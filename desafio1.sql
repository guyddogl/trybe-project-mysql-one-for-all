CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`plans` (`name`, `value`)
VALUES ('gratuito', 0), ('universitário', 5.99), ('pessoal', 6.99), ('familiar', 7.99);

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `plan` int NOT NULL,
  `subscribe_date` date NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plan`) REFERENCES SpotifyClone.plans(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`users` (`name`, `age`, `plan`, `subscribe_date`)
VALUES ('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 4, '2017-12-30'),
('Martin Fowler', 46, 4, '2017-01-17'),
('Sandi Metz', 58, 4, '2018-04-29'),
('Paulo Freire', 19, 2, '2018-02-14'),
('Bell Hooks', 26, 2, '2018-01-05'),
('Christopher Alexander', 85, 3, '2019-06-05'),
('Judith Butler', 45, 3, '2020-05-13'),
('Jorge Amado', 58, 3, '2017-02-17');
	
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`artists` (`name`)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

CREATE TABLE `albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artist`) REFERENCES SpotifyClone.artists(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`albums` (`name`, `artist`)
VALUES ('Renaissance', 1), ('Jazz', 2), ('Hot Space', 2), ('Falso Brilhante', 3), ('Vento de Maio', 3), ('QVVJFA?', 4), ('Somewhere Far Beyond', 5), ('I Put A Spell On You', 6);

CREATE TABLE `songs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` int NOT NULL,
  `artist` int NOT NULL,
  `album` int NOT NULL,
  `release` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artist`) REFERENCES SpotifyClone.artists(`id`),
  FOREIGN KEY (`album`) REFERENCES SpotifyClone.albums(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`songs` (`name`, `length`, `artist`, `album`, `release`)
VALUES ('BREAK MY SOUL', 279, 1, 1, 2022),
('VIRGO’S GROOVE', 369, 1, 1, 2022),
('ALIEN SUPERSTAR', 116, 1, 1, 2022),
('Don’t Stop Me Now', 203, 2, 2, 1978),
('Under Pressure', 152, 2, 3, 1982),
('Como Nossos Pais', 105, 3, 4, 1998),
('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5, 1998),
('Samba em Paris', 267, 4, 6, 2003),
('The Bard’s Song', 244, 5, 7, 2007),
('Feeling Good', 100, 6, 8, 2012);

CREATE TABLE `historic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `song` int NOT NULL,
  `reproduction_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`, `user`, `song`),
  FOREIGN KEY (`user`) REFERENCES SpotifyClone.users(`id`),
  FOREIGN KEY (`song`) REFERENCES SpotifyClone.songs(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`historic` (`user`, `song`, `reproduction_date`)
VALUES (1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');

CREATE TABLE `following` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `artist` int NOT NULL,
  PRIMARY KEY (`id`,  `user`, `artist`),
  FOREIGN KEY (`user`) REFERENCES SpotifyClone.users(`id`),
  FOREIGN KEY (`artist`) REFERENCES SpotifyClone.artists(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO SpotifyClone.`following` (`user`, `artist`)
VALUES (1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 6),
(9, 3),
(10, 2);