execute 'wget https://github.com/mackerelio/mackerel-agent/releases/download/v0.59.1/mackerel-agent_linux_arm.tar.gz -P /tmp'

execute 'tar zxvf /tmp/mackerel-agent_linux_arm.tar.gz -C /tmp' do
  only_if 'ls /tmp/mackerel-agent_linux_arm.tar.gz'
end

directory '/etc/mackerel-agent' do
  mode '755'
end

execute 'mv /tmp/mackerel-agent_linux_arm/mackerel-agent /usr/bin/mackerel-agent'

remote_file '/etc/mackerel-agent/mackerel-agent.conf' do
  source './mackerel-agent.conf'
  mode '644'
  not_if 'ls /etc/mackerel-agent/mackerel-agent.conf'
end

remote_file '/etc/systemd/system/mackerel-agent.service' do
  source './mackerel-agent.service'
  mode '777'
end
