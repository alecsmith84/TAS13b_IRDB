//
//  DetailViewController.swift
//  IRDb
//
//  Created by Alec Smith on 3/18/19.
//  Copyright © 2019 Alec Smith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet weak var title: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortDesc: UILabel!
    @IBOutlet weak var Year: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var network: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var NavBarTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = NavBarTitle {
                label.title = detail.name
            }
            if let label = detailDescriptionLabel {
                label.text = detail.summary
            }
            if let label = titleLabel {
                label.text = detail.name
            }
            if let label = shortDesc {
                label.text = detail.description
            }
            // you want it to display the year and if it is still going or not
            if let label = Year {
                // check to see if the show has ended
                if detail.yearEnd != nil {
                    label.text = detail.yearStart + " - " + (detail.yearEnd ?? " ")
                } else {
                    label.text = detail.yearStart + " - "
                }
             }
            if let label = format {
                label.text = detail.format
            }
            if let label = network {
                label.text = detail.network
            }
            // you want this to show the number of episodes unless it is a movie
            if let label = episode {
                if detail.format == "Movie" {
                    label.text = " "
                } else {
                    label.text = String(describing: detail.episodes ?? 0) + " Episodes"
                }
            }
            if let label = Image {
                let imgurl = URL(string: detail.imageURL)
                let data = try! Data(contentsOf: imgurl!)
                label.image = UIImage(data: data)
            }
        }
    }


    var detailItem: Entry? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

