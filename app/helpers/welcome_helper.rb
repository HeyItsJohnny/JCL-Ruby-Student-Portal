module WelcomeHelper

  # Logs in the given user.
  def log_in(account)
    session[:account_id] = account.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Account.find_by(id: session[:account_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:account_id)
    @current_user = nil
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
