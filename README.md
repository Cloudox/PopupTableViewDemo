# PopupTableViewDemo
带有cell弹出动画效果的TableView

发现一个简单的方式可以让TableView变得非常的炫酷，语言描述太苍白，直接看图吧：

![](https://github.com/Cloudox/PopupTableViewDemo/blob/master/PopupTableView.gif)

在任何有cell先出现在屏幕上的时候都会有这么一个效果，非常的流畅，也非常有意思（忍不住不停地把玩。。）。实现起来也非常简单，iOS原生支持，几行代码就可以搞定，在众多的tableview代理方法中，我们利用下面这个方法：

```objective-c
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
```

这个方法是在cell即将显示时对indexpath位置的cell进行操作，我们就在这个方法里面加上动画代码，这个动画说白了就是把cell从一个小的变成正常大小，使用UIView简单动画就可以实现（关于UIView简单动画可以看我这篇博客：[iOS基础动画教程](http://blog.csdn.net/cloudox_/article/details/50736092)）。代码如下：

```objective-c
//给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
```

在平常的tableview代码中加上这个方法就可以实现了，很简单吧，但是效果还是很棒的！可以点击查看我的[示例工程](https://github.com/Cloudox/PopupTableViewDemo)

[我的博客](http://blog.csdn.net/cloudox_/article/details/51244727)
