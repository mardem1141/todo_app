require 'rails_helper'

describe "User pages" do

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:project, user: user, name: "Foo") }
    let!(:p2) { FactoryGirl.create(:project, user: user, name: "Bar") }

    before { visit user_path(user) }

 
    

    describe "projects" do
      it { should have_content(p1.name) }
      it { should have_content(p2.name) }
      it { should have_content(user.projects.count) }
    end
  end

end