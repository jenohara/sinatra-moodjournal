class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string  :mood_type
    end
  end
end


# t.boolean :happy
# t.boolean :bored
# t.boolean :angry
# t.boolean :excited
# t.boolean :tired
# t.boolean :frustrated
# t.boolean :calm
# t.boolean :sad
# t.boolean :hurting