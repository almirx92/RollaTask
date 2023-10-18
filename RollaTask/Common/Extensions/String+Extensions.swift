//
//  String+Extensions.swift
//  RollaTask
//
//  Created by AlmirGaric on 16. 9. 2023..
//
import Foundation

extension String {
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
