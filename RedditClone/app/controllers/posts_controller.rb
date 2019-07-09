class PostsController < ApplicationController
    def show
      @post = Post.find(params[:id])
      render :show
    end

    before_action :ensure_logged
    
    def new
      @post = Post.new
      render :new
    end

    def create
      #what makes a post is a title, url, content, user_id, sub_id
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
      render :edit
    end

    def update
      @post = current_user.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to post_url(@post.id)
      else  
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    end
    
    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to sub_url(@post.sub.id)
    end

    private

    def post_params
      params.require(:post).permit(:title, :url, :content, :sub_id)
    end
end 