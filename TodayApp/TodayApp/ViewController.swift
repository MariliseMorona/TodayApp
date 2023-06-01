//
//  ViewController.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var listView = NoteListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = listView
        listView.backgroundColor = .orange
        // Do any additional setup after loading the view.
    }


}

