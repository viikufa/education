//
//  BackendApiService.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import Foundation

protocol BackendApiServiceProtocol {
    @discardableResult
    func getAccountInfo(for account: Account, callback: @escaping (Result<AccountInfo, NetworkError>) -> Void ) -> CancelableRequest
}

fileprivate extension BackendApiService {
    enum Routes {
        case getAccountInfo
        var path: String {
            switch self {
            case .getAccountInfo:
                return "mobile/accountInfo"
            }
        }
    }
}

final class BackendApiService: BackendApiServiceProtocol {
    let baseURL: URL = {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 8080
        guard let url = components.url else {
            fatalError("can't create baseUrl")
        }
        return url
    }()
    
    @discardableResult
    func getAccountInfo(for account: Account, callback: @escaping (Result<AccountInfo, NetworkError>) -> Void) -> CancelableRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(Routes.getAccountInfo.path))
        request.setValue("JWT 123123132", forHTTPHeaderField: "Authorization")
        let encoder = JSONEncoder()
        let data = try? encoder.encode(account)
        request.httpBody = data
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                callback(.failure(.httpError(error)))
                return
            }
            if let data = data {
                do {
                    let accountInfo = try JSONDecoder().decode(AccountInfo.self, from: data)
                    callback(.success(accountInfo))
                } catch let parsingError {
                    callback(.failure(.parsingError(parsingError)))
                }
            }
        }
        task.resume()
        return task
    }
}

