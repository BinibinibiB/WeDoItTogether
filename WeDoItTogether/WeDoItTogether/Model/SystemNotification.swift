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

var notificationList: [SystemNotification] = []
