# Palmprint_Recognition
This is the matlab implementation for BLPOC, Location based matching and DoG for reference points selection, the dataset used in this implementation is [CASIA Palmprint database](http://biometrics.idealtest.org/dbDetailForUser.do?id=5).
For more detailed information about this techniques applied here, please refer to this paper: [Performace Improvement of Phase-based Correspondence Matching for Palmprint Recognition](http://www.cv-foundation.org/openaccess/content_cvpr_workshops_2014/W01/papers/Roux_Performance_Improvement_of_2014_CVPR_paper.pdf).

***Notice:*** Database prerocessing (ROI cropping, rotation, normalization) is **not** in this implementation. 
## Getting started
You can start this code by typing:
```matlab
[dis, blpoc] = matching('filename',mode)
```
**`filename`** is actually a txt file, filled with lines of image paths in the following forms
`path\to\image\xxx0.jpg path\to\image\xxx1.jpg` with a *space* in between representing two images that are gonna be matched together.
**`mode`** specifies the approaches applied. `0` means location based method and `1` means applying DoG for reference points selection.
and this will return two vectors `dis` the score gained from the locations and `blpoc` for the average for BLPOC values of each corresponding image patches.


##Future work
Since this is the only starting version of this implementation of the paper, further reconstruction and revison will be done.
