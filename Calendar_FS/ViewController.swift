//
//  ViewController.swift
//  Calendar_FS
//
//  Created by Sky Stop on 19/07/21.
//

import UIKit
import FSCalendar


class ViewController: UIViewController,FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var calendarView: FSCalendar!
    //    var calendar: FSCalendar!
//    var formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
//        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 19.0)
//        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)
//        calendar.appearance.todayColor = .systemGreen
        // Do any additional setup after loading the view.
    }
    

//    func minimumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
//    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        formatter.dateFormat = "dd-mm-yyyy"
//        print(formatter.string(from: date))
//    }

    @IBAction func backButton(_ sender: Any) {
        calendarView.setCurrentPage(getPreviousMonth(date: calendarView.currentPage), animated: true)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        calendarView.setCurrentPage(getNextMonth(date: calendarView.currentPage), animated: true)
    }
    
    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }

    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
    }
    
}

