require_dependency "dmap/application_controller"

module Dmap
  class PostsController < ApplicationController

    before_filter :authenticate_user!, except: [:index, :show]
    before_filter :set_global_vars

    def set_global_vars
      @per_page = 2
    end

    def personal
      @posts = current_user.posts.paginate(:per_page => @per_page, :page => params[:page] || 1)

      respond_to do |format|
        format.html  { render action: "index" }
      end
    end

    def favorites
      @posts = current_user.favorite_posts.paginate(:per_page => @per_page, :page => params[:page] || 1)

      respond_to do |format|
        format.html  { render action: "index" }
      end
    end

    def index
      @title = ""
      per_page = @per_page

      if !params[:tag].nil? && params[:tag] != ""
        @title = "En " + params[:tag]
      end

      if !params[:search].nil? && params[:search] != ""
        if @title == ""
          @title = "Con: " + params[:search]
        else
          @title += " con: " + params[:search]
        end
      end

      @search = Post.search do
        keywords params[:search], :minimum_match => 3
        #fulltext params[:search] do
        #  highlight :title, :description_short, :description
        #end
        
        facet :tag_list      
        if params[:tag].present?
          with(:tag_list, params[:tag])
        end

        paginate :per_page => per_page, :page => params[:page] || 1
      end

      #@posts = @search.hits
      @posts = @search.results

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    end

    def get_all_tags
      tags = Post.tag_counts_on(:tags).collect{ |item| item.name }

      respond_to do |format|
        format.json { render :json => tags }
      end
    end

    def show
      @post = Post.find(params[:id])
      @similar_posts = @post.similar_posts

      if request.path != post_path(@post)
        redirect_to @post, status: :moved_permanently
        return 
      end

      @title_page = "ADN - #{@post.title}"

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
    end

    def new
      @post = Post.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @post }
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def create
      @post = Post.new(params[:post])
      @post.user_id = current_user.id

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'El articulo ha sido creado.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @post = Post.find(params[:id])

      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'El articulo ha sido actualizado.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end

    def add_to_favorites
      if user_signed_in?
        current_user.add_to_favorites(params[:id], params[:kind])
      end
    end

  end
end