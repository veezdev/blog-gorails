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

  # GET /blog_posts/new
  # renders a form for creating a new blog post
  # will initialize a new blog post object and pass it to the view
  def new
    @blog_post = BlogPost.new
  end

  # POST /blog_posts
  # will create a new blog post with the parameters from the form
  # if the blog post is saved successfully, redirect to the show page for that blog post (saved in the database)
  # if the blog post is not saved successfully, render the new form again with the errors (validation errors) and a status of unprocessable_entity (422)
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /blog_posts/:id/edit
  # will render a form for editing an existing blog post
  # will find the blog post by id and pass it to the view
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  # PATCH/PUT /blog_posts/:id
  # will update an existing blog post with the parameters from the form
  # if the blog post is updated successfully, redirect to the show page for that blog post
  # if the blog post is not updated successfully, render the edit form again with the errors (validation errors) and a status of unprocessable_entity (422)
  def update
    @blog_post = BlogPost.find(params[:id])

    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use strong parameters to whitelist the attributes that can be mass-assigned
  # This is a security feature in Rails that prevents mass assignment vulnerabilities.
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
