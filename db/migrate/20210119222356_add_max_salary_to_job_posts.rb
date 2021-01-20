class AddMaxSalaryToJobPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :job_posts, :max_salary, :integer
  end
end
