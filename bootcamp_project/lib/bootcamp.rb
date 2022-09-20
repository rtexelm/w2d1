class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @students = Array.new
    @teachers = Array.new
    @grades = Hash.new {|h, k| h[k] = Array.new}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end
  
  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    return false if @students.size == @student_capacity
    @students << student
    true
  end

  def enrolled?(student)
  @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.size / @teachers.size
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] += [grade]
        return true
    end
    false
  end

  def num_grades(student)
    @grades[student].size
  end

  def average_grade(student)
    return if !enrolled?(student) || @grades[student].empty?
    grades = @grades[student]
    grades.sum / grades.size
  end

end
