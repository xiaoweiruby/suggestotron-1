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
