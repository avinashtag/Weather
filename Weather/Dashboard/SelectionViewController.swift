//
//  SelectionViewController.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol SelectionPresentationLogic
{
    func numberOfSections() -> Int
    func numberOfRowsInSection( section: Int) -> Int
    func titleForRowAt( indexPath: IndexPath) -> (String, UITableViewCell.AccessoryType)
    func didSelectRowAt( indexPath: IndexPath)
}

class SelectionViewController: UITableViewController {

    var presentationLogic: SelectionPresentationLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        self.tableView.backgroundView = backgroundImage
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presentationLogic?.numberOfSections() ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentationLogic?.numberOfRowsInSection(section: section) ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectionIdentifier", for: indexPath) as? SelectionCell else{
            return UITableViewCell()
        }

        let (name, accessory) = (presentationLogic?.titleForRowAt(indexPath: indexPath))!
        cell.name.text = name
        cell.accessoryType = accessory
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentationLogic?.didSelectRowAt(indexPath: indexPath)
    }


    public func prefferedSize(maxSize: CGSize) -> CGSize{
        
        var contentSize = self.tableView.contentSize
        if contentSize.width  > maxSize.width {
            contentSize.width = maxSize.width
        }
        if contentSize.height  > maxSize.height {
            contentSize.height = maxSize.height
        }
        return contentSize
    }

}

class SelectionCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
}
