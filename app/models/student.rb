class Student < ActiveRecord::Base
    has_many :comments
end
