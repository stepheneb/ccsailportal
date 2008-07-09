namespace :portal do
  desc "Initial setup of a new instance of the Portal"
  task :initial_setup => :environment do
    Rake::Task["db:create:all"].invoke
    Rake::Task["db:migrate"].invoke
  end

  desc "Setup demo"
  task :setup_demo => [:environment, :setup_demo_school_system, 
    :setup_demo_school_members, :setup_demo_class_members] do
  end

  desc "Setup a demo school system"
  task :setup_demo_school_system => :environment do
    district = Space.create!(:space_type => "District", :name => "DistrictA")
    
    schoolA = Space.create!(:space_type => "School", :name => "SchoolA")
    schoolA.move_to_child_of district
    
    classA = Space.create!(:space_type => "Class", :name => "ClassA")
    classA.move_to_child_of schoolA    
    
    classB = Space.create!(:space_type => "Class",:name => "ClassB")
    classB.move_to_child_of schoolA    
    
    schoolB = Space.create!(:space_type => "School", :name => "SchoolB")
    schoolB.move_to_child_of district
    
    classC = Space.create!(:space_type => "Class", :name => "ClassC")
    classC.move_to_child_of schoolB

    classD = Space.create!(:space_type => "Class", :name => "ClassD")
    classD.move_to_child_of schoolB
  end

  desc "Add school members in demo school system"
  task :setup_demo_school_members => :environment do
    Space.find_all_by_space_type("School").each do |school|
      teacherRole = SpaceRole.create!(:name => "Teacher", :space => school)
      studentRole = SpaceRole.create!(:name => "Student", :space => school)

      ["A", "B"].each do |name|
        user = User.create(:login => (school.name + "Teacher" + name), 
        :password => "secret", 
        :password_confirmation => "secret",
        :email => school.name + "Teacher" + name + "@test.com")
        user.space_roles << teacherRole
        user.state = "active"
        user.save!
      end

      ["A", "B", "C", "D"].each do |name|
        user = User.create(:login => (school.name + "Student" + name), 
        :password => "secret",
        :password_confirmation => "secret",
        :email => school.name + "Student" + name + "@test.com")
        user.space_roles << studentRole
        user.state = "active"
        user.save!
      end
    end
  end

  desc "Add class members in demo school system"
  task :setup_demo_class_members => :environment do
    Space.find_all_by_space_type("School").each do |school|
      schoolTeachers = school.space_roles.find_by_name("Teacher").users
      schoolStudents = school.space_roles.find_by_name("Student").users
      classes = school.children
      index = 0
      classes.each do |klass|
        teacherRole = SpaceRole.create!(:name => "Teacher", :space => klass)
        studentRole = SpaceRole.create!(:name => "Student", :space => klass)

        # assign each teacher to a class
        schoolTeachers[index].space_roles << teacherRole
        schoolTeachers[index].save
        schoolStudents[index*2].space_roles << studentRole
        schoolStudents[index*2].save
        schoolStudents[index*2+1].space_roles << studentRole
        schoolStudents[index*2+1].save
        index += 1
      end
    end    
  end        
end
