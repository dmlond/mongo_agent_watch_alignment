#!/usr/local/bin/ruby

require 'mongo_agent'

a = MongoAgent::Agent.new({name: 'alignment_agent', queue: ENV["QUEUE"]})

while (true) do
  $stderr.puts "total tasks: #{ a.db[a.queue].find.count }"
  ['alignment_agent','split_agent','align_subset_agent','merge_bam_agent'].each do |agent|
    $stderr.puts "  agent #{agent} total: #{ a.get_tasks({agent_name: agent}).count } ready: #{ a.get_tasks({agent_name: agent, ready: true}).count } complete: #{ a.get_tasks({agent_name: agent, complete: true}).count } errors: #{ a.get_tasks({agent_name: agent, complete: true, error_encountered: true}).count }"
  end
  $stderr.puts ""
  sleep 5
end
