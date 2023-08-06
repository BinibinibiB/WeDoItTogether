//
//  SystemNotification.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import Foundation

struct SystemNotification:Identifiable {
    var id: UUID = UUID()
    var title: String
    var contents: String
    var createDate: Date
    var createDateToString:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: createDate)
    }
}
