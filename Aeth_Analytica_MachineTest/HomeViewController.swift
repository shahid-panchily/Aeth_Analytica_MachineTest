//
//  ViewController.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController,modelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var atricles = [Articles]()
    var model = ApiModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getData()
        model.delegate = self
        
    }
    func atricleFetched(_ atricles: [Articles]) {
        self.atricles = atricles
        tableView.reloadData()
        
    }
    
    

}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atricles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellId, for: indexPath) as! NewsTableViewCell
        
        cell.newsProviderLabel.text = atricles[indexPath.row].source?.name
        cell.newsTitleLabel.text = atricles[indexPath.row].title
        cell.newsDedcriptionLabel.text = atricles[indexPath.row].description
        cell.newsWebUrl.text = atricles[indexPath.row].url
        let url = URL(string: atricles[indexPath.row].urlToImage!)
        cell.newsImageView.kf.setImage(with: url)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFormatterGet.date(from: atricles[indexPath.row].publishedAt!) {
            cell.dateLabel.text = dateFormatterPrint.string(from: date)
//            print(dateFormatterPrint.string(from: date))
        } else {
           print("There was an error decoding the string")
        }

        
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = (self.storyboard?.instantiateViewController(identifier: "WebViewViewController") as? WebViewViewController)!
        controller.arrayUrl = atricles[indexPath.row].url
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

