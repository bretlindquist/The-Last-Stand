import Cocoa

// Copyright (c) 2024 Bret Lindquist. All rights reserved.
//  TheLastStand.swift


var rollCount = 0
var roll = 0
let messageArray = ["the beast has fallen", "You have slain the beast", "yaha, another one bites the dust", "you remain undefeated", "you are victorious!", "the approaching enemies run for their lifes", "your strength has increased!"]
//let beasts = ["wyvern", "hippogryph", "evil unicorn", "angry goblin","vengeful monk","killer bee","fey creature", "angry tree", "horseperson", "birdperson", "flying fish", "blade of grass", "dancing sword", "bone person", "gelatinous cube", "flying saucer"]
let beasts = ["flying saucer"]

var beastHP = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110]
var chosenBeastHP = beastHP.randomElement()
var beastStrike = [0, 1, 2, 3, 4, 5, 6]
var chosenBeast = beasts.randomElement()
var playerHit = 0
var playerHP = Int.random(in: 50...100)
var ufoIntro = false
// if set higher than 1...2 than the beast gets an advantage because the player only goes first if it is a 1
var initiative = Int.random(in: 1...2)
var firstround = true
var playerWin = true

print("""
you stand weary and tired, clutching your sword
after defeating countless enemies. as you look
around more and more enemies are  gathering.  behind you
you notice something moving, you tighten your grip
on your sword and turn to face the enemy...

//////////////// An Epic Battle Begins! \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

_________          _______    _        _______  _______ _________   _______ _________ _______  _        ______
\\__   __/|\\     /|(  ____ \\  ( \\      (  ___  )(  ____ \\\\__   __/  (  ____ \\\\__   __/(  ___  )( (    /|(  __  \\
   ) (   | )   ( || (    \\/  | (      | (   ) || (    \\/   ) (     | (    \\/   ) (   | (   ) ||  \\  ( || (  \\  )
   | |   | (___) || (__      | |      | (___) || (_____    | |     | (_____    | |   | (___) ||   \\ | || |   ) |
   | |   |  ___  ||  __)     | |      |  ___  |(_____  )   | |     (_____  )   | |   |  ___  || (\\ \\) || |   | |
   | |   | (   ) || (        | |      | (   ) |      ) |   | |           ) |   | |   | (   ) || | \\   || |   ) |
   | |   | )   ( || (____/\\  | (____/\\| )   ( |/\\____) |   | |     /\\____) |   | |   | )   ( || )  \\  || (__/  )
   )_(   |/     \\|(_______/  (_______/|/     \\|\\_______)   )_(     \\_______)   )_(   |/     \\||/    )_)(______/


""")

print("a wild \(chosenBeast!) appears!")
if chosenBeast == "flying saucer" && ufoIntro == false {
  print("a blinding light envelopes you. you feel your muscles tense up, and then you collapse to the ground.  you open your eyes to see you are in a battle arena, probably inside the ufo.  the door across from you slowly raises.  a giant arachnid wearing plated armor crawls under the door.  the crowd begins chanting, 'fendarine! fendarine! fendarine!' you steady yourself as it lunges to towards you. the giant arachnid wraps it's arms around you crushing your ribs, but before it can get a finishing blow you slice off one of the aracnid's arms, however you broke several ribs in the process.  you take 20 damage")
  playerHP -= 20
  ufoIntro = true
  chosenBeastHP! = 100
  print("")
  print("the giant arachnid has \(chosenBeastHP!) HP")
  chosenBeast = "giant arachnid"

} else {
  print("it has \(chosenBeastHP!) HP")
}
print("")

repeat {

  roll = Int.random(in: 1...6)
  rollCount += 1
  print("Round \(rollCount)")
  // if player has initiative he gets to go first, if the beast has initiative he gets to go first
  if chosenBeast == "giant arachnid" {
    initiative == 2
  }
  if initiative == 1  {
    if firstround {
      print("  you go first")
    }
    if roll == 6 {
      print("  you hit for \(roll) damage   ***Critical Hit!***")
    } else {
      print("  you hit for \(roll) damage")
    }

    chosenBeastHP! -= roll

    if chosenBeastHP! <= 0 {
      print("")
      print("the \(chosenBeast!) falls lifeless to the ground")

      break
    }
    print("  the beast has \(chosenBeastHP!) HP left")
    playerHit = beastStrike.randomElement()!
    print("  the \(chosenBeast!) strikes you for", terminator: "")
    playerHP -= playerHit
    if playerHit == 6 {
      print(" \(playerHit) damage   ***Critical Hit!***")
      print("  you have \(playerHP) HP left")
    } else if playerHit < 6 {
      print(" \(playerHit) damage")
      print("  you have \(playerHP) HP left")
    }
    if playerHP <= 0 {
      print("***you fall to the ground***")
      playerWin = false
      break
    }
    firstround = false
  }
  if initiative != 1  {
    if firstround { print("\(chosenBeast!) goes first") }
    playerHit = beastStrike.randomElement()!
    print("  the \(chosenBeast!) strikes you for \(playerHit) damage")
    playerHP -= playerHit
    if playerHit == 6 {
      print("***Critical Hit!***")
      print("  you have \(playerHP) HP left")
    } else if playerHit < 6 {
      print("  you have \(playerHP) HP left")
    }
    if playerHP <= 0 {
      print("***you fall to the ground***")
      playerWin = false
      break
    }
    if roll == 6 {
      print("  you hit for \(roll) damage   ***Critical Hit!***")
    } else {
      print("  you hit for \(roll) damage")
    }
    chosenBeastHP! -= roll
    if chosenBeastHP! <= 0 {
      print("")
      print("the \(chosenBeast!) falls lifeless to the ground")
      break
    } else {
      print("  the beast has \(chosenBeastHP!) HP left")

    }
    print("")

    firstround = false

  }
  if rollCount > 100 {
    break
  }
}

while chosenBeastHP! > 0
        if playerWin {

  print("")
  print("you have slain the \(chosenBeast!)!")
  print("")
  print(messageArray.randomElement()!)
  print("""

//////////////// Battle Over \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

""")
} else {
  print("""

 the \(chosenBeast!) stands, raising it's arms towards the sky and roars,
 as the onlooking enemies join in a cacophonous chorus, chanting
 \(chosenBeast!)! \(chosenBeast!)! \(chosenBeast!)!

you have been defeated.  you were all that remained of your species.

*** Game Over. ***
""")
  
}
if playerWin && chosenBeast == "giant arachnid" {
  print("""
  you stand in the middle of the arena, blood soaked and tired. you grip goes
loose and the sword clanks as it hits the grounds.  you collapse heaving
and contemplating what has occured.  you, the last of your kind, are now
surrounded by alien beings, on a ufo.  you have defeated the enemy but...
and slowly, one by one, they begin chanting your name.  louder and louder.
your breathing slows as you look around and see that you are their new
champion.  you pick up the sword, and raise it into the air, letting out
a magnificent cry.

it seems for now, you are safe.it seems for now your kind will live on.
""")
}

