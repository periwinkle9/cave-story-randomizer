function weapon(t)
  assert(t.name and t.map and t.id)
  local ammo = t.ammo or "0000"
  local names = t.name
  if type(names) == 'string' then
    names = {names}
  end
  local getText = {}
  for _, name in ipairs(names) do
    table.insert(getText, ("Got the =%s=!<WAI0160<NOD"):format(name))
  end
  return {
    name = names[1],
    map = t.map,
    getText = getText,
    command = ("<AM+00%s:%s"):format(t.id, ammo),
    displayCmd = ("<GIT00%s"):format(t.id),
    music = "<CMU0010",
    kind = "weapon",
  }
end

function lifeCapsule(t)
  assert(t.hp and t.map)
  return {
    name = ("Life Capsule (+%d)"):format(t.hp),
    map = t.map,
    getText = {
      -- Replacement string. Does not literally appear in game.
      ("Got a =Life Capsule=!<WAI0160<NOD\n\r Max health increased by %d!"):format(t.hp),
      "Got a =Life Capsule=!<WAI0160<NOD", -- erase the extra wait for most things.
      "Got a =Life Capsule=!<NOD", -- Hell1 capsule does not have waiting period for some reason.
    },
    command = ("<ML+000%d"):format(t.hp),
    displayCmd = "<GIT1006",
    music = "<CMU0016",
    erase = ("Max health increased by %d!<NOD"):format(t.hp),
  }
end

function missiles(t)
  assert(t.map)
  return {
    name = "Missiles",
    map = t.map,
    getText = {
      "",
      "Opened the treasure chest.<NOD", -- Normal case
      "Opened the treasure chest.", -- WeedB (fight with Kulala.)
    },
    command = "<EVE0030",
    displayCmd = "",
    music = "",
  }
end

function item(t)
  assert(t.name and t.map and t.id and t.getText)
  return {
    name = t.name,
    map = t.map,
    getText = t.getText,
    command = ("<IT+00%s"):format(t.id),
    displayCmd = ("<GIT10%s"):format(t.id),
    music = t.music or "<CMU0010"
  }
end

return {
  -------------
  -- WEAPONS --
  -------------
  wPolarStar = weapon({
    name = "Polar Star",
    map = "Pole",
    id = "02",
  }),
  wFireball = weapon({
    name = "Fireball",
    map = "Santa",
    id = "03",
  }),
  wBubbline = weapon({
    name = {
      "Bubbline",
      "Bubbler",
    },
    map = "Comu",
    id = "07",
    ammo = "0100",
  }),

  -------------------
  -- LIFE CAPSULES --
  -------------------
  lFirstCave = lifeCapsule({
    hp = 3,
    map = "Cave",
    label = "????"
  }),
  lYamashitaFarm = lifeCapsule({
    hp = 3,
    map = "Plant",
    label = "????"
  }),
  lEggCorridorA = lifeCapsule({
    hp = 3,
    map = "Eggs",
    label = "????"
  }),
  -- !!!! Can't randomize this one until I do some label-aware shit !!!!
  -- [Egg Corridor] Go through Cthulhu's Abode and out the top door. +4 HP.
  -- lEggCorridorB = lifeCapsule({
  --   hp = 4,
  --   map = "Eggs",
  --   label = "0401"
  -- }),
  lGrasstown = lifeCapsule({
    hp = 5,
    map = "Weed",
    label = "????"
  }),
  lGrasstownExecution = lifeCapsule({
    hp = 5,
    map = "WeedD",
    label = "????"
  }),
  lSandZoneA = lifeCapsule({
    hp = 5,
    map = "Sand",
    label = "0500"
  }),
  -- !!!! Can't randomize this one until I do some label-aware shit !!!!
  -- [Sand Zone] At the end of the hidden path behind a pawpad block on the far right. +5 HP.
  -- lSandZoneB = lifeCapsule({
  --   hp = 4,
  --   map = "Sand",
  --   label = "0501"
  -- }),
  lLabyrinth = lifeCapsule({
    hp = 5,
    map = "MazeI",
    label = "????"
  }),
  lPlantationA = lifeCapsule({
    hp = 5,
    map = "Cent",
    label = "0450"
  }),
  -- !!!! Can't randomize this one until I do some label-aware shit !!!!
  -- [Plantation] Sitting on a platform hanging from the far upper-left ceiling. +4 HP.
  -- lPlantationB = lifeCapsule({
  --   hp = 4,
  --   map = "Cent",
  --   label = "0500"
  -- }),
  lHell = lifeCapsule({
    hp = 5,
    map = "Hell1",
    label = "0400"
  }),

  --------------
  -- MISSILES --
  --------------
  mEggObservation = missiles({
    map = "EggR",
  }),
  mGrasslands = missiles({
    map = "Weed",
  }),
  mGrasslandsHut = missiles({
    map = "WeedB",
  }),
  mEggCorridorRuined = missiles({
    map = "Eggs2",
  }),
  mEggObservationRuined = missiles({
    map = "EggR2",
    label = "0302",
  }),
  -- !!!! Uses a unique script... will have to be crafty... !!!!
  -- [Sanctuary] Bonus expansion.  Just before you fight the Heavy Press at the
  -- far west end of Blood-Stained Sanctuary B3, just past the pillar with 3 Deletes
  -- covering it, in the room filled with flying Butes and with a hanging platform
  -- with an arrow Bute on either side.  Above this platform is a single Star Block
  -- concealing a chest containing this massive expansion of 24 Misisles.

  -----------
  -- ITEMS --
  -----------
  --  - Map System
  --  - Chako's Rouge
  iPanties = item({
    name = "Curly's Panties",
    map = "CurlyS",
    id = "35",
    getText = {
      "Found =Curly's Panties=.",
      "Found =Curly's Underwear=.",
    },
    music = "",
  }),
  --  - Turbocharge
  -- If you chose to take the Machine Gun from Curly in the Sand Zone, then you can
  -- receive this for free from the Gaudi shopkeeper, Chaba, in the Labyrinth.  It
  -- speeds up the recovery rate of ammo for the Machine Gun.
  --  - Arms Barrier
  -- Halves weapon EXP lost when you take damage.  Found the top part of the Camp,
  -- accessible via a hidden passageway in the ceiling in the large Labyrinth room
  -- from which you can access the normal Camp entrance and the Clinic nearby.
  -- Unless you took the Machine Gun, you'll have to come back to this area with the
  -- Booster to be able to reach it.
  --  - Whimsical Star
  -- A trinket that you can receive from Chaba, the Gaudi shopkeep in the Labyrinth,
  -- if you talk to him with the Spur weapon in your posession.  It will cause small
  -- stars to float around you as a meagre shield when you charge the Spur to MAX.
  iLifePot = item({
    name = "Life Pot",
    map = "Cent",
    id = "15",
    getText = "Got a =Life Pot=!",
    label = "0450",
  }),
}

--[[

-- Weapons

<KEY<FLJ1640:0201<FL+1640<SOU0022<CNP0200:0021:0000
<MSGOpened the chest.<NOD<GIT0002<AM+0002:0000<CLR
<CMU0010Got the =Polar Star=!<WAI0160<NOD<GIT0000<CLO<RMU

#0500
...
Here, you can have this.<NOD<GIT0003<AM+0003:0000<CLR
<CMU0010Got the =Fireball=!<WAI0160<NOD<RMU<GIT0000<CLRYou're looking for someone?<NOD


#0301
<KEY<GIT1008<MSGDo you want to use the
=Jellyfish Juice=?<YNJ0000<CLO<GIT0000
<IT-0008<ANP0300:0010:0000<WAI0030<FLJ0442:0302<FL+0442
<MSGYou find something in the
ashes...<NOD<CLR<GIT0007<AM+0007:0100
<CMU0010Got the =Bubbler=!<WAI0160<NOD<CLO<RMU<DNP0300<END

-- Life Capsules

<PRI<SOU0022<DNP0400<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0003
Max health increased by 3!<NOD<END

#0400
<PRI<FL+0101<SOU0022<DNP0400<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0003
Max health increased by 3!<NOD<END

#0305
<PRI<DNP0305<SOU0022<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0005
Max health increased by 5!<NOD<END

#0304
<PRI<DNP0304<SOU0022<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0005
Max health increased by 5!<NOD<END

#0300
<PRI<SOU0022<DNP0300<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0005
Max health increased by 5!<NOD<END

#0450
<PRI<FLJ1040:0451<FL+1040<MSGLong time no arf!<NOD<CLRI was told to bring this
to you...<NOD<CLR<SOU0022<CMU0016<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0005
Max health increased by 5!<NOD<GIT0000<ITJ0015:0451<CLROh, she said to give you
this, too...<NOD<CLR
<CMU0010<GIT1015<IT+0015<GIT1015Got a =Life Pot=!<WAI0160<NOD<GIT0000<RMU<EVE0451
<END

#0500
<PRI<SOU0022<DNP0500<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0004
Max health increased by 4!<NOD<END

#0400
<PRI<SOU0022<DNP0400
<MSG<GIT1006Got a =Life Capsule=!<NOD<ML+0005
Max health increased by 5!<NOD<END

<KEY<DNP0420<MSG<GIT1035<IT+0035
Found Curly's Panties.<NOD<END

<CMU0010<GIT1015<IT+0015<GIT1015Got a =Life Pot=!<WAI0160<NOD<GIT0000<RMU<EVE0451
<END

-- TODO:

#0401
<PRI<FL+0102<SOU0022<DNP0401<CLR<CMU0016
<MSG<GIT1006Got a =Life Capsule=!<WAI0160<NOD<RMU<ML+0004
Max health increased by 4!<NOD<END

-- Missiles

#0300
<PRI<FLJ0200:0001<FL+0200
<SOU0022<CNP0300:0021:0000
<MSGOpened the treasure chest.<NOD<CLR<EVE0030

#0302
<PRI<FLJ0218:0001<FL+0218
<SOU0022<CNP0302:0021:0000
<MSGOpened the treasure chest.<NOD<EVE0030

]]
