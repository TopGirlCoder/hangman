class GamesController < ApplicationController
	  before_action :set_game, only: [:show, :destroy]

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @game = @user.games.new
  end

  def create
    @user = User.find(params[:user_id])
    @game = @user.games.new(game_params)
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_game
      @user = User.find(params[:user_id])
      @game = @user.games.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:difficulty, :minimum_length, :maximum_length, :user_id)
    end
end	

