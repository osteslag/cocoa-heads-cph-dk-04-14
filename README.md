# README

This repository contains the code and presentation I gave at [the CocoaHeads meet-up in Copenhagen on April 14, 2014](http://www.meetup.com/CopenhagenCocoa/events/166261632/). It does *not* contain the custom tab bar classes I showed, as these are not for public consumption.

There are two commits on the master branch.

1. The first features the `UITabBarController` instance without transition animation.

2. The second features the same tab bar controller, but with a `JBAnimatedTabTransition` *animation controller* to perform a transition animation.

The presentation went on to show how we could plug in the `JBAnimatedTabTransition` class, without modifications, to animate the transition of the custom tab bar controller class (a `UIViewController` subclass).

---

- The presentation was done with [Deckset](http://www.decksetapp.com).
- Tab bar icons are from [Pixeden](http://www.pixeden.com/media-icons/tab-bar-icons-ios-7).
