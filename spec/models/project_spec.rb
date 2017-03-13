require 'rails_helper'

describe Project do

  let(:user) { FactoryGirl.create(:user) }
  before { @project = user.projects.build(name: "Lorem ipsum") }
  
  subject { @project }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end
  
   describe "with blank name" do
    before { @project.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @project.name = "a" * 101 }
    it { should_not be_valid }
  end

end