//
//  File.swift
//  
//
//  Created by Marat Ibragimov on 20/12/2020.
//

import CSV

extension CSVReader {
    func move( towRow targetRow: [String]) {
        while let row = self.next(),
              row != targetRow {}
    }

    func loadRows(untilRow row: [String]) -> [[String]] {
        var rows = [[String]]()
        while let row = self.next(), row != [""] {
            rows.append(row)
        }
        return rows
    }
}
