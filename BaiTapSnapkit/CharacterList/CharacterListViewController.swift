import UIKit
import SnapKit
class CharacterListViewController: UIViewController {
    private var characterListTableView = UITableView()
    private let dummyData = ToonCharacter.dummyData()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        navigationItem.title = "Character list"
        self.view .backgroundColor = .white
        self.view.addSubview(characterListTableView)
        characterListTableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.leading.equalToSuperview().offset(10)
            maker.trailing.equalToSuperview().offset(-10)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        characterListTableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        characterListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        characterListTableView.dataSource = self
        characterListTableView.delegate = self
    }

}
extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.configureWith(dummyData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row \(indexPath.row) with value \(dummyData[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVc = CharacterDetailViewController(character: dummyData[indexPath.row])
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

