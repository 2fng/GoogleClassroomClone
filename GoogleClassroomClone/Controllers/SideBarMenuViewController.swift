//
//  SideBarMenuViewController.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 11/07/2021.
//

import UIKit

protocol SideBarViewControllerDelegate: AnyObject {
    func didTapItem()
}

class SideBarMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: SideBarViewControllerDelegate?
    
    var classrooms: [Classroom] = [
        
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Ngoc Tu", subject: "Nguyen ly he dieu hanh"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Thanh Tan", subject: "Nhap mon tin hoc"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Nhap mon hoc may"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Be", subject: "Tieng Anh 2"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Tran Van Dinh", subject: "Khai Pha Du Lieu"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Can Duc Diep", subject: "Quan Tri Du An CNTT"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Nguyen Thi Thanh Tan", subject: "Tri tue nhan tao"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Cau truc du lieu va giai thuat"),
    Classroom(classroomName: "D13HTTMDT2", teacherName: "Ngo Hoang Huy", subject: "Cau truc du lieu va giai thuat 2")
    ]
    
    enum MenuOptions: String, CaseIterable {
        case lopHoc = "Lớp học"
        case lich = "Lịch"
        case viecCanLam = "Việc cần làm"
        case lopHocDaLuuTru = "Lớp học đã lưu trữ"
        case thuMucLopHoc = "Thư mục lớp học"
        case caiDat = "Cài đặt"
        case guiPhanHoiChoGoogle = "Gửi phản hồi cho Google"
        case troGiup = "Trợ giúp"
        
        var imageName: String {
            switch self {
            
            case .lopHoc:
                return "house"
            case .lich:
                return "calendar"
            case .viecCanLam:
                return "list.bullet.rectangle"
            case .lopHocDaLuuTru:
                return "rectangle.and.paperclip"
            case .thuMucLopHoc:
                return "folder"
            case .caiDat:
                return "gearshape"
            case .guiPhanHoiChoGoogle:
                return "exclamationmark.bubble"
            case .troGiup:
                return "questionmark.circle"
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "funcCell")
        table.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        table.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.identifier)
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tableHeight = view.bounds.size.height - view.safeAreaInsets.bottom
        tableHeight -= view.safeAreaInsets.top
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: tableHeight)
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count + classrooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 2 {
            
            let firstCell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath)
            
            firstCell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
            firstCell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
            firstCell.imageView?.tintColor = .systemBlue
            
            return firstCell
            
        }
        
        if indexPath.row >= 2  && indexPath.row <= classrooms.count + 2 {
            
            let secondCell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath)
            
            if indexPath.row == 2 {
                secondCell.textLabel?.text = MenuOptions.allCases[2].rawValue
                secondCell.imageView?.image = UIImage(systemName: MenuOptions.allCases[2].imageName)
                secondCell.imageView?.tintColor = .systemRed
                
                return secondCell
            }
            
            secondCell.textLabel?.numberOfLines = 0
            secondCell.textLabel?.lineBreakMode = .byClipping
            secondCell.textLabel?.text = "\(classrooms[indexPath.row - 3].subject)\n\(classrooms[indexPath.row-3].classroomName)"
            secondCell.imageView?.image = UIImage(systemName: "gear")
            secondCell.imageView?.tintColor = .systemRed
            
            return secondCell
            
        }
        
        let funcCell = tableView.dequeueReusableCell(withIdentifier: "funcCell", for: indexPath)
        
        let total = classrooms.count
        
        funcCell.textLabel?.text = MenuOptions.allCases[(indexPath.row) - total].rawValue
        funcCell.imageView?.image = UIImage(systemName: MenuOptions.allCases[(indexPath.row) - total].imageName)
        funcCell.imageView?.tintColor = funcCell.textLabel?.textColor
        
        return funcCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let item = MenuOptions.allCases[indexPath.row]
        //let classroomItem = classrooms[indexPath.row]
        delegate?.didTapItem()
        
    }
}
