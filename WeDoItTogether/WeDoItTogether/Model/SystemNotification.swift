//
//  SystemNotification.swift
//  WeDoItTogether
//
//  Created by 방유빈 on 2023/08/07.
//

import Foundation

struct SystemNotification: Identifiable, Codable {
    var id: String
    var title: String
    var contents: String
    var createDate: String
    
}

var notificationList: [SystemNotification] = [SystemNotification]() {
    didSet{
        notificationList.sort { noti1, noti2 in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd HH:mm"
            
            guard let date1: Date = formatter.date(from: noti1.createDate) else {
                return false }
            guard let date2: Date = formatter.date(from: noti2.createDate) else { return false }
            
            return date1.compare(date2) == .orderedDescending
        }
    }
}

