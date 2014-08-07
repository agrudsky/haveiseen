class PagesController < ApplicationController
  
  def home
  end
  
  def sign_in
    session['username'] = params['username']
    redirect_to '/greet'
  end
  
  def sign_out
    reset_session
    redirect_to '/greet'
  end
end