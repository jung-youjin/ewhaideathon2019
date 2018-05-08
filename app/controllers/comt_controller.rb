class ComtController < ApplicationController
  def com_create
    
    @com = Comment.new
    authorize! :write, @com
    @com.name = current_user.nickname
    @com.user_id = current_user.id
    @com.content = params[:com_content]
    @com.post_id =params[:post_id]
    @com.save
    
    redirect_to "/home/clickIdea/#{params[:post_id]}"
  end

  def com_destroy
    
    @com=Comment.find(params[:com_id])
    @com.destroy
    redirect_to "/home/clickIdea/#{params[:post_id]}"
  end
end
