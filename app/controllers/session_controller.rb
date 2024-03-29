class SessionController < ApplicationController
	def new
	end

	  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Email ou mot de passe invalide'
      render 'Nouveau'
    end
  end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end
