-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Värd: localhost:3306
-- Tid vid skapande: 03 dec 2023 kl 09:17
-- Serverversion: 5.7.24
-- PHP-version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `monster_hunters`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `items`
--

CREATE TABLE `items` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(25) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `items`
--

INSERT INTO `items` (`itemId`, `itemName`, `description`) VALUES
(1, 'Dragonbone Shield', 'The Dragonbone Shield, a legendary artifact forged in the heart of dragonfire, crafted from the colossal bones of a mighty dragon.'),
(2, 'Starforged Longsword', 'This longsword isn\'t just for show; it\'s a masterfully made tool for precision strikes. With every swing, you\'ll feel the power of the stars behind you, cutting through anything in your way.'),
(3, 'Runic Healing Potion', 'Whether in the midst of battle or recovering from an arduous journey, the Runic Healing Potion is a reliable ally, harnessing the power of ancient runes to restore health and vitality.'),
(4, 'Crystal Dagger', 'Wielding this dagger, you feel the harmonious balance between beauty and deadly functionality, making it a favored choice for those who appreciate both finesse and potency in their weaponry.'),
(5, 'Golden Griffin Boots', 'Beyond their ornate appearance, these boots provide unparalleled comfort and support, making them the ideal choice for adventurers navigating diverse terrains.');

-- --------------------------------------------------------

--
-- Tabellstruktur `monsters`
--

CREATE TABLE `monsters` (
  `monsterId` int(11) NOT NULL,
  `monsterName` varchar(25) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `skill` int(11) NOT NULL,
  `description` text,
  `health` int(11) NOT NULL,
  `strength` int(11) NOT NULL,
  `alive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `monsters`
--

INSERT INTO `monsters` (`monsterId`, `monsterName`, `roomId`, `skill`, `description`, `health`, `strength`, `alive`) VALUES
(1, 'Obsidianflame Dragoon', NULL, 76, 'The Obsidianflame Dragoon is a tough beast with black scales and fiery embers. Its big wings let it soar gracefully through the shadows. Watch out for its burning eyes.', 82, 76, 1),
(2, 'Thunderhoof Minotaur', NULL, 27, 'The Thunderhoof Minotaur is a massive creature with the head of a bull and a body covered in electrified fur. Its imposing presence is matched by its muscular build, and its hooves create thunderous echoes with each step. Armed with a giant battle axe, this creature embodies raw power and primal strength.', 43, 47, 1),
(3, 'Frostbite Biter', NULL, 13, 'The Frostbite Biter is a chilly foe, covered in shimmering ice-like scales. With sharp fangs, it delivers bites that bring a bitter cold. Found in wintry landscapes, encountering this creature means feeling the freezing breath in the air.', 63, 77, 1),
(4, 'Grizzlepaw', NULL, 31, 'Grizzlepaw, a fearsome creature, possesses a rugged and untamed appearance. With fur as coarse as the bark of ancient trees, this beast is known for its powerful swipes and mighty roars.', 51, 69, 1),
(5, 'Venomspike', NULL, 49, 'The Venomspike, a menacing creature, is covered in sharp spikes and sleek, venomous scales. It strikes with precision, injecting a potent venom into its prey. This silent predator roams in shadows, a reminder of the dangers lurking in the world\'s darker corners.', 64, 26, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `monster_inventories`
--

CREATE TABLE `monster_inventories` (
  `monsterId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `monster_inventories`
--

INSERT INTO `monster_inventories` (`monsterId`, `itemId`, `quantity`) VALUES
(1, 1, 4),
(2, 3, 1),
(3, 5, 3),
(4, 4, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `monster_types`
--

CREATE TABLE `monster_types` (
  `monsterName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `monster_types`
--

INSERT INTO `monster_types` (`monsterName`) VALUES
('Frostbite Biter'),
('Grizzlepaw'),
('Obsidianflame Dragoon'),
('Thunderhoof Minotaur'),
('Venomspike');

-- --------------------------------------------------------

--
-- Tabellstruktur `players`
--

CREATE TABLE `players` (
  `playerId` int(11) NOT NULL,
  `playerName` varchar(25) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `skill` int(11) NOT NULL,
  `description` text,
  `health` int(11) NOT NULL,
  `strength` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `alive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `players`
--

INSERT INTO `players` (`playerId`, `playerName`, `roomId`, `skill`, `description`, `health`, `strength`, `points`, `alive`) VALUES
(1, 'Nightshade Assassin', NULL, 77, 'The Nightshade Assassin is a master of shadows, moving silently and striking with lethal precision. Cloaked in dark attire, this elusive character navigates the terrain unnoticed, leaving only a trail of shadows in their wake. Armed with twin blades infused with a poisonous touch, the Nightshade Assassin is a formidable adversary in the art of stealth and cunning.', 51, 69, 0, 1),
(2, 'Frostbound Nomad', NULL, 59, 'The Frostbound Nomad, draped in icy garments, traverses the frozen landscapes with resilience. Carrying a staff that channels the power of frost, this nomadic character commands the chill of the tundra. With each step, frosty footprints mark their journey, and an aura of wintry majesty surrounds the Frostbound Nomad.', 73, 51, NULL, 1),
(3, 'Thunderstorm Paladin', NULL, 76, 'Clad in gleaming armor adorned with storm motifs, the Thunderstorm Paladin is a righteous force on the battlefield. Wielding a mighty hammer that crackles with lightning, this stalwart character is a symbol of divine justice. In the midst of tumultuous battles, the Thunderstorm Paladin stands unwavering, a beacon of strength and protection.', 65, 61, 40, 1),
(4, 'Phoenix Fury', NULL, 63, 'The Phoenix Fury is a fiery warrior, ablaze with the power of a phoenix. Dressed in vibrant red and gold hues, this character embodies the relentless flames of rebirth. With a weapon that flickers like eternal embers, the Phoenix Fury charges into the fray, leaving a trail of fiery devastation and embodying the spirit of the mythical phoenix.', 78, 61, NULL, 1),
(5, 'Runeblade Sentinel', NULL, 74, 'The Runeblade Sentinel, adorned with arcane symbols, is a guardian of ancient knowledge and mystical prowess. Carrying a blade inscribed with powerful runes, this character serves as a sentinel against dark forces. The glow of enchanted runes illuminates their path, and the Runeblade Sentinel\'s unwavering dedication to the arcane arts is a beacon of magical might.', 66, 61, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `player_inventories`
--

CREATE TABLE `player_inventories` (
  `playerId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `player_inventories`
--

INSERT INTO `player_inventories` (`playerId`, `itemId`, `quantity`) VALUES
(1, 1, 4),
(2, 3, 1),
(3, 5, 3),
(4, 4, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `rooms`
--

CREATE TABLE `rooms` (
  `roomId` int(11) NOT NULL,
  `roomName` varchar(255) DEFAULT NULL,
  `description` text,
  `serverId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `rooms`
--

INSERT INTO `rooms` (`roomId`, `roomName`, `description`, `serverId`) VALUES
(1, 'Frostfall Chamber', 'The Frostfall Chamber is a serene yet icy sanctuary, adorned with crystalline formations that glisten in the soft light. Frozen breath hangs in the air as the room emanates a tranquil chill. In the center lies a frost-encased pedestal, surrounded by delicate snowflakes dancing in a perpetual winter breeze. This chamber is a haven of frosty beauty, a place where the cold embraces without biting.', NULL),
(2, 'Shadowrealm Nexus', 'The Shadowrealm Nexus is a mysterious convergence of shadows and ethereal energy. Dark tendrils weave through the air, creating intricate patterns that seem to shift and pulse. The room is cloaked in an otherworldly gloom, with occasional glimpses of shadowy figures moving silently along the edges. It\'s a place where the boundaries between realms blur, and the mysteries of the shadow unfold.', NULL),
(3, 'Thunderforge Sanctum', 'The Thunderforge Sanctum is a grand hall resonating with the echoes of thunderstorms. Massive anvils and forges line the walls, each hammer strike reverberating like distant thunder. In the center stands a colossal forge, flames dancing with electric sparks. The air is charged with the scent of molten metal. This sanctum is a testament to the artistry of thunder, where weapons of celestial might are crafted.', NULL),
(4, 'Celestial Observatory', 'The Celestial Observatory is a celestial haven atop a towering spire. Crystal-clear telescopes and celestial charts adorn the room, offering panoramic views of starlit skies. Soft celestial melodies fill the air as constellations come to life overhead. This observatory is a place of cosmic reflection, where the wonders of the universe unfold in mesmerizing detail.', NULL),
(5, 'Embercrypt Catacombs', 'The Embercrypt Catacombs are a labyrinthine network of ancient passageways, illuminated by the flickering glow of eternal embers. Stone sarcophagi line the crypts, each bearing the mark of fiery runes. Eerie whispers echo through the halls, and the air is thick with the scent of smoldering embers. These catacombs are a realm where the departed find eternal rest in the warmth of ember-lit darkness.', NULL),
(6, 'Lunar Haven', 'Lunar Haven, a calm room softly lit by the moon. Serene murals decorate the walls, and silver plants create gentle shadows. Celestial orbs above emit a soothing glow, making it a peaceful retreat in the world.', NULL);

-- --------------------------------------------------------

--
-- Tabellstruktur `room_inventories`
--

CREATE TABLE `room_inventories` (
  `roomId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `room_inventories`
--

INSERT INTO `room_inventories` (`roomId`, `itemId`, `quantity`) VALUES
(1, 1, 4),
(2, 3, 1),
(3, 5, 3),
(4, 4, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `servers`
--

CREATE TABLE `servers` (
  `serverId` int(11) NOT NULL,
  `ipAdress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `servers`
--

INSERT INTO `servers` (`serverId`, `ipAdress`) VALUES
(1, '256.165.88.666.54');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`);

--
-- Index för tabell `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`monsterId`),
  ADD KEY `monsterName` (`monsterName`),
  ADD KEY `roomId` (`roomId`);

--
-- Index för tabell `monster_inventories`
--
ALTER TABLE `monster_inventories`
  ADD KEY `monsterId` (`monsterId`),
  ADD KEY `itemId` (`itemId`);

--
-- Index för tabell `monster_types`
--
ALTER TABLE `monster_types`
  ADD PRIMARY KEY (`monsterName`);

--
-- Index för tabell `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`playerId`),
  ADD UNIQUE KEY `playerName` (`playerName`),
  ADD KEY `roomId` (`roomId`);

--
-- Index för tabell `player_inventories`
--
ALTER TABLE `player_inventories`
  ADD KEY `playerId` (`playerId`),
  ADD KEY `itemId` (`itemId`);

--
-- Index för tabell `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomId`),
  ADD KEY `serverId` (`serverId`);

--
-- Index för tabell `room_inventories`
--
ALTER TABLE `room_inventories`
  ADD KEY `itemId` (`itemId`),
  ADD KEY `roomId` (`roomId`);

--
-- Index för tabell `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`serverId`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `items`
--
ALTER TABLE `items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT för tabell `monsters`
--
ALTER TABLE `monsters`
  MODIFY `monsterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT för tabell `players`
--
ALTER TABLE `players`
  MODIFY `playerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT för tabell `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT för tabell `servers`
--
ALTER TABLE `servers`
  MODIFY `serverId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `monsters`
--
ALTER TABLE `monsters`
  ADD CONSTRAINT `monsters_ibfk_1` FOREIGN KEY (`monsterName`) REFERENCES `monster_types` (`monsterName`),
  ADD CONSTRAINT `monsters_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomId`);

--
-- Restriktioner för tabell `monster_inventories`
--
ALTER TABLE `monster_inventories`
  ADD CONSTRAINT `monster_inventories_ibfk_1` FOREIGN KEY (`monsterId`) REFERENCES `monsters` (`monsterId`),
  ADD CONSTRAINT `monster_inventories_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`);

--
-- Restriktioner för tabell `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomId`);

--
-- Restriktioner för tabell `player_inventories`
--
ALTER TABLE `player_inventories`
  ADD CONSTRAINT `player_inventories_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`),
  ADD CONSTRAINT `player_inventories_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`);

--
-- Restriktioner för tabell `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`serverId`) REFERENCES `servers` (`serverId`);

--
-- Restriktioner för tabell `room_inventories`
--
ALTER TABLE `room_inventories`
  ADD CONSTRAINT `room_inventories_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`),
  ADD CONSTRAINT `room_inventories_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `rooms` (`roomId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
