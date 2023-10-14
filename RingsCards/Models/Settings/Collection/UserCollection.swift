//
//  UserCollection.swift
//  RingsCards
//
//  Created by Christoph Freier on 08.10.23.
//

struct UserCollection {
    static var contents: [Collection] = [
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Core Set", packCode: "Core", packPosition: 1),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Hunt for Gollum", packCode: "HfG", packPosition: 2),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Conflict at the Carrock", packCode: "CatC", packPosition: 3),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "A Journey to Rhosgobel", packCode: "JtR", packPosition: 4),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Hills of Emyn Muil", packCode: "HoEM", packPosition: 5),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "The Dead Marshes", packCode: "TDM", packPosition: 6),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Return to Mirkwood", packCode: "RtM", packPosition: 7),
        Collection(cycleName: "Shadows of Mirkwood", cycleCode: "Mirkwood", cyclePosition: 1, packName: "Campaign Cards", packCode: "RevCore", packPosition: 8),

        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Khazad-dûm", packCode: "KD", packPosition: 1),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Redhorn Gate", packCode: "TRG", packPosition: 2),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Road to Rivendell", packCode: "RtR", packPosition: 3),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Watcher in the Water", packCode: "WitW", packPosition: 4),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "The Long Dark", packCode: "TLD", packPosition: 5),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Foundations of Stone", packCode: "FoS", packPosition: 6),
        Collection(cycleName: "Dwarrowdelf", cycleCode: "Dwarrowdelf", cyclePosition: 2, packName: "Shadow and Flame", packCode: "SaF", packPosition: 7),

        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "Heirs of Numenor", packCode: "HoN", packPosition: 1),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "The Steward's Fear", packCode: "TSF", packPosition: 2),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "The Druadan Forest", packCode: "TDF", packPosition: 3),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "Encounter at Amon Din", packCode: "EaAD", packPosition: 4),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "Assault on Osgiliath", packCode: "AoO", packPosition: 5),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "The Blood of Gondor", packCode: "BoG", packPosition: 6),
        Collection(cycleName: "Against the Shadow", cycleCode: "Shadow", cyclePosition: 3, packName: "The Morgul Vale", packCode: "TMV", packPosition: 7),

        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "The Voice of Isengard", packCode: "VoI", packPosition: 1),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "The Dunland Trap", packCode: "TDT", packPosition: 2),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "The Three Trials", packCode: "TTT", packPosition: 3),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "Trouble in Tharbad", packCode: "TiT", packPosition: 4),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "The Nin-in-Eilph", packCode: "NiE", packPosition: 5),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "Celebrimbor's Secret", packCode: "CS", packPosition: 6),
        Collection(cycleName: "The Ring-maker", cycleCode: "Ring-maker", cyclePosition: 4, packName: "The Antlered Crown", packCode: "TAC", packPosition: 7),

        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "The Lost Realm", packCode: "TLR", packPosition: 1),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "The Wastes of Eriador", packCode: "WoE", packPosition: 2),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "Escape from Mount Gram", packCode: "EfMG", packPosition: 3),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "Across the Ettenmoors", packCode: "AtE", packPosition: 4),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "The Treachery of Rhudaur", packCode: "ToR", packPosition: 5),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "The Battle of Carn Dûm", packCode: "BoCD", packPosition: 6),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "The Dread Realm", packCode: "TDR", packPosition: 7),
        Collection(cycleName: "Angmar Awakened", cycleCode: "Awakened", cyclePosition: 5, packName: "Campaign Cards", packCode: "AACE", packPosition: 8),

        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "The Grey Havens", packCode: "TGH", packPosition: 1),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "Flight of the Stormcaller", packCode: "FotS", packPosition: 2),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "The Thing in the Depths", packCode: "TitD", packPosition: 3),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "Temple of the Deceived", packCode: "TotD", packPosition: 4),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "The Drowned Ruins", packCode: "DR", packPosition: 5),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "A Storm on Cobas Haven", packCode: "SoCH", packPosition: 6),
        Collection(cycleName: "Dream-chaser", cycleCode: "Dream-chaser", cyclePosition: 6, packName: "The City of Corsairs", packCode: "CoC", packPosition: 7),

        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "The Sands of Harad", packCode: "TSoH", packPosition: 1),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "The Mûmakil", packCode: "M", packPosition: 2),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "Race Across Harad", packCode: "RAH", packPosition: 3),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "Beneath the Sands", packCode: "BtS", packPosition: 4),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "The Black Serpent", packCode: "TBS", packPosition: 5),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "The Dungeons of Cirith Gurat", packCode: "DoCG", packPosition: 6),
        Collection(cycleName: "Haradrim", cycleCode: "Haradrim", cyclePosition: 7, packName: "The Crossings of Poros", packCode: "CoP", packPosition: 7),

        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "The Wilds of Rhovanion", packCode: "TWoR", packPosition: 1),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "The Withered Heath", packCode: "TWH", packPosition: 2),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "Roam Across Rhovanion", packCode: "RAR", packPosition: 3),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "Fire in the Night", packCode: "FitN", packPosition: 4),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "The Ghost of Framsburg", packCode: "TGoF", packPosition: 5),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "Mount Gundabad", packCode: "MG", packPosition: 6),
        Collection(cycleName: "Ered Mithrin", cycleCode: "Mithrin", cyclePosition: 8, packName: "The Fate of Wilderland", packCode: "TFoW", packPosition: 7),

        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "A Shadow in the East", packCode: "ASitE", packPosition: 1),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "Wrath and Ruin", packCode: "WaR", packPosition: 2),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "The City of Ulfast", packCode: "TCoU", packPosition: 3),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "Challenge of the Wainriders", packCode: "CotW", packPosition: 4),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "Under the Ash Mountains", packCode: "UtAM", packPosition: 5),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "The Land of Sorrow", packCode: "TLoS", packPosition: 6),
        Collection(cycleName: "Vengeance of Mordor", cycleCode: "Mordor", cyclePosition: 9, packName: "The Fortress of Nurn", packCode: "TFoN", packPosition: 7),

        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "Children of Eorl", packCode: "CoE", packPosition: 1),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "The Aldburg Plot", packCode: "TAP", packPosition: 2),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "Fire on the Eastemnet", packCode: "FotE", packPosition: 3),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "The Gap of Rohan", packCode: "TGoR", packPosition: 4),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "The Glittering Caves", packCode: "TGC", packPosition: 5),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "Mustering of the Rohirrim", packCode: "MotR", packPosition: 6),
        Collection(cycleName: "Oaths of the Rohirrim", cycleCode: "Rohirrim", cyclePosition: 10, packName: "Blood in the Isen", packCode: "BitI", packPosition: 7),
        
        Collection(cycleName: "The Hobbit", cycleCode: "Hobbit", cyclePosition: 101, packName: "Over Hill and Under Hill", packCode: "OHaUH", packPosition: 1),
        Collection(cycleName: "The Hobbit", cycleCode: "Hobbit", cyclePosition: 101, packName: "On the Doorstep", packCode: "OtD", packPosition: 2),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Black Riders", packCode: "TBR", packPosition: 1),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Road Darkens", packCode: "TRD", packPosition: 2),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Treason of Saruman", packCode: "ToS", packPosition: 3),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Land of Shadow", packCode: "LoS", packPosition: 4),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Flame of the West", packCode: "FotW", packPosition: 5),
        Collection(cycleName: "The Lord of the Rings", cycleCode: "Rings", cyclePosition: 102, packName: "The Mountain of Fire", packCode: "MoF", packPosition: 6),
    ]
}
