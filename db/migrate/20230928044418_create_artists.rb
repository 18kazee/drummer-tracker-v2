class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :spotify_name
      t.string :spotify_id
      t.string :album_image
      t.string :album_url

      t.timestamps
    end
  end
end
