# Flutter 动画
Flutter的界面每一个状态都是一帧。

## Animation类
Flutter的动画，说白了，就是Animation<T>对象产生一系列连续的Widget某个显示属性的中间值对应的widget的属性通过animation.value来赋值，每产生一个值就调用setState来刷新界面
  
Animation<T>对象每产生一个中间值，都是告诉它的Listener. addListener对象可以监听到Animation<T>对象的值变化。animation.value就是当前值。

addStatusListener 可以监听animation对象的状态变化，开始，结束等等，有一个枚举定义。添加这个监听可以在动画执行完后再反向执行，等等，看自己的业务需求。

了解了这一点后，主要是要学习如果让Animation<T>对象产生各种各样的值。可以是位置的double类型，可以是颜色的Color,等等。