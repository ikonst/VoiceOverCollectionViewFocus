import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIAccessibilityElementFocused, object: nil, queue: OperationQueue.main, using: { el in
            let viewUnfocused = el.userInfo?["UIAccessibilityUnfocusedElementKey"] as AnyObject
            let viewFocused = el.userInfo?["UIAccessibilityFocusedElementKey"] as AnyObject
            print("--------- \(viewUnfocused.accessibilityFrame) -> \(viewFocused.accessibilityFrame)")
        })
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
        }
    }
}

