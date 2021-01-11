class ApplicationRecord < ActiveRecord::Base
  #Models are inherited from this application Controller
  #class amd this Application Controller class is inherited 
  # from Active record Library
  # The methods inherited from Active Records are used to generate to make change to DB
  self.abstract_class = true
end
