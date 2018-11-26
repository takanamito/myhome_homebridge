# myhome_homebridge

[Homebridge](https://github.com/nfarina/homebridge) on Docker on Raspberry Pi.

## Usage

Setup with [mitamae](https://github.com/itamae-kitchen/mitamae)

```bash
# Raspberry Pi
$ git clone https://github.com/takanamito/myhome_homebridge.git

# Download mitamae
$ wget https://github.com/itamae-kitchen/mitamae/releases/download/${LATEST}/mitamae-armhf-linux.tar.gz
$ tar zxvf mitamae-armhf-linux.tar.gz
$ chmod 755 mitamae-armhf-linux.

# Execute mitamae to installing docker-ce
$ cd /path/to/myhome_homebridge
$ sudo ../mitamae-armhf-linux local recipes/docker.rb

# (Option) Execute mitamae to installing mackerel-agent
$ sudo ../mitamae-armhf-linux local recipes/mackerel.rb
```

Start Homebridge with docker-compose.  
You can also see this [wiki](https://github.com/oznu/docker-homebridge/wiki/Homebridge-on-Raspberry-Pi)
 
```bash
$ cd /path/to/myhome_homebridge
$ sudo docker-compose up -d
```

- Your Homebridge accessories config write it in [config/config.json](https://github.com/takanamito/myhome_homebridge/blob/master/config/config.json).
- If you want to add homebridge-plugin, add npm package to [config/package.json](https://github.com/takanamito/myhome_homebridge/blob/master/config/package.json)
  - In my config, use NatureRemo plugin [nillpo/homebridge-nremo](https://github.com/nillpo/homebridge-nremo).
  - More info is here [oznu/docker-homebridge](https://github.com/oznu/docker-homebridge)
- You can also access manage application with your browser. `http://{ip of raspberrypi}:8080`
  - [oznu/homebridge-config-ui-x/](https://github.com/oznu/homebridge-config-ui-x)
  - More info is here [Managing Homebridge](https://github.com/oznu/docker-homebridge/wiki/Homebridge-on-Raspberry-Pi#5-managing-homebridge)
  
[WIP] monitor with mackerel-agent

- Set mackerel API token in `mackerel-agent.conf`
- Build [papix/mackerel-plugin-nature-remo](https://github.com/papix/mackerel-plugin-nature-remo)
- Set NatureRemo access token in `mackerel-agent.conf`
