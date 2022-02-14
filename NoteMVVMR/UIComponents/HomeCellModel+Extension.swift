//
//  HomeCellModel+Extension.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 13.02.2022.
//

import Foundation

extension HomeCellModel {
    
    convenience init(note: Note) {
        self.init(title: note.title ?? "",
                  description: note.note ?? "",
                  noteID: note.id ?? 0)
    }
}
