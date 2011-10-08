desc "Decays the post weight"

task :decrement_weight => :environment do
    value=5
    threshold=5
    decayed=0
    while true do
      Post.update_all("weight = weight - #{value}",["weight >= ?",threshold])
      Post.update_all("weight = #{decayed}",["weight < ?",decayed])
      puts "Executed! #{Time.now}"
      sleep 300 # Sleeps for 5 mins
    end
end