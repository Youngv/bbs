# coding: utf-8
require 'will_paginate/array'
class PostsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show]
  skip_before_filter :current_user, only: [:index, :show]
  before_filter :signin?
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("created_at desc").paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @author = @post.user
    @comments = @post.comments.includes(:user)

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    if !params[:board].blank?
      @post.board_id = params[:board]
      @board = Board.find_by_id(params[:board])
      if @board.blank?
        render_404
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = User.find(session[:user_id])
    User.increment_counter(:posts_count, @user.id)
    @post = @user.posts.new(params[:post])
    @post.board_id = params[:board] || params[:post][:board_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '文章成功发布.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: '文章编辑成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
