class AddDummyDependency < ActiveRecord::Migration
  def change
    def make_dependency(from, from_version, to, to_version)
        ret = Dependency.new
        ret.part_name = from
        ret.part_version = from_version
        ret.dependency_name = to
        ret.dependency_version = "= " + to_version.to_s
        ret.save
    end
    
    make_dependency("B", 1.0, "A", 1.0)
    
    make_dependency("C", 1.0, "B", 1.0)
    
    make_dependency("E", 1.0, "D", 1.0)
    
    make_dependency("F", 1.0, "E", 1.0)
    
    make_dependency("F", 1.0, "C", 1.0)
    
    make_dependency("C", 1.0, "D", 1.0)
    
    make_dependency("E", 1.0, "B", 1.0)
    
    make_dependency("A", 2.0, "C", 2.0)
    
    make_dependency("A", 2.0, "B", 2.0)
    
    make_dependency("B", 2.0, "E", 2.0)
    
    make_dependency("C", 2.0, "D", 2.0)
    
    make_dependency("E", 2.0, "F", 2.0)
    
    make_dependency("D", 2.0, "F", 2.0)
    
    make_dependency("B", 3.0, "A", 1.0)
    
    make_dependency("B", 3.0, "C", 3.0)
    
    make_dependency("C", 3.0, "A", 2.0)
  end
end
