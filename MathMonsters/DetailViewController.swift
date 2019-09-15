

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var weaponImageView: UIImageView!

  var monster: Monster? {
    didSet {
      refreshUI()
    }
  }

  func refreshUI() {
    loadViewIfNeeded()
    nameLabel.text = monster?.name
    descriptionLabel.text = monster?.description
    iconImageView.image = monster?.icon
    weaponImageView.image = monster?.weaponImage
  }

}

extension DetailViewController: MonsterSelectionDelegate {
  func monsterSelected(_ newMonster: Monster) {
    monster = newMonster
  }
}
