-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Ápr 30. 16:30
-- Kiszolgáló verziója: 10.1.31-MariaDB
-- PHP verzió: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `infsysbuild`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `clients`
--

CREATE TABLE `clients` (
  `Nev` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Telefon` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Szig_szam` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Lakcim` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Id` int(11) NOT NULL,
  `Aktiv` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `clients`
--

INSERT INTO `clients` (`Nev`, `Telefon`, `Szig_szam`, `Lakcim`, `Id`, `Aktiv`) VALUES
('Ferenczi Péter', '06 70 450-12-18', '968874ER', '8875 Cegléd Szilva utca 10.', 1, 1),
('Kotlai János', '06 20 598-15-99', '854447PP', '1855 Budapest Váci út 58.', 2, 1),
('Drótos Nikoletta', '06 30 485-19-17', '844152OL', '9482 Békéscsaba Szigeti út 102/B', 3, 1),
('Karcagi Bálint', '06 70 258-88-20', '594128DR', '7100 Szeged Csabai tér 18.', 4, 1),
('Hugyecz Jakab', '06 70 635-84-77', '194783PL', '9122 Békéscsaba Váradi tér 44.', 5, 1),
('Magyar Viktor', '06 70 859-48-13', '485619PP', '3588 Tápiószentmárton Mária út 88.', 6, 1),
('Dereg Anna', '06 30 485-17-99', '881476AD', '7260 Sopron Béke út 28.', 7, 1),
('Kispál Mihály', '06 20 745-18-33', '364851KK', '2100 Gödöllő Réti út 45.', 8, 1),
('Jakab Szilvia', '06 70 849-18-55', '548712ZT', '2754 Szolnok Jázmin utca 33.', 9, 1),
('Kis Katalin', '06 30 547-88-42', '254871HH', '2199 Kecskemét Igazak útja 66.', 10, 1),
('Nagy Pál', '06 30 413-94-78', '458712LL', '5555 Győr Béke tér 103/B', 11, 1),
('Hajnal Róbert Dávid', '06 20 894-47-85', '258899SA', '2711 Tápiószentmárton Szelei út 22/B', 12, 1),
('Lakatos Mihály', '06 20 987-41-52', '259987PD', '2054 Vácszentlászló Petőfi út 8.', 13, 1),
('Csongor Ábrahám', '06 70 523-94-88', '658419ER', '2588 Gödöllő Sápi út 87.', 14, 1),
('Péteri Bernadett', '06 20 994-58-74', '197348TR', '2800 Pilis Alma utca 13.', 15, 1),
('Győrfi Pál', '06 30 884-71-48', '194785ER', '1888 Budapest Deák tér 108.', 16, 1),
('Váradi Péter Titusz', '06 30 597-45-12', '254885RF', '2548 Békéscsaba Határ út 33.', 17, 1),
('Szabó Gergely', '06 30 589-47-55', '568475DD', '2143 Kistarcsa Liliom utca 77.', 18, 1),
('Veres Péter Csaba', '06 30 589-47-55', '598455LL', '9688 Miskolc Csabai kapu 102.', 19, 1),
('Gáspárfalvi Jázmin', '06 20 987-45-12', '254871KL', '2600 Pécs Vértes út 88.', 20, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movies`
--

CREATE TABLE `movies` (
  `Id` int(11) NOT NULL,
  `Cim` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Datum` date NOT NULL,
  `Sorszam` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Tipus` varchar(512) COLLATE utf8_hungarian_ci NOT NULL,
  `Status` varchar(512) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `movies`
--

INSERT INTO `movies` (`Id`, `Cim`, `Datum`, `Sorszam`, `Tipus`, `Status`) VALUES
(1, '1408: A szellemjárta hotelszoba', '2019-06-11', '001', 'VHS', 'Rented'),
(2, 'Biciklitolvajok', '1945-12-20', '002', 'DVD', 'Available'),
(3, '28 nappal később', '2002-07-19', '003', 'DVD', 'Available'),
(4, 'Phillips kapitány', '2013-04-05', '004', 'VHS', 'Rented'),
(5, 'Rémálom az Elm utcában', '1984-02-18', '005', 'DVD', 'Available'),
(6, 'Conan, a barbár', '1982-01-30', '006', 'VHS', 'Available'),
(7, '300', '2006-01-06', '007', 'DVD', 'Available'),
(8, 'Utódomra ütök', '2018-01-01', '088', 'DVD', 'Rented'),
(9, 'Igazából szerelem', '2003-10-08', '009', 'DVD', 'Rented'),
(10, 'Warcraft: A kezdetek', '2019-04-01', '010', 'DVD', 'Available'),
(11, 'Tyler Rake: A kimenekítés', '2020-04-15', '011', 'VHS', 'Rented'),
(12, 'West Side Story', '1961-02-27', '012', 'DVD', 'Selejtezett'),
(13, 'Vissza a jövőbe 2.', '1989-02-17', '013', 'VHS', 'Available'),
(14, 'Porunk hőse', '1983-08-17', '014', 'DVD', 'Rented'),
(15, 'King Kong', '1933-06-19', '015', 'VHS', 'Selejtezett'),
(16, 'Jöjj és lásd!', '1985-04-22', '016', 'DVD', 'Available'),
(17, 'Battle Royale', '2000-12-06', '017', 'DVD', 'Available'),
(18, 'Denevérember', '1989-03-15', '018', 'DVD', 'Available'),
(19, 'Prometheus', '2002-04-16', '019', 'DVD', 'Available'),
(20, 'Az acélember', '2013-09-12', '020', 'DVD', 'Available');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `renting`
--

CREATE TABLE `renting` (
  `Id` int(11) NOT NULL,
  `ClientId` int(11) NOT NULL,
  `MoviesId` int(11) NOT NULL,
  `Kezdes` date NOT NULL,
  `Lejarat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `renting`
--

INSERT INTO `renting` (`Id`, `ClientId`, `MoviesId`, `Kezdes`, `Lejarat`) VALUES
(22, 1, 11, '2020-04-30', '2020-05-14'),
(23, 1, 8, '2020-04-30', '2020-05-14'),
(24, 1, 4, '2020-04-30', '2020-05-14'),
(25, 10, 9, '2020-04-30', '2020-05-14'),
(26, 10, 1, '2020-04-30', '2020-05-14'),
(27, 9, 14, '2020-04-30', '2020-05-14');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `renting`
--
ALTER TABLE `renting`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ClientId` (`ClientId`),
  ADD KEY `MoviesId` (`MoviesId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `clients`
--
ALTER TABLE `clients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `movies`
--
ALTER TABLE `movies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `renting`
--
ALTER TABLE `renting`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `renting`
--
ALTER TABLE `renting`
  ADD CONSTRAINT `renting_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`Id`),
  ADD CONSTRAINT `renting_ibfk_2` FOREIGN KEY (`MoviesId`) REFERENCES `movies` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
