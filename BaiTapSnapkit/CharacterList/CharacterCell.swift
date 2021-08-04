import Foundation
import UIKit
import Nuke
class CharacterCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let avartarImageView = UIImageView.rounded(size: CGSize(width: 100, height: 100))

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
        guard contentView.subviews.isEmpty else {
            return
        }
        setupCard()
        setupLabels()
        layoutUI()
    }
    private func setupCard() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 4
        // border
        contentView.layer.borderWidth = 0.1
        contentView.layer.borderColor = UIColor.black.cgColor
        // shadow
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 4.0
        // optimize performance
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func layoutUI() {
        contentView.addSubview(avartarImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        avartarImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(100)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(avartarImageView)
            make.leading.equalTo(avartarImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-4)
            make.leading.equalTo(avartarImageView.snp.trailing).offset(20)
        }
    }
    
    private func setupLabels() {
        titleLabel.numberOfLines = 1
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    func configureWith(_ character: ToonCharacter) {
        titleLabel.text = character.name
        descriptionLabel.text = character.description
        avartarImageView.loadImageFromUrl(urlString: character.avartarUrl)
        layoutIfNeeded()
    }
}


