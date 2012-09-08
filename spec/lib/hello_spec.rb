require 'spec_helper'

describe Hello do
  describe "#speak" do
    it "should say 'Hello friend'" do
      h = Hello.new
      h.speak("friend").should be "Hello friend"
    end
  end
end
