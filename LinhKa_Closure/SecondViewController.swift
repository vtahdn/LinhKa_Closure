//
//  SecondViewController.swift
//  LinhKa_Closure
//
//  Created by Viet Asc on 10/30/18.
//  Copyright © 2018 Viet Asc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        destinationClosure(imgs, indexPath.row) { (data, index) in
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data)
                cell.textLabel?.text = "Linh Ka Photo No \(index + 1)"
                cell.backgroundColor = .black
                cell.textLabel?.textColor = .white
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    var imgs = [String]()
    var destinationClosure = { (_ imgs: [String], _ index: Int, _ subClosure: @escaping (_:Data, _: Int) -> ()) -> () in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
