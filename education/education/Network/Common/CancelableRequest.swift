//
//  CancelableRequest.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import Foundation

protocol CancelableRequest {
    func cancel()
}

extension URLSessionTask: CancelableRequest {
}
