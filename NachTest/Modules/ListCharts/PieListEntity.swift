//
//  PieListEntity.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation

struct ChartsData: Codable {
    var colors: [String]?
    var questions: [Questions]?
}

struct Questions: Codable {
    var total: Int?
    var text: String?
    var chartData: [ChartComponents]?
}

struct ChartComponents: Codable {
    var text: String?
    var percetnage: Double?
}
