#Because env.rb says it likes to be replaced by generators, we're using this
#as a safer place to keep additions that would have gone there. No problems so far.

#This is needed for sqlite3 memory store
Before do
  silence_stream(STDOUT) do
    # use db agnostic schema by default
    load "#{Rails.root.to_s}/db/schema.rb"

    # if you use seeds uncomment next line
    # load "#{Rails.root.to_s}/db/seeds.rb"
    # ActiveRecord::Migrator.up('db/migrate') # use migrations
  end
end