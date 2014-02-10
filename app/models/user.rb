class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates_length_of :display_name, :minimum => 2, :maximum => 32, :allow_blank => true

  has_many :orders

  def admin?
    self.role == 1
  end
end
