//
//  CountrySubdivision.swift
//  TakeHomeSwiftUI
//
//  Created by Enrique Gongora on 6/3/21.
//

import Foundation

struct States: Codable {
    let countrySubdivisions: [CountrySubdivision]

    enum CodingKeys: String, CodingKey {
        case countrySubdivisions = "country_subdivisions"
    }
}

struct CountrySubdivision: Codable {
    let id, code, codeISO, codeANSI: String
    let countryID, name: String

    enum CodingKeys: String, CodingKey {
        case id, code
        case codeISO = "code_iso"
        case codeANSI = "code_ansi"
        case countryID = "country_id"
        case name
    }
}
