class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  # GET /blog_posts/:id
  # if the blog post is not found, redirect to the index page
  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
