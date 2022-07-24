# GAMEGTA2019

[![sampctl](https://shields.southcla.ws/badge/sampctl-GAMEGTA2019-2f2f2f.svg?style=for-the-badge)](https://github.com/ting504/gtavlc-summer)

## Error Code
- 001: Zero Amount.

## TODO
- [x] Shop toy chỉ giành cho VIP

## DONE
- [x] Remove Premium Account
- [x] Inventory system
- [x] change total vehicle slots, if player is vip, increase 2
- [x] if player is vip, house object is 100 (normal is 50)
- [x] vip can buy firework
- [x] vip increase 1 more exp every 5 hours played
- [x] vip has different car plate color, nick-color when /b
- [x] vip has access /pcolor

## Add
Deer Hunter, Shipper, Quarry Worker, Firefighter, Tram Driver, Bus Driver

```SQL
CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Type` text NOT NULL,
  `Status` int(11) NOT NULL,
  `Priority` text NOT NULL,
  `Description` text NOT NULL,
  `Date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ID`);

  ALTER TABLE `tickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

CREATE TABLE `tickets-comments` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Text` text NOT NULL,
  `Date` int(11) NOT NULL,
  `TicketID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `tickets-comments`
  ADD PRIMARY KEY (`ID`);
  ALTER TABLE `tickets-comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
```

```sql
  DELETE FROM `gtavlc`.`jobs` WHERE  `ID`=16;
  INSERT INTO `gtavlc`.`jobs` (`ID`, `Name`, `NeedLevel`, `PosX`, `PosY`, `PosZ`, `Legal`, `Skill1Veh`, `Skill2Veh`, `Skill3Veh`, `Skill4Veh`, `Skill5Veh`, `Skill6Veh`) VALUES ('16', 'Deer Hunter', '1', '-1639.97', '-2247.41', '31.4766', '1', '422', '422', '422', '422', '422', '422');

```



