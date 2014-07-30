class PomodorosController < ApplicationController
skip_before_filter  :verify_authenticity_token

def index
  @pomodoros = Pomodoro.all
  
  respond_to do |format|
    format.html { render :html => @pomodoros }
    format.json{ render :json => @pomodoros }
  end
end

def create
  @pomodoro = Pomodoro.new
  @pomodoro.user = params[:pomodoro][:user]
  @pomodoro.task = params[:pomodoro][:task]
  
  puts "------------------------------->"
    puts params[:pomodoro]
    puts @pomodoro.user
    puts @pomodoro.task
  puts "------------------------------->"
  
  respond_to do |format|
    if @pomodoro.save
      format.json { render :json => @pomodoro }
    else
      format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
    end
  end

  # respond_to do |format|
  #   format.json { render :json => Pomodoro.first }
  # end
  # @pomodoro = Pomodoro.new
  # @pomodoro.user = params[:pomodoro][:user]
  # @pomodoro.task = params[:pomodoro][:task]
  #   
  # if @pomodoro.save
  #   format.json { render json: @pomodoro, status: :created }
  # else
  #   format.json { render json: @pomodoro.errors, status: :unprocessable_entity }
  # end
  #format.json { render :json => @pomodoro }
  # @user = current_user
  # @workout = @user.workouts.build(params[:workout])
  # @workouts =  @user.workouts.order("created_at desc")
  # respond_to do |format|
  #   if @workout.save
  #     format.html { redirect_to workouts_path, notice: 'Workout successfully created.' }
  #     format.json { render json: @workout, status: :created, location: workout_path(@workout) }
  #   else
  #     format.html { render action: "new" }
  #     format.json { render json: @workout.errors, status: :unprocessable_entity }
  #   end
  # end
end

end
