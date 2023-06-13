//
//  DetailViewModel.swift
//  TodayApp
//
//  Created by Marilise Morona on 02/06/23.
//

import UIKit

final class DetailViewModel {
    
    private var note: Reminder
    private var isOldTitle: String = ""
    private var isOldDescription: String = ""
    
    init(note: Reminder) {
        self.note = note
    }
    
    func setTitle() -> String {
        return note.title ?? ""
    }
    
    func setDescription() -> String {
        return note.notes ?? ""
    }
    
    func validatedIfChangedTheText(_ string: String, isTitle: Bool) -> Bool {
        if isTitle {
            if string != isOldTitle{
                isOldTitle = string
                return true
            }
        } else {
            if string != isOldDescription {
                isOldDescription = string
                return true
            }
        }
        return false
    }
    
    func updateHour(_ string: String, isTitle: Bool){
        if validatedIfChangedTheText(string, isTitle: isTitle){
            note.limitDate = Date()
        }
    }
}

