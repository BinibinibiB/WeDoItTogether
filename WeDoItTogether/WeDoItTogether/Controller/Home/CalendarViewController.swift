//
//  CalendarViewController.swift
//  WeDoItTogether
//
//  Created by 오영석 on 2023/08/16.
//

import UIKit

class CalendarViewController: UIViewController {
    
    let calendarView = CalendarView()
    var selectedDate: DateComponents?
    
    override func loadView() {
        self.view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.dateView.delegate = self
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.dateView.selectionBehavior = dateSelection
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    // 달력에서 날짜 선택했을 경우
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            selection.setSelected(dateComponents, animated: true)
            selectedDate = dateComponents
            
        if let selectedDate = dateComponents {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = Calendar.current.date(from: selectedDate) {
                let formattedDate = dateFormatter.string(from: date)
                print("Selected Date: \(formattedDate)")
            }
        }
    }
}
