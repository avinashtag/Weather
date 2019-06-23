//
//  WeatherCell.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
