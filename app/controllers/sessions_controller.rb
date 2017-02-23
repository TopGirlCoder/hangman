class SessionsController < ApplicationController

  def new
  end  
  
  # Create a user session
  def create
	  @user = User.find_by(email: session_params[:email])
	  if @user && @user.authenticate(session_params[:password])
	    session[:user_id] = @user.id
      respond_to do |format|
       format.html { redirect_to root_path }
       format.js { }
      end   
	  else
		  @error = "Your password or email is incorrect. Please try again."
		  redirect_to new_session_path
	  end
  end

  # Destroy a user session
  def destroy
    cookies.delete(:user_id)
    session.delete(:user_id)
    @current_user = nil
	  redirect_to root_path
  end	

  # Keep session parameters private
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end	

end
