class CommentsController < ApplicationController
  
  def create
    @image = Image.find(params[:comment][:image_id])
    if user_signed_in?
      @user = current_user
    else
      @user = User.find_by_ip(request.remote_ip)
    end
    @comment = @image.comments.new
    @comment.user = @user
    @comment.image = @image
    @comment.body = params[:comment][:body]
    
    @comments = Comment.where(:image_id => @image, :user_id => @user)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to album_image_path(@image.album, @image), notice: 'Question was successfully created.' }
        format.js
      else
        format.html { redirect_to album_image_path(@image.album, @image), notice: 'Question was unsucessful.' }
        format.js
      end
    end
  end
end