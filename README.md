http://baohua.logdown.com/posts/1195624

投票添加扣分按钮并实现扣分功能
教程中有加分功能，仿照这个，依葫芦画瓢，扣分功能也不难实现

步骤 1：加一个新的 controller action 来投票扣分
编辑 app/controllers/topics_controller.rb 然后把以下这个 method 加在 controller 下方的 private keyword 之上：

```def downvote
   @topic = Topic.find(params[:id])
   @topic.votes.first.destroy
   redirect_to(topics_path)
end
```
其中@topic.votes.first.destroy这个是实现扣分 @topic.votes.create是实现加分

步骤 2：给投票扣分操作加一个 route，修改config/routes.rb
```
Rails.application.routes.draw do
  root 'topics#index'
  resources :topics do
    member do
      post 'upvote'
      post 'downvote'
    end
  end
  ```
其实就是在原有的投票加分代码的基础上增加了一行
post 'downvote'

步骤 3：在 view 里面加一个按钮
编辑 app/views/topics/index.html.erb文件
找到

```<%=button_to '+1',upvote_topic_path(topic), method: :post%>
在这行代码下边加一行代码
<td><%=button_to '-1',downvote_topic_path(topic), method: :post%></td>
然后就可以浏览多了一个扣分按钮
```

```
初级练习加分题，解决新增一个'about'页面
Published on: December 11, 2016
还是用Google的方法，找到了别人的解法，加以整理和理解，以下是我的解法：

1. 在主页面（index）最后，增加一个about按钮，并设置跳转的超链接
修改index.html.erb，如下：

app/view/topic/index.html.erb
<%= link_to 'About', about_path %>
2. 增加一个about页面，并添加内容
首先，创建一个新文件：

touch app/views/topics/about.html.erb
添加内容：

about.html.erb
<h1>About the site</h1>
<p>Welcome to our site!</p>
<%= link_to 'Back', topics_path %>
3. 然后，在routes.rb中加入一行代码，把about按钮指向about页面。
config/routes.rb
get 'about' => 'topics#about'
其中，routes.rb就像是一个地址簿，其中列出所有可以使用的地址，以及对应到的程式码。

4. 最后，在topics_controller.rb中加一个about的method。
app/controllers/topics_controller.rb
def about
end
（亲测，这步没有也没啥问题。）

搞掂。
```
```
http://yammy-blog.logdown.com/?page=21
https://railsbook.tw/chapters/13-crud-part-1.html
```
https://courses.growthschool.com/
