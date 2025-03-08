import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormVC? {
        return AthleteFormVC(coder: coder, athlete: nil)
    }
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormVC? {
        let athletesToEdit: Athlete?
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            athletesToEdit = athletes[indexPath.row]
        } else {
            athletesToEdit = nil
        }
        return AthleteFormVC(coder: coder, athlete: athletesToEdit)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    
    @IBAction func unwindToAthleteTableViewController(segue: UIStoryboardSegue) {
        guard let athleteFormVC = segue.source as? AthleteFormVC, let athlete = athleteFormVC.athlete
        else {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
    }
}
