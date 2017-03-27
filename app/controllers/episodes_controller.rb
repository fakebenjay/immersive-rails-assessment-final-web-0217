class EpisodesController < ApplicationController
  before_action :login

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end
end
