class PostsController < ApplicationController
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
    
        respond_to do |wants|
            if (@post.save)
                wants.html { redirect_to :back, notice: "Post was successfully created." }
            else
                wants.html { redirect_to "", notice: "Error: Post Not Saved." }
            end
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:user_id, :content)    
    end
    
end