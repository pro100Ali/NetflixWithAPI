//
//  Extensions.swift
//  Netflix
//
//  Created by Dimash Nsanbaev on 11/8/22.
//

import Foundation

extension String{
    func capitalizeFirstLetter()->String{
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
