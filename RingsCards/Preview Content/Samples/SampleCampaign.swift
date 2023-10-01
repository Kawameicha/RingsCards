//
//  SampleCampaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.09.23.
//

struct SampleCampaign {
    static var contents: [Campaign] = [
        Campaign(name: "This is a Sample Campaign", code: "core", scenarios: [1,2,3], completed: [true,true,false]),
        Campaign(name: "Another Sample Campaign", code: "core", scenarios: [1,2,3], completed: [true,false,false])
    ]
}
