

import UIKit

protocol MonsterSelectionDelegate: class {
    func monsterSelected(_ newMonster: Monster)
}

class MasterViewController: UITableViewController {
    
    let monsters = [
        Monster(name: "Cat-Bot", description: "MEE-OW",
                iconName: "meetcatbot", weapon: .sword),
        Monster(name: "Dog-Bot", description: "BOW-WOW",
                iconName: "meetdogbot", weapon: .blowgun),
        Monster(name: "Explode-Bot", description: "BOOM!",
                iconName: "meetexplodebot", weapon: .smoke),
        Monster(name: "Fire-Bot", description: "Will Make You Steamed",
                iconName: "meetfirebot", weapon: .ninjaStar),
        Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
                iconName: "meeticebot", weapon: .fire),
        Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                iconName: "meetminitomatobot", weapon: .ninjaStar)
    ]
    
    weak var delegate: MonsterSelectionDelegate?
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return monsters.count
        } else {
            return 1;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let monster = monsters[indexPath.row]
            cell.textLabel?.text = monster.name
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "secondCustomCell", for: indexPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = monsters[indexPath.row]
        delegate?.monsterSelected(selectedMonster)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 700
        }
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}
