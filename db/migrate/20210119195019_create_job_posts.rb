class CreateJobPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.integer :min_salary
      t.string :max_salary_integer
      t.string :company_name

      t.timestamps
    end
  end
end
