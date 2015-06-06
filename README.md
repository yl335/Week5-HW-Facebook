CodePath Week 5 Homework - Facebook Prototype
============================================

Tumblr feed photo to full photo page, page through photos in scroll view, zoom-in and out

Total hours: 7

##### All required stories #####
* Tapping on a photo in the news feed should expand the photo full screen.
* Tapping the Done button should animate the photo back into its position in the news feed.
* On scroll of the full screen photo, the background should start to become transparent, revealing the feed.
* If the user scrolls a large amount and releases, the full screen photo should dismiss.

##### All option stories #####
* The full screen photo should be zoomable.
* The user should be able to page through the other photos in full screen mode.

##### Known issues #####
* Once a photo is zoomed in and then fully zoomed out (back to 1.0 scale), I can no longer scroll down to dismiss the modal.
* In the feed view, the photos have "Aspect fill", but once in the photo view they should have "Aspect fit". However, I can't easily make the transition work. Therefore I used "Aspect fill" for both views. Doing so crops photos that are in landscape orientation.


![Video Walkthrough](Walkthrough.gif)


GIF created with [LICEcap](http://licecap.en.softonic.com/ "Download LICEcap").
