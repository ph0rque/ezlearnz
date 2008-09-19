require File.dirname(__FILE__) + "/../spec_helper"

describe Lesson do
  fixtures :subjects, :chapters, :lessons
  
  before do
    @lesson = lessons(:addition_1)  
  end
  
  it "should be able to access its chapter" do
    @lesson.chapter.should == chapters(:math_1)
  end
  

end