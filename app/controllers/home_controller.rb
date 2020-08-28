class HomeController < ApplicationController
  def index
    @programs = Program.all.includes(:personalities, :station, :program_songs, :songs, corners: :songs)
  end
end
