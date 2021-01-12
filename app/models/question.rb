class Question < ApplicationRecord
    after_initialize :set_defaults
    before_save :capitalize_title
    # validates :title, presence: true
    validates :title, presence: {message: 'must be provided'},uniqueness: true
    # validates :title, uniqueness: true
    validates :body , length:{minimum: 2, maximum: 200}
    validates :title, uniqueness: {scope: :body }
    validates :view_count, numericality: {greater_than_or_equal_to: 0}
    validate :no_monkey
    
    # .new
    # def self.recent_ten
    #     order("created_at DESC").limit(10)
    # end
    # Converting above method into a lambda
    scope :recent_ten,lambda{order("created_at DESC").limit(10)}

    private
    def capitalize_title
        self.title.capitalize!
    end
    def set_defaults
        self.view_count ||= 0
    end
    def no_monkey
        if body&.downcase&.include?("monkey")
            self.errors.add(:body, "must not have monkeys")
        end
    
    end
        # LifeCycle of a Model is: Initialize > Validates> Save> Commits 
end
