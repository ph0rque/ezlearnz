require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do

 describe "edit_exam_q_and_as_path" do
    
    before(:each) do
      @exam = mock("exam", :class => Chapter, :to_param => 1)
      @q_and_a = mock("q_and_a", :to_param => 2)
    end
  
    it "should return an edit path to the proper exam type" do
      edit_exam_q_and_as_path(@exam, @q_and_a).should == "/chapters/1/q_and_as/2/edit"
    end
    
  end

end