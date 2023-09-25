class RemoveApiKeyFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :api_key, :string
  end
end
