//
//  NetworkError.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case httpError(Error)
    case parsingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .httpError(let error):
            return error.localizedDescription
        case .parsingError(let error):
            return error.localizedDescription
        }
    }
}
