//
//  NewsTableViewCell.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let cellId = "NewsTableViewCell"
    
    @IBOutlet weak var newsProviderLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDedcriptionLabel: UILabel!
    @IBOutlet weak var newsWebUrl: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
