class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find( params[:id] )
    end

    def new
        @post = Post.new
    end

    def create
        # render plain:  params[ :posts ].inspect
        @post = Post.new(posts_params)

        if(@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end 

    def edit
        @post = Post.find( params[:id] )
    end

    def update
        @post = Post.find( params[:id] )

        if @post.update(params.require(:post).permit(:title,:body))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find( params[:id])

        @post.destroy

        redirect_to posts_path
    end
    
    private 
        def posts_params
            params.require(:posts).permit(:title,:body)
        end
end
