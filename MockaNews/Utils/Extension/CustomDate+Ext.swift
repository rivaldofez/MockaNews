//
//  CustomDate+Ext.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import Foundation

extension Date {

    func getElapsedInterval() -> String {

        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())

        if let year = interval.year, year > 0 {
            return "\(year)" + " " + "tahun yang lalu"
        } else if let month = interval.month, month > 0 {
            return "\(month)" + " " + "bulan yang lalu"
        } else if let day = interval.day, day > 0 {
            return "\(day)" + " " + "hari yang lalu"
        } else {
            return "beberapa waktu yang lalu"
        }
    }
}
