class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :short_description
      t.string :long_description
      t.string :book_url
      t.string :video_url
      t.datetime :collect_started_at
      t.datetime :collect_ended_at

      t.timestamps
    end
  end
end
