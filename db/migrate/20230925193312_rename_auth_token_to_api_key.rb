class RenameAuthTokenToApiKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :auth_token, :api_key
  end
end
