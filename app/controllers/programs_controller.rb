class ProgramsController < ApplicationController
  def index
    @programs = Program.all.includes(:personalities, :station, corners: :songs)
  end
end
