class BlogPostsController < ApplicationController
	before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
  	@blog_posts = BlogPost.all
  end

  def show
    @comment = Comment.new #5.6
  end

  def edit
  end

  def new
  	@blog_post = BlogPost.new
  end

  def create
  	@Blog_post = BlogPost.new(blog_post_params)

  	respond_to do |format|
  		if @blog_post.save
  			format.html {redirect_to @blog_post, notices: "Blog Post was created successfully."}
  		else
  			format.html {render :edit}
  		end

  	end
  end

  def update
  	respond_to do |format|
  		if @Blog_post.update(blog_post_params)
  			format.html { redirect_to @blog_post, notice: "Blog post was updated successfully."}
  		else
  			format.html { render :edit}
  		end
  	end	
  end

  def destroy
	@Blog_post.destroy

	respond_to do |format|
			format.html { redirect_to blog_posts_url, notice: "Your blog post was Destroyed!"}
	end	

  end

  private 

	  def set_blog_post
	  	@Blog_post = BlogPost.find(params [:id])
	  end
	  	
	  def blog_post_params
	  	params.require(:blog_post).permit(:title, :blog_entry, :author)
	  		
	  end	
end
