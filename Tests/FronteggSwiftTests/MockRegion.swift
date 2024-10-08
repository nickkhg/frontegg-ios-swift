//
//  MockRegion.swift
//  
//
//  Created by Nick Hagi on 25/07/2024.
//

import XCTest

enum MockRegion: String {

    case validSingleRegion
    case validSingleRegionMinimumKeys
    case singleRegionMissingBaseUrl
    case singleRegionMissingClientId
    case validMultiRegion
    case validMultiRegionMinimumKeys
    case multiRegionMissingBaseUrl
    case multiRegionMissingClientId
    case multiRegionMissingRegions
    case multiRegionMissingKey

    var url: URL {
        get throws {
            let filename = self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
            return try XCTUnwrap(Bundle.module.url(forResource: "MockRegions/\(filename)", withExtension: "plist"))
        }
    }
    var data: Data {
        get throws {
            return try Data(contentsOf: url)
        }
    }
}
