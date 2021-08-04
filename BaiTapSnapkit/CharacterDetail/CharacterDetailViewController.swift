import UIKit

class CharacterDetailViewController: UIViewController {
    
    let character: ToonCharacter
    let avartarImageView = UIImageView.rounded(size: CGSize(width: 200, height: 200))
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    init(character: ToonCharacter) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadCharacter()
    }
    
    private func loadCharacter() {
        avartarImageView.load(urlString: character.avartarUrl)
        titleLabel.text = character.name
        descriptionLabel.text = character.description
    }
    
    private func setupUI() {
        navigationItem.title = "Character Detail"
        self.view .backgroundColor = .white
        setupLabels()
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(avartarImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        avartarImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
    
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avartarImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupLabels() {
        titleLabel.numberOfLines = 1
        descriptionLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 27)
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
    }

}
