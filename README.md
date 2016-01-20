
## BackTopButton
##### TableView作为一个常用的控件，几乎覆盖了我们每一个页面，随着数据的增多Cell也会大量堆积，所以返回顶部的按钮也就越来越被广泛使用,所以我封装了一个返回顶部按钮，只需一行代码就可以返回TableView的顶部，不过要保证你是加在了当前页面的最上层~否则将看不到按钮哦~亲
###### 直接上代码 将tableView替换为你自己的tableView
`BackToTopButton.addBackButton(self, scrollView: tableView)`
###自定义效果
- 因为TablView继承自SrollView 所以形参直接定义的SrollView
- 如果想改变图标只需DEMO Source路径下的图标替换
- 图标默认在用户下滑scrollView.contentOffset >= 200 时出现如果想改变 可以直接在BackTOTopButton.swift文件中的observeValueForKeyPath方法的判断中直接修改，因为要保持风格统一，所以并没有开放修改出现偏移量的接口
- 如果想改变返回顶部按钮在Y轴上的位置可以直接在上面的一行代码中在加一个参数：offsetY:CGFloat = x  x写你想要增加的位置 代码：

`BackToTopButton.addBackButton(self, scrollView: tableView,offsetY: 10)`
