//
//  SideBarMenuViewController.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 11/07/2021.
//

import UIKit

class SideBarMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let funcCell = tableView.dequeueReusableCell(withIdentifier: "funcCell", for: indexPath)
        funcCell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        funcCell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        funcCell.imageView?.tintColor = funcCell.textLabel?.textColor
        
        return funcCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
