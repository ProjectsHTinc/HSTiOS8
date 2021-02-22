//
//  DateFormatter.swift
//  OPS
//
//  Created by Happy Sanz Tech on 04/10/20.
//

import UIKit

extension UIViewController
{
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }
}
//
extension Date {

}
