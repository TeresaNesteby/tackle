class Teacher < ActiveRecord::Base

  email_regex = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  validates :first_name,  :presence => true,
            :length                 => { :maximum => 15}
  validates :last_name,   :presence => true,
            :length                 => { :maximum => 15}

  validates :email,       :presence => true,
            :format                 => { :with => email_regex },
            :uniqueness             => { :case_sensitive => false }

  validates :password,    :presence => true,
            :confirmation           => true,
            :length                 => { :within => 5..40 }

  before_save :password

  def self.authenticate(email, password)
    teacher = Teacher.find_by(email: email)


    if !teacher.nil? && teacher.password == password
      teacher
    else
      teacher = nil
    end
  end

  def sign_in(teacher)
    session[:teacher_id] = teacher.id
    current_teacher = teacher
  end
end
