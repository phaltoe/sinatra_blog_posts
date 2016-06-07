class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all

    erb :'/posts/index'
  end

  get '/posts/new' do
    @tags = Tag.all

    erb :'/posts/new'
  end

  post '/posts' do
    post = Post.new(params[:post])
    post.save

    redirect ("/posts/#{post.id}")
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @tags = Tag.all
    @post = Post.find(params[:id])

    erb :'/posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])

    redirect ("posts/#{@post.id}")
  end

  delete '/posts/:id/delete' do 
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end
end
