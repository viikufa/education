//
//  FirstViewController.swift
//  education
//
//  Created by Vitaliy on 17.05.2020.
//  Copyright © 2020 viik-solutions. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let apiService: BackendApiServiceProtocol = BackendApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAccountInfo()
    }
    
    func getAccountInfo() {
        let account = Account(id: UUID(), name: "example", email: "example")
        apiService.getAccountInfo(for: account) { (result) in
            switch result {
            case .success(let accountIfo):
                debugPrint(accountIfo)
            case .failure(let networkError):
                debugPrint(networkError.localizedDescription)
            }
        }
    }
}

