class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@album = Album.new
	end

	def edit
		@album = Album.find(params[:id])
	end

	def create
		
	end

	def update

	end
end
