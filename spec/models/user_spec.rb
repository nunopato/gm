require 'spec_helper'

describe User do
  before { @user = User.new(name: "Gadget Manager Nuno Pato", email: "nunopato@applift.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

end
