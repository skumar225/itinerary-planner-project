class CompanionsController < ApplicationController
  before_action :confirm_logged_in, only: [:index]
  # before_action :prevent_login_signup, only: [:signup, :login]


  def signup
    @companion = Companion.new
  end

  def create
    @companion = Companion.create(companion_params)
    if @companion.save
      session[:companion_id] = @companion.id
      flash[:success] = "You are now logged in!"
      redirect_to plans_path
    else
      render :signup
    end
  end

  def login
  end

  def attempt_login

    if params[:email].present? && params[:password].present?
      found_user = Companion.find_by_email params[:email]
      if found_user
        authorized_user = found_user.confirm params[:password]
      end
    end

    if !found_user
      flash.now[:alert] = "Invalid email"
      redirect_to root_path

    elsif !authorized_user
      flash.now[:alert] = "Invalid password"
      redirect_to root_path

    else
      session[:companion_id] = authorized_user.id
      redirect_to plans_path, flash: {success: "You are now logged in."}
    end

  end


  def logout
    session[:companion_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end


  private
  def companion_params
    params.require(:companion).permit(:first_name, :last_name,:email, :password, :password_digest)
  end

  def confirm_logged_in
    unless session[:companion_id]
      redirect_to root_path, alert: "Please log in"
    end
  end

  def prevent_login_signup
    if session[:companion_id]
      redirect_to root_path
    end
  end

end





  

  
