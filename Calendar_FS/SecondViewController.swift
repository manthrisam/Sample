//
//  SecondViewController.swift
//  Calendar_FS
//
//  Created by Sky Stop on 19/07/21.
//

import UIKit
import FSCalendar

class SecondViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var backMonth: UIButton!
    @IBOutlet weak var nextMonth: UIButton!
    
    
    
    var calendar: FSCalendar!
    var formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 80.0, width: self.view.frame.size.width, height: 300))
        calendar.scope = .month
        self.view.addSubview(calendar)
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 19.0)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)
        calendar.appearance.todayColor = .systemGreen
        calendar.appearance.weekdayTextColor = .red
        calendar.appearance.headerTitleColor = .red
        
        //allow multiple selection
//        calendar.allowsMultipleSelection = true

        // Do any additional setup after loading the view.
    }
    
    // datasource methods
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        formatter.dateFormat = "dd-MM-yyyy"
//        guard let eventDate = formatter.date(from: "26-07-2021") else {return 0}
//        if date.compare(eventDate) == .orderedSame {
//            return 2
//        }
//        return 0
//    }
    
// for next back button actions.
    @IBAction func nextMonthBTN(_ sender: UIButton) {
        calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
        print("next")
    }
    
    @IBAction func backMonthBTN(_ sender: Any) {
        calendar.setCurrentPage(getPreviousMonth(date: calendar.currentPage), animated: true)
        print("back")
    }
    
    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }

    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
    }
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-YYYY"
        print(formatter.string(from: date))
    }
    
//    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        formatter.dateFormat = "dd-MM-YYYY"
//        print(formatter.string(from: date))
//    }
    
    // perticular date unselect
    
   /* func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        formatter.dateFormat = "dd-MM-yyyy"
        guard let excludedDate = formatter.date(from: "21-07-2021") else {return true}
        if date.compare(excludedDate) == .orderedSame {
            return false
        }
        return true
    }*/

//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
//        formatter.dateFormat = "dd-MM-yyyy"
//        guard let excludedDate = formatter.date(from: "21-07-2021") else {return nil}
//        if date.compare(excludedDate) == .orderedSame {
//            return .red
//        }
//
//        return nil
//    }
    


}
