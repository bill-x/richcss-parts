class AddDummyDependency < ActiveRecord::Migration
  def change
    def make_dependency(from, from_version, to, to_version)
        ret = Dependency.new
        ret.part_name = from
        ret.part_version = from_version
        ret.dependency_name = to
        ret.dependency_version = to_version
        ret.save
    end
    
    make_dependency("B", 1, "A", 1)
    
    make_dependency("C", 1, "B", 1)
    
    make_dependency("E", 1, "D", 1)
    
    make_dependency("F", 1, "E", 1)
    
    make_dependency("F", 1, "C", 1)
    
    make_dependency("C", 1, "D", 1)
    
    make_dependency("E", 1, "B", 1)
    
    make_dependency("A", 2, "C", 2)
    
    make_dependency("A", 2, "B", 2)
    
    make_dependency("B", 2, "E", 2)
    
    make_dependency("C", 2, "D", 2)
    
    make_dependency("E", 2, "F", 2)
    
    make_dependency("D", 2, "F", 2)
    
    make_dependency("B", 3, "A", 1)
    
    make_dependency("B", 3, "C", 3)
    
    make_dependency("C", 3, "A", 2)
  end
end
