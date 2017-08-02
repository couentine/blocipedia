class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :wikis
         

  before_save { self.email = email.downcase }
  after_initialize { self.role ||= :member }

  enum role: [:member, :premium, :admin]
end
