//
//  CYListTableViewCell.swift
//  CYTableViewCellHeight
//
//  Created by cyan on 2018/10/25.
//  Copyright © 2018年 cyan. All rights reserved.
//

import UIKit

class CYListTableViewCell: UITableViewCell {

    var iconImageV: UIImageView!
    var contentLab: UILabel!
    var showView: UIView!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
        loadLayout()

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createUI()
        loadLayout()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func createUI() {
        
        let iconImageV  = UIImageView(frame: .zero)
        iconImageV.backgroundColor = UIColor.yellow
        self.contentView.addSubview(iconImageV)
        self.iconImageV = iconImageV
        
        let contentLab = UILabel(frame: .zero)
        contentLab.backgroundColor = UIColor.red
        contentLab.textColor = UIColor.yellow
        contentLab.font = UIFont.systemFont(ofSize: 14)
        contentLab.numberOfLines = 0
        self.contentView.addSubview(contentLab)
        self.contentLab = contentLab
        
        let showView = UIView(frame: .zero)
        showView.backgroundColor = UIColor.cyan
        self.contentView.addSubview(showView)
        self.showView = showView
    }
    
    func loadLayout() {
        
        self.iconImageV.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.left.equalTo(5)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        self.contentLab.snp.makeConstraints {
            $0.top.equalTo(self.iconImageV)
            $0.left.equalTo(self.iconImageV.snp.right).offset(10)
            $0.right.equalTo(self.contentView).offset(-10)

        }
 
        self.showView.snp.makeConstraints {
            $0.top.equalTo(self.contentLab.snp.bottom).offset(10)
            $0.left.equalTo(self.contentLab)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
            $0.bottom.equalTo(self.contentView.snp.bottom).offset(-10)

        }
        
    }

}


extension CYListTableViewCell {
      func configWithModel(_ model: CYListModel, indexRow: Int) {
        contentLab.text = model.content

        if indexRow % 2 == 0 {
            self.showView.snp.updateConstraints {
                $0.height.equalTo(100)
            }
        }else {
            self.showView.snp.updateConstraints {
                $0.height.equalTo(10)
            }
        }

    }
    
}


