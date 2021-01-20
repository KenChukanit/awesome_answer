class ChangeMaxSalaryToInteger < ActiveRecord::Migration[6.1]
  def self.up
    change_table :job_posts do |t|
      t.change :max_salary, :string
    end
  end
  def self.down
    change_table :job_posts do |t|
      t.change :max_salary, :integer
    end
  end
end
