## Plan

0. General UML Structure
1. Format Data
2. Run code with new data
3. how to make model more accurate
4. GUI Interface, how to hand over data

## Parser 

### UML Diagram
![image](https://user-images.githubusercontent.com/104830903/236814358-cfdb0dc5-e1ae-4bf3-9ce6-47991fbc8bb3.png)

- reads dataset, opens as csv
- format:
  - General: transform symptom/not symptom -> 0 and 1
  - [ ] Heart Disease: how to transform
  - [ ] Diabetes: how to transform
  - [ ] Lumpy Skin: how to transform

## Bagged Tree Forest

### Pruning
https://de.mathworks.com/help/stats/improving-classification-trees-and-regression-trees.html

- pre-pruning:
  - give it a max depth, it wont grow more
	- min samples required to split decision node (could be split further) -> they only split if there are a number of samples left
  - minimum samples at leaf
	- max features to consider when making a split
- post-pruning:
	- divide training data into training & validation set
	- prune nodes, check performance -> if accuracy of pruned tree in validation set greater than in training -> done

- [ ] decide how to prune (pre/post pruning)
- [ ] test how much to prune, where

- feed data to trees 

- [ ] HOW TO PREVENT OVERFITTING

## Interface to GUI

- [ ] how to give output over to GUI
- [ ] beforehand: write test method that simulates input so we can test model accuracy with arbitary data
