#  UIKit

## 1. How are XIBs different from storyboards?
- XIBs are for specific views while Storyboards can contain multiple views, controllers and segues

## 2. How would you explain UIKit segues to a new iOS developer?
- Segues are how you do Navigation when using Storyboards
```
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let selectedPath = tableView.indexPathForSelectedRow else { return }
    if let target = segue.destination as? UserViewController {
        target.selectedUser = selectedPath.row
    }
}
```
- alternatively, you can navigate using UINavigationController.pushViewController(:)

## 3. What are storyboard identifiers for?
- Identify a viewcontroller in a storyboard file. Used to instantiate a VC using a storyboard.

## 4. What are the benefits of using child view controllers?
- We can keep our common methods, views and properties in a parent controller for reusability.

## 5. What are the pros and cons of using viewWithTag()?
- `viewWithTag()` are used to identify the views using tags.
- pros: can identify views using tags
- cons: keeping track of tags can get challenging

## 6. What is the difference between @IBOutlet and @IBAction?
- IBOutlet is a keyword added to a property that is a view in the Interface Builder
- IBAction is the method that handles action or gestures done to a view in the Interface Builder

## 7. What is the difference between a UIImage and a UIImageView?
- UIImage is the actual image while UIImageView is the view that displays the image.

## 8. What is the difference between aspect fill and aspect fit when displaying an image?
- aspect fit ensures all parts of the image are visible even if it means there is some space around the edges, whereas aspect fill may crop the image to ensure it takes up all available space.

## 9.  What is the purpose of UIActivityViewController?
- when sharing data, you tell UIActivityViewController what kind of data you want to share, and it figures out how best to share it.

## 10. What is the purpose of UIVisualEffectView?
- Adds and animate visual effects ie. blur effect


## 11. What is the purpose of reuse identifiers for table view cells?
- reuse identifier is used by the tableview to register and reuse a tableview cell.

## 12. When would you choose to use a collection view rather than a table view?
- when you need multiple columns. Horizontal scroll, circular layout, tiled layout, etc.

## 13. Which parts of UIKit are you least familiar with?
- notifications, I did notifications in 2019 and haven't have the chance to touch that feature again.

## 14. How does a view's intrinsic content size aid in Auto Layout?
- allow views to have a natural width and height without us forcing one. For Auto Layout to work it must know where each view is positioned precisely: its X, Y, width, and height values.

## 15. What is the function of anchors in Auto Layout?
- The best bit about working with anchors is that they can be created relative to other anchors.
-Every UIView has a set of anchors that define its layouts rules. The most important ones are widthAnchor, heightAnchor, topAnchor, bottomAnchor, leftAnchor, rightAnchor, leadingAnchor, trailingAnchor, centerXAnchor, and centerYAnchor.

## 16. What is the purpose of IBDesignable?
- provides functionality for live rendering of changes of our custom views directly in a Storyboard or . xib

## 17. What is the purpose of UIMenuController?
- an easy way to give the user copy/paste menu features in an app. You can also use it to expose custom features like saving, viewing, or deleting content.
