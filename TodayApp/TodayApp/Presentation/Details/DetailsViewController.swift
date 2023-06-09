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
    var viewModel: DetailViewModel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailsView
        view.backgroundColor = .white
        detailsView.configureProtocolDelegate(delegate: self)
        detailsView.bindCell(title: "Título", description: "Descrição")
    }
    
    fileprivate func validUITextField(_ textField: UITextField ) {
        textField.text = viewModel.setTitle()
    }

    
    init(note: Reminder){
        super.init(nibName: nil, bundle: nil)
        noteDetail = note
        viewModel = DetailViewModel(note: noteDetail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            viewModel.updateHour(title, isTitle: true)
        }
        if let description = detailsView.noteDescription.text {
            noteDetail.notes = description
            viewModel.updateHour(description, isTitle: false)
        }
    }
}
