//
//  SampleDeck.swift
//  RingsCards
//
//  Created by Christoph Freier on 26.09.23.
//

struct SampleDeck {
    static var contents: [Deck] = [
        Deck(name: "This is a Sample Deck",
             heroes: ["01001":1, "01007":1, "01002":1],
             slots: ["01001":1, "01007":1, "01002":1]),
        Deck(name: "Another Sample Deck",
             heroes: ["01001":1, "01007":1, "01002":1],
             slots: ["01001":1, "01007":1, "01002":1])
    ]
}
