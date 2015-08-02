class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :birthdate, presence: true

  has_many :events
  has_many :user_worksheets

  def self.lookup_user user_id
    User.find(user_id[:id].to_i)
  end

  def self.add_user! user_params
    User.create!(email: user_params[:email], password: user_params[:password], first_name: user_params[:first_name], last_name: user_params[:last_name], birthdate: user_params[:birthdate])
  end

  def edit_info! edit_params
    self.update!(email: edit_params[:email], password: edit_params[:password], first_name: edit_params[:first_name], last_name: edit_params[:last_name], birthdate: edit_params[:birthdate])
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    permissions.any?
  end

  def employee?
    permissions.none?
  end
end
