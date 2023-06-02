//
//  DetailsViewController.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var noteDetail: Reminder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    init(note: Reminder){
        super.init(nibName: nil, bundle: nil)
        noteDetail = note
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
