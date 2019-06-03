//
//  ViewController.swift
//  intern ios dek-d
//
//  Created by Surachat Yaitammasan on 23/5/2562 BE.
//  Copyright © 2562 Surachat Yaitammasan. All rights reserved.
//

import UIKit

var myIndex = 0

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var titleField: UITextField!
    var descField: UITextField!
    
    var dataTitle = ["โพยเตรียมสอบ", "งาน #VMAs", "ซุปกิมจิที่ไหนอร่อย", "เฟรชชี่ปี 1", "บุกกองซีรีส์คุณพ่อบรู๊ค", "กำลังรอน้อง Intern อยู่นะ 😄"]
    var dataDetail = ["อวดโพยเชิญกระทู้นี้! ส่อง \"โพยเตรียมสอบ\" ในวิถีเซียน ละเอียดชนิดหมูบดยังต้องยอมแพ้", "มาดูกัน งาน #VMAs ปีนี้ P!nk สอนอะไรเรา", "ซุปกิมจิที่ไหนอร่อย? ก็ซุปกิมจิที่ทำเองไง!", "เปิดวาปเฟรชชี่ปี 1", "น้องณดาน่ารักมาก!! บุกกองซีรี่ส์คุณพ่อบรู๊ค", "สมัครกันเข้ามาเยอะๆน้า 🎉🎉🎉"]
    
    @IBOutlet weak var tableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
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
        performSegue(withIdentifier: "segue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? SecondViewController
        let sender = sender as? IndexPath
        destinationVC?.keepTitle = dataTitle[(sender?.row)!]
        destinationVC?.keepDetail = dataDetail[(sender?.row)!]
    }
    
    @IBAction func insertRow(_ sender: Any) {
        print("a")
        let alertController = UIAlertController(title: "Insert new post", message: nil, preferredStyle: .alert)
        alertController.addTextField { (titleFill) in
            self.titleField = titleFill
            titleFill.placeholder = "add some title"
        }
        alertController.addTextField{ (descFill) in
            self.descField = descFill
            descFill.placeholder = "add some description"
        }
        let confirmAction = UIAlertAction(title: "Post", style: .default, handler: {(_) in
            self.dataTitle.append(self.titleField.text!)
            self.dataDetail.append(self.descField.text!)
            self.tableView.reloadData()
        })
        
        _ = UIAlertAction(title: "Post", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let txtInp = txtField.text{
                self.dataTitle.append(txtInp)
            }
        }
        let concelAction = UIAlertAction(title: "calcel", style: .cancel) { (_) in }
        alertController.addAction(confirmAction)
        alertController.addAction(concelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

