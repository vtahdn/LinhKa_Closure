//
//  ViewController.swift
//  LinhKa_Closure
//
//  Created by Viet Asc on 10/30/18.
//  Copyright © 2018 Viet Asc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Url linggka photos links
    var imgs = ["https://scontent.fhan2-4.fna.fbcdn.net/v/t1.0-9/43503961_2383693015004916_2217386920801992704_n.png?_nc_cat=100&_nc_ht=scontent.fhan2-4.fna&oh=b40384248f4be71f6f57ef477629e28a&oe=5C3BD377",
                "https://scontent.fhan2-4.fna.fbcdn.net/v/t1.0-9/43450099_2382223308485220_8142815010289090560_n.jpg?_nc_cat=100&_nc_ht=scontent.fhan2-4.fna&oh=4ac442f0feafdff9f6953850e1ddc8bc&oe=5C860DA1",
                "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/42881021_2368149579892593_3520312086661955584_n.jpg?_nc_cat=106&_nc_ht=scontent.fhan2-2.fna&oh=66bed43ddffc0a73bef1e19e15803908&oe=5C41CC21",
                "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/42850113_2366508756723342_1269495373810892800_n.jpg?_nc_cat=106&_nc_ht=scontent.fhan2-2.fna&oh=3c0e54d0f2de867d0150508c684ba1f7&oe=5C509469",
                "https://scontent.fhan2-4.fna.fbcdn.net/v/t1.0-9/44961998_2419277084779842_2483965658144964608_n.jpg?_nc_cat=105&_nc_ht=scontent.fhan2-4.fna&oh=b1c946eca748c68d85937f9a29174ba4&oe=5C824BF0"]
    
    // load closure
    var loadClosure = { (_ imgs: [String], _ index: Int, _ subClosure: @escaping (_:Data, _: Int) -> () ) -> () in
        DispatchQueue.global().async {
            if let url = URL(string: imgs[index]) {
                if let data = try? Data(contentsOf: url) {
                    subClosure(data, index)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondViewSegue" {
            let destinationView = segue.destination as! SecondViewController
            destinationView.destinationClosure = loadClosure
            destinationView.imgs = imgs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

