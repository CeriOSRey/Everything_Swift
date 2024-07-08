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
- cons: keep track of tags

## 6. What is the difference between @IBOutlet and @IBAction?
- IBOutlet is a keyword added to a property that is a view in the Interface Builder
- IBAction is the method that handles action or gestures done to a view in the Interface Builder

## 7. What is the difference between a UIImage and a UIImageView?
- UIImage is the actual image while UIImageView is the view that displays the image.

## 8. What is the difference between aspect fill and aspect fit when displaying an image?
- aspect fit ensures all parts of the image are visible even if it means there is some space around the edges, whereas aspect fill may crop the image to ensure it takes up all available space.

## 9.  What is the purpose of UIActivityViewController?
- when sharing data, you tell UIActivityViewController what kind of data you want to share, and it figures out how best to share it.

## 10. 


## 11. 


## 12. 


## 13. 


## 14. 


## 15. 


## 16. 


## 17. 

