class ChangeNameInJobPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :job_posts, :max_salary_integer, :max_salary
  end
end
