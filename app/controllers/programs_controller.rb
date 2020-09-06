class ProgramsController < ApplicationController
  def index
    @programs = Program.all.includes(:personalities, :station, corners: :songs).order(:day)
    @stations = Station.select(:name).distinct

    if params[:sort]
      program_ids = Station.where(name: params[:sort]).pluck(:program_id)
      @programs = @programs.where(id: program_ids)
    end
  end
end
