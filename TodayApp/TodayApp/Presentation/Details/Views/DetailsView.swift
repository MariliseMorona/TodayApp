//
//  DetailsView.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

class DetailsView : UIView {
    
    lazy var noteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 3
        view.layer.borderColor = Colors.yellow.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    lazy var stackViewTitle: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelTitle, noteTitle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    lazy var labelTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var noteTitle: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        return title
    }()
    
    lazy var noteDivisorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    lazy var stackViewDescription: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelDescription, noteDescription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    lazy var labelDescription: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var noteDescription: UITextField = {
        let description = UITextField()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .left
        return description
    }()
    
    lazy var descriptionDivisorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureProtocolDelegate(delegate: UITextFieldDelegate) {
        noteTitle.delegate = delegate
        noteDescription.delegate = delegate
    }
    
    func bindCell(title: String, description: String){
        labelTitle.text = title
        labelDescription.text = description
    }
    
    func setUp() {
        addSubview(noteView)
        noteView.addSubview(stackViewTitle)
        noteView.addSubview(noteDivisorView)
        noteView.addSubview(stackViewDescription)
        noteView.addSubview(descriptionDivisorView)
        constrains()
    }
    
    func constrains() {
        NSLayoutConstraint.activate([
            noteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            noteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            noteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            stackViewTitle.topAnchor.constraint(equalTo: noteView.safeAreaLayoutGuide.topAnchor, constant: 15),
            stackViewTitle.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: 5),
            stackViewTitle.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -5),
            
            labelTitle.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/4),
            noteDivisorView.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: 1),
            noteDivisorView.leadingAnchor.constraint(equalTo: noteTitle.leadingAnchor),
            noteDivisorView.trailingAnchor.constraint(equalTo: noteTitle.trailingAnchor),
            noteDivisorView.heightAnchor.constraint(equalToConstant: 1),
            
            stackViewDescription.topAnchor.constraint(equalTo: stackViewTitle.bottomAnchor, constant: 30),
            stackViewDescription.leadingAnchor.constraint(equalTo: stackViewTitle.leadingAnchor),
            stackViewDescription.trailingAnchor.constraint(equalTo: stackViewTitle.trailingAnchor),
            stackViewDescription.bottomAnchor.constraint(equalTo: noteView.bottomAnchor, constant: -15),

            labelDescription.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/4),
            descriptionDivisorView.topAnchor.constraint(equalTo: noteDescription.bottomAnchor, constant: 1),
            descriptionDivisorView.leadingAnchor.constraint(equalTo: noteDescription.leadingAnchor),
            descriptionDivisorView.trailingAnchor.constraint(equalTo: noteDescription.trailingAnchor),
            descriptionDivisorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

