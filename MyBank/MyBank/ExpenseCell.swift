//
//  ExpenseCell.swift
//  MyBank
//
//  Created by Test on 6/14/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class ExpenseCell: UITableViewCell {
    
    @IBOutlet weak var exp_date: UILabel!
    @IBOutlet weak var exp_price: UILabel!
    @IBOutlet weak var exp_name: UILabel!
    
    @IBOutlet weak var exp_image: UIImageView!
    
    
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
       
        backgroundColor = .clear // very important
       
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30))
        
        contentView.layer.masksToBounds = false
               contentView.layer.shadowOpacity = 0.23
               contentView.layer.shadowRadius = 4
               contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
               contentView.layer.shadowColor = UIColor.black.cgColor
        
        contentView.layer.cornerRadius = 5.0
        selectionStyle = .none
        
        
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.23
//        layer.shadowRadius = 4
    }
    
    
    
    
    func setupCell() {
        
//        let imageView: UIImageView = UIImageView(frame:CGRect(x: 20, y: 0, width: 20, height: 20))
//        imageView.image = UIImage(named:"arrow")
//        imageView.contentMode = .scaleAspectFit
//
//        self.accessoryView = imageView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    required init?(coder: NSCoder) {
//
//         super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
