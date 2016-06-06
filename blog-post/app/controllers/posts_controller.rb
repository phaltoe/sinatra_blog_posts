class PostsController < ApplicationController

	get '/posts' do
		@posts = Post.all
		erb :'/posts/index'	
	end

	get '/posts/new' do
		erb :'/posts/new'
	end

	post '/posts' do 
		@post = Post.create(params[:post])

		redirect ("/posts/#{@post.id}")
		raise params.inspect
		# @post = Post.find_
	end

	get '/posts/:id' do
		@post = Post.find(params[:id])
		erb :'/posts/show'
	end
end
