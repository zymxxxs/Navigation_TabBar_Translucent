# Navigation_TabBar_Translucent

###很多情况下，我们设置 navigationBar.translucent为YES的时候，navigationBar的背景色看起来与设计稿不一致。
###最简单的方法是设置 translucent 为 NO，于是 navigationBar 的背景色看起来与设计稿一致了，但是设计师可能会跟你吐槽这个navigationBar一点也不iOS7
###我们希望使用navBar还是可以透出高斯模糊后的背景并且和设计稿的颜色一致，那么可以使用以下方法。

##参考
**[如何在 iOS 7 中设置 barTintColor 实现类似网易和 Facebook 的 navigationBar 效果](http://www.tuicool.com/articles/ERBZb2)
**[Github allenhsu](https://github.com/allenhsu/CRNavigationController)

因为该作者是继承UINavigation来实现的，因为个人喜好，我做了一个category来实现。


## Requirements

* Xcode 6
* iOS 8
* ARC




