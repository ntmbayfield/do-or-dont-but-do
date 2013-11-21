require 'spec_helper'

describe DodontsController, "basic routes testing" do

  before(:all) do
    @dodont = Dodont.new
    @dodont.content = "learn sublime shortcuts"
    @dodont.save
  end

  it "index action" do
    get :index
    expect(response.status).to eq 200
  end

  it "increments a do vote from the index" do
    params = { 'command' => "dont", 'id' => @dodont.id }
    expect { put :update, params }.to change { Dodont.last.donts }.by(1)
  end

  it "increments a dont vote from the index" do
    params = { 'command' => "do", 'id' => @dodont.id }
    expect { put :update, params }.to change { Dodont.last.dos }.by(1)
  end

  it "new action" do
    get :new
    expect(response.status).to eq 200
  end

  it "creates a new plain text dodont" do
    params = { "dodont" => { "content"=>"Hello1" }, "commit"=>"Post" }
    expect { post :create, params }.to change { Dodont.all.length }.by(1)
  end

end
