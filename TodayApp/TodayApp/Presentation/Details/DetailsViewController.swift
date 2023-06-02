//
//  DetailsViewController.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    lazy var detailsView = DetailsView()
    private var noteDetail: Reminder!
    
    private var isOldTitle: String = ""
    private var isOldDescription: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailsView
        view.backgroundColor = .white
        detailsView.configureProtocolDelegate(delegate: self)
        detailsView.bindCell(title: "Título", description: "Descrição")
    }
    
    init(note: Reminder){
        super.init(nibName: nil, bundle: nil)
        noteDetail = note
        if let tit = noteDetail.title, !tit.isEmpty {
            isOldTitle = tit
            detailsView.noteTitle.text = tit
        }
        if let desc = noteDetail.notes, !desc.isEmpty {
            isOldDescription = desc
            detailsView.noteDescription.text = desc
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateHour(value: String, isTitle: Bool){
        if isTitle {
            if value == isOldTitle {
                noteDetail.limitDate = Date()
            }
        } else {
            if value == isOldDescription {
                noteDetail.limitDate = Date()
            }
        }
        
    }
}

extension DetailsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        detailsView.noteView.layer.borderColor = Colors.green.cgColor
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText: NSString = textField.text as NSString? ?? ""
        let newText = currentText.replacingCharacters(in: range, with: string)
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        detailsView.noteView.layer.borderColor = Colors.yellow.cgColor
        if let title = detailsView.noteTitle.text {
            noteDetail.title = title
            updateHour(value: title, isTitle: true)
        }
        
        if let description = detailsView.noteDescription.text {
            noteDetail.notes = description
            updateHour(value: description, isTitle: false)
        }
    }
}
