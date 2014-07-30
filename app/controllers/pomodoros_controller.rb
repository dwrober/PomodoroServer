class PomodorosController < ApplicationController


def index
  @pomodoros = Pomodoro.all
  
  respond_to do |format|
    format.json { render :json => @pomodoros }
  end
end


end
