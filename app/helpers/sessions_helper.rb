module SessionsHelper
    def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end
  

  def edit_status(task)
    if task.status == "done" 
      task.status = nil
      flash[:success] = "Task created! "+task.name
    else
      task.status = "done"
      flash[:success] = "Task created! "+task.name+task.status
   
    end   
    return '#'
  end
   def current_user=(user)
    @current_user = user
  end

  def current_project=(project)
    @current_project = project
  end  

  def current_project
     @current_project ||= nil
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end
