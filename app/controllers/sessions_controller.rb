class SessionsController < ApplicationController

  def new
    #login form

  end

  def create
    #actually try and log in
    @form_data = params.require(:session)

    #pull out the username and password from the form data
    @username = @form_data[:username]
    @password = @form_data[:password]

    #lets check the user is who they say they Are
    @user = User.find_by(username: @username).try(:authenticate, @password)

    #if ther is a user present
    if @user
      #save this user to that users sessions
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render "new"
    end

  end

  def destroy
    #log us out
    #remove the session completely
    reset_session
    #redirect_to login page_title
    redirect_to new_session_path
  end

end
