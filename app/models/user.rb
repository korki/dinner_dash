class User < ActiveRecord::Base
 authenticates_with_sorcery!
 validates_confirmation_of :password, message: "should match confirmation", if: :password

 def admin?
  self.role == 1
 end
end
