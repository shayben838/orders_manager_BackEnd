class Api::ConfigsController < ApplicationController

  def show
    render json: {
      polling_interval: AppConfig[:polling_interval],
      status_map_colors: AppConfig[:status_map_colors]
    }
  end

end