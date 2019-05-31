//
//  ViewController.swift
//  intern ios dek-d
//
//  Created by Surachat Yaitammasan on 23/5/2562 BE.
//  Copyright © 2562 Surachat Yaitammasan. All rights reserved.
//

import UIKit

var myIndex = 0

var dataTitle = ["โพยเตรียมสอบ", "งาน #VMAs", "ซุปกิมจิที่ไหนอร่อย", "เฟรชชี่ปี 1", "บุกกองซีรีส์คุณพ่อบรู๊ค", "กำลังรอน้อง Intern อยู่นะ 😄"]
var dataDetail = ["อวดโพยเชิญกระทู้นี้! ส่อง \"โพยเตรียมสอบ\" ในวิถีเซียน ละเอียดชนิดหมูบดยังต้องยอมแพ้", "มาดูกัน งาน #VMAs ปีนี้ P!nk สอนอะไรเรา", "ซุปกิมจิที่ไหนอร่อย? ก็ซุปกิมจิที่ทำเองไง!", "เปิดวาปเฟรชชี่ปี 1", "น้องณดาน่ารักมาก!! บุกกองซีรี่ส์คุณพ่อบรู๊ค", "สมัครกันเข้ามาเยอะๆน้า 🎉🎉🎉"]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        print(dataTitle.count)
        print(dataDetail.count )
        myCell.textLabel?.text = dataTitle[indexPath.row]
        myCell.detailTextLabel?.text = dataDetail[indexPath.row ]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            dataTitle.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

}

