class ChangeMaxSalaryToInteger2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :job_posts, :max_salary, :string
  end
end
