//
//  ViewController.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - properties
    var presenter = HomeViewToPresenterProtocol?
    private var articles: [Article] = []
    private var currentCategory = "genral"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

