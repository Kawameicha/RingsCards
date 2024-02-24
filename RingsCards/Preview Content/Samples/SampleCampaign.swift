//
//  SampleCampaign.swift
//  RingsCards
//
//  Created by Christoph Freier on 30.09.23.
//

struct SampleCampaign {
    static var contents: [Campaign] = [
        Campaign(
            code: "Core",
            name: "Core Legacy Mode",
            scenarios: [1,2,3],
            completed: [true,true,false],
            campaignMode: false,
            slots: ["01132": 0, "01133": 0, "01134": 0, "01135": 0, "01136": 0, "01137": 0, "01138": 0]
        ),
        Campaign(
            code: "Core",
            name: "Core Campaign Mode",
            scenarios: [1,2,3],
            completed: [true,false,false],
            campaignMode: true,
            slots: ["01132": 1, "01133": 0, "01134": 0, "01135": 1, "01136": 0, "01137": 1, "01138": 0]
        )
    ]
}
