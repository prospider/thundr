class Section < ActiveRecord::Base
  belongs_to :course
  has_many :klasses

  attr_accessor :classes_array


  def course_code_full
    department + '-' + course_code + '-' + section_code
  end

  def name
    Course.find(course_id).name
  end


  def classes
    Klass.where(section_id: Section.select(:course_id).where(department: department, course_code: course_code, section_code: section_code))
  end

  def season
    case section_code[0]
      when 'F'
        'Fall'
      when 'W'
        'Winter'
      when 'S'
        'Summer'
      when 'Y'
        'All-Year'
    end
  end




end