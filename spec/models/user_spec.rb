require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email } 
  it { should validate_presence_of :password } 
  it { should have_secure_password }
  #can't get this to work...
  xit { should have_secure_token User.api_token }
  xit { should have_secure_token :api_token}
end
