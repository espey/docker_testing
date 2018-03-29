

template '/etc/cron.daily/docker-cleanup.sh' do
  source 'docker-cleanup.sh.erb'
  owner 'root'
  group 'root'
  mode '755'
end

template '/etc/cron.daily/loop-cleanup.sh' do
  source 'loop-cleanup.sh.erb'
  owner 'root'
  group 'root'
  mode '755'
end


