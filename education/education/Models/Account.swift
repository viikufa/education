//
//  Account.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: UUID
    let name: String
    let email: String
}
