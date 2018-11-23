execute 'apt-get update -y'

package 'git'
package 'tmux'

# docker
execute 'curl -sSL https://get.docker.com | sh' do
  not_if 'docker -v'
end

execute 'usermod -aG docker pi' do
  not_if 'groups pi | grep docker -w'
end

# docker-compose
package 'python-setuptools'

execute 'easy_install pip' do
  not_if 'pip -v'
end

execute 'pip install docker-compose' do
  not_if 'docker-compose -v'
end
