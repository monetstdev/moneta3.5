class MeisaiController < ApplicationController
  def index
    kouza_id = params[:kouza_id]
    @kouza = Kouza.find(kouza_id)
    @meisai = Meisai.where(kouza_id: kouza_id)
    render :index
  end
end
