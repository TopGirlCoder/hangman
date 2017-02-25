class GuessesController < ApplicationController

def new
    @game = Game.find(params[:game_id])
    @user = User.find(params[:@game.user_id])
    @guess = @game.guesses.new
  end

  def create
  	p "CREATE"
  	p "*" * 40
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)
    respond_to do |format|
      if @guess.save
        format.html { redirect_to @guess, notice: 'guess was successfully created.' }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # def set_guess
    #   @user = User.find(params[:user_id])
    #   @game = @user.games.find(params[:id])
    # end

    def guess_params
      params.require(:guess).permit(:letter, :game_id)
    end  	
end
