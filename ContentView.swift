import SwiftUI
import SwiftData

struct ContentView: View {

    @State var decks: [Deck] = []
    
    public let allCards: [Card] = [
        // Common
        Card(name: "Skeletons", elixir: 1, type: "Troop", rarity: 0, image: "SkeletonsImage"),
        Card(name: "Ice Spirit", elixir: 1, type: "Troop", rarity: 0, image: "IceSpiritImage"),
        Card(name: "Fire Spirit", elixir: 1, type: "Troop", rarity: 0, image: "FireSpiritImage"),
        Card(name: "Electro Spirit", elixir: 1, type: "Troop", rarity: 0, image: "ElectroSpiritImage"),
        Card(name: "Bomber", elixir: 2, type: "Troop", rarity: 0, image: "BomberImage"),
        Card(name: "Goblins", elixir: 2, type: "Troop", rarity: 0, image: "GoblinsImage"),
        Card(name: "Spear Goblins", elixir: 2, type: "Troop", rarity: 0, image: "SpearGoblinsImage"),
        Card(name: "Bats", elixir: 2, type: "Troop", rarity: 0, image: "BatsImage"),
        Card(name: "Zap", elixir: 2, type: "Spell", rarity: 0, image: "ZapImage"),
        Card(name: "Giant Snowball", elixir: 2, type: "Spell", rarity: 0, image: "GiantSnowballImage"),
        Card(name: "Knight", elixir: 3, type: "Troop", rarity: 0, image: "KnightImage"),
        Card(name: "Archers", elixir: 3, type: "Troop", rarity: 0, image: "ArchersImage"),
        Card(name: "Minions", elixir: 3, type: "Troop", rarity: 0, image: "MinionsImage"),
        Card(name: "Arrows", elixir: 3, type: "Spell", rarity: 0, image: "ArrowsImage"),
        Card(name: "Goblin Gang", elixir: 3, type: "Troop", rarity: 0, image: "GoblinGangImage"),
        Card(name: "Skeleton Barrel", elixir: 3, type: "Troop", rarity: 0, image: "SkeletonBarrelImage"),
        Card(name: "Firecracker", elixir: 3, type: "Troop", rarity: 0, image: "FirecrackerImage"),
        Card(name: "Royal Delivery", elixir: 3, type: "Spell", rarity: 0, image: "RoyalDeliveryImage"),

        // Rare
        Card(name: "Heal Spirit", elixir: 1, type: "Troop", rarity: 1, image: "HealSpiritImage"),
        Card(name: "Ice Golem", elixir: 2, type: "Troop", rarity: 1, image: "IceGolemImage"),
        Card(name: "Mega Minion", elixir: 3, type: "Troop", rarity: 1, image: "MegaMinionImage"),
        Card(name: "Dart Goblin", elixir: 3, type: "Troop", rarity: 1, image: "DartGoblinImage"),
        Card(name: "Elixir Golem", elixir: 3, type: "Troop", rarity: 1, image: "ElixirGolemImage"),
        Card(name: "Earthquake", elixir: 3, type: "Spell", rarity: 1, image: "EarthquakeImage"),
        Card(name: "Fireball", elixir: 4, type: "Spell", rarity: 1, image: "FireballImage"),
        Card(name: "Mini P.E.K.K.A", elixir: 4, type: "Troop", rarity: 1, image: "MiniPEKKAImage"),
        Card(name: "Musketeer", elixir: 4, type: "Troop", rarity: 1, image: "MusketeerImage"),
        Card(name: "Hog Rider", elixir: 4, type: "Troop", rarity: 1, image: "HogRiderImage"),
        Card(name: "Valkyrie", elixir: 4, type: "Troop", rarity: 1, image: "ValkyrieImage"),
        Card(name: "Wizard", elixir: 5, type: "Troop", rarity: 1, image: "WizardImage"),
        Card(name: "Giant", elixir: 5, type: "Troop", rarity: 1, image: "GiantImage"),
        Card(name: "Elite Barbarians", elixir: 6, type: "Troop", rarity: 0, image: "EliteBarbariansImage"),

        // Epic
        Card(name: "Rage", elixir: 2, type: "Spell", rarity: 2, image: "RageImage"),
        Card(name: "Barbarian Barrel", elixir: 2, type: "Spell", rarity: 2, image: "BarbarianBarrelImage"),
        Card(name: "Wall Breakers", elixir: 3, type: "Troop", rarity: 2, image: "WallBreakersImage"),
        Card(name: "Skeleton Army", elixir: 3, type: "Troop", rarity: 2, image: "SkeletonArmyImage"),
        Card(name: "Guards", elixir: 3, type: "Troop", rarity: 2, image: "GuardsImage"),
        Card(name: "Goblin Barrel", elixir: 3, type: "Spell", rarity: 2, image: "GoblinBarrelImage"),
        Card(name: "Tornado", elixir: 3, type: "Spell", rarity: 2, image: "TornadoImage"),
        Card(name: "Clone", elixir: 3, type: "Spell", rarity: 2, image: "CloneImage"),
        Card(name: "Mirror", elixir: 3, type: "Spell", rarity: 2, image: "MirrorImage"),
        Card(name: "Baby Dragon", elixir: 4, type: "Troop", rarity: 2, image: "BabyDragonImage"),
        Card(name: "Dark Prince", elixir: 4, type: "Troop", rarity: 2, image: "DarkPrinceImage"),
        Card(name: "Hunter", elixir: 4, type: "Troop", rarity: 2, image: "HunterImage"),
        Card(name: "Freeze", elixir: 4, type: "Spell", rarity: 2, image: "FreezeImage"),
        Card(name: "Poison", elixir: 4, type: "Spell", rarity: 2, image: "PoisonImage"),
        Card(name: "Balloon", elixir: 5, type: "Troop", rarity: 2, image: "BalloonImage"),
        Card(name: "Witch", elixir: 5, type: "Troop", rarity: 2, image: "WitchImage"),
        Card(name: "Prince", elixir: 5, type: "Troop", rarity: 2, image: "PrinceImage"),
        Card(name: "Bowler", elixir: 5, type: "Troop", rarity: 2, image: "BowlerImage"),
        Card(name: "Executioner", elixir: 5, type: "Troop", rarity: 2, image: "ExecutionerImage"),
        Card(name: "Cannon Cart", elixir: 5, type: "Troop", rarity: 2, image: "CannonCartImage"),
        Card(name: "Electro Dragon", elixir: 5, type: "Troop", rarity: 2, image: "ElectroDragonImage"),
        Card(name: "Giant Skeleton", elixir: 6, type: "Troop", rarity: 2, image: "GiantSkeletonImage"),
        Card(name: "Goblin Giant", elixir: 6, type: "Troop", rarity: 2, image: "GoblinGiantImage"),
        Card(name: "P.E.K.K.A", elixir: 7, type: "Troop", rarity: 2, image: "PEKKAImage"),
        Card(name: "Electro Giant", elixir: 7, type: "Troop", rarity: 2, image: "ElectroGiantImage"),
        Card(name: "Golem", elixir: 8, type: "Troop", rarity: 2, image: "GolemImage"),

        // Legendary
        Card(name: "The Log", elixir: 2, type: "Spell", rarity: 3, image: "TheLogImage"),
        Card(name: "Princess", elixir: 3, type: "Troop", rarity: 3, image: "PrincessImage"),
        Card(name: "Ice Wizard", elixir: 3, type: "Troop", rarity: 3, image: "IceWizardImage"),
        Card(name: "Miner", elixir: 3, type: "Troop", rarity: 3, image: "MinerImage"),
        Card(name: "Bandit", elixir: 3, type: "Troop", rarity: 3, image: "BanditImage"),
        Card(name: "Royal Ghost", elixir: 3, type: "Troop", rarity: 3, image: "RoyalGhostImage"),
        Card(name: "Fisherman", elixir: 3, type: "Troop", rarity: 3, image: "FishermanImage"),
        Card(name: "Lumberjack", elixir: 4, type: "Troop", rarity: 3, image: "LumberjackImage"),
        Card(name: "Night Witch", elixir: 4, type: "Troop", rarity: 3, image: "NightWitchImage"),
        Card(name: "Magic Archer", elixir: 4, type: "Troop", rarity: 3, image: "MagicArcherImage"),
        Card(name: "Electro Wizard", elixir: 4, type: "Troop", rarity: 3, image: "ElectroWizardImage"),
        Card(name: "Inferno Dragon", elixir: 4, type: "Troop", rarity: 3, image: "InfernoDragonImage"),
        Card(name: "Graveyard", elixir: 5, type: "Spell", rarity: 3, image: "GraveyardImage"),
        Card(name: "Ram Rider", elixir: 5, type: "Troop", rarity: 3, image: "RamRiderImage"),
        Card(name: "Sparky", elixir: 6, type: "Troop", rarity: 3, image: "SparkyImage"),
        Card(name: "Mega Knight", elixir: 7, type: "Troop", rarity: 3, image: "MegaKnightImage"),

        // Champions
        Card(name: "Little Prince", elixir: 3, type: "Troop", rarity: 4, image: "LittlePrinceImage"),
        Card(name: "Golden Knight", elixir: 4, type: "Troop", rarity: 4, image: "GoldenKnightImage"),
        Card(name: "Skeleton King", elixir: 4, type: "Troop", rarity: 4, image: "SkeletonKingImage"),
        Card(name: "Mighty Miner", elixir: 4, type: "Troop", rarity: 4, image: "MightyMinerImage"),
        Card(name: "Monk", elixir: 5, type: "Troop", rarity: 4, image: "MonkImage"),
        Card(name: "Archer Queen", elixir: 5, type: "Troop", rarity: 4, image: "ArcherQueenImage")
    ]

    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Clash Royale Tracker")
                    .font(.largeTitle)
                Spacer()
                
                Text("Hello World!")

                /*Button("add decks") {
                 decks.append(firstDeck)
                 decks.append(d2)
                 decks.append(d3)
                 decks.append(d4)
                 }*/

                NavigationLink(destination: CardWinratesView(allCards: allCards)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.green)
                            .frame(width: 300, height: 100)
                        Text("Analyze Best Cards")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                NavigationLink(destination: RecordGameView(decks: decks, yourDeck: Deck(), opponentDeck: Deck())) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.yellow)
                            .frame(width: 300, height: 100)
                        Text("Record Game")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                HStack {
                    NavigationLink(destination: DeckCreationView(allCards: allCards, deck: Deck(), decks: $decks)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 140, height: 100)
                            Text("Create Deck")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                    
                    NavigationLink(destination: DecksView(decks: $decks)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 140, height: 100)
                            Text("Decks")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
        }

    }
}
