# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Should we show the edit tab as a link in the sidebar for this page?
  def show_edit_tab_link?
    params[:action] != "index" && @controller.controller_name != "subjects" && @controller.controller_name != "lessons"
  end
 
  # Should we show the edit tab div in the sidebar for this page?
  def show_edit_tab_div?
    params[:action] != "index" && (@controller.controller_name == "subjects" || @controller.controller_name == "lessons")
  end
  
  # Should we show the top bar with lesson links?
  def show_lesson_topbar?
    ['lessons', 'videos', 'contents'].include?(@controller.controller_name) && ['index', 'show'].include?(params[:action])
  end
  
  # Should we show the top bar with subject links?
  def show_subject_topbar?
    @controller.controller_name == "subjects" && params[:action] == "show"
  end

  def edit_exam_q_and_as_path(exam, q_and_a)
    # Determine the controller name for this exam
    exam_name = exam.class.to_s.downcase.pluralize
    "/#{exam_name}/#{exam.to_param}/q_and_as/#{q_and_a.to_param}/edit"
    
    # tried, but it didn't work: send("edit_#{exam_name}_q_and_a_path(exam, q_and_a)")
  end
  
  def new_exam_q_and_as_path(exam)
    # Determine the controller name for this exam
    exam_name = exam.class.to_s.downcase.pluralize
    "/#{exam_name}/#{exam.to_param}/q_and_as/new"
    
    # tried, but it didn't work: send("new_#{exam_name}_q_and_as_path(exam)")
  end
end
