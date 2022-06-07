class AddPaidToUserProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :user_projects, :paid, :boolean, default: false
  end
end
