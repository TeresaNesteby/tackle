module SessionsHelper

  def sign_up(teacher)
    session[:teacher_id] = teacher.id
  end

  def current_teacher(teacher)
    @current_teacher = teacher
  end

  def current_teacher
    @current_teacher ||= User.find(session[:teacher_id]) if session[:teacher_id]
  end

  def signed_in?
    !current_teacher.nil?
  end

  def sign_out
    session[:teacher_id] = nil
    self.current_teacher = nil
  end

  def current_teacher?(user)
    teacher == current_teacher
  end
end
