class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to articles_path, notice: "Logged in successfully" }
        format.json { render :show, status: :created, location: login_path }
      else
        format.html { redirect_to login_path,  notice: "Log in failed" }
        format.json { render json: ["Login unsuccessful"], status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      if session[:user_id] == nil
        format.html { redirect_to root_path, notice: "Logged out" }
        format.json { render :show, status: :destroyed, location: logout_path }
      else
        format.html { redirect_to articles_path,  notice: "Log out failed" }
        format.json { render json: ["Logout unsuccessful"], status: :unprocessable_entity }
      end
    end
  end

end