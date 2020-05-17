//
//  AccountInfo.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import Foundation

struct AccountInfo: Decodable {
    let id: UUID
    let firstname: String
    let lastname: String
    let email: String
}
