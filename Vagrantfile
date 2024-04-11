=begin
Copyright 2024 Computer Networks Group @ UPB

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end

# Vagrant configuration for ANS-SS24 VM

Vagrant.require_version ">= 2.3.0"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "ans-vm"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  config.vm.box_check_update = false

  # Specify the memory and CPU cores for the VM
  config.vm.provider :virtualbox do |vb|
    vb.memory = 8192    # 8 GB
    vb.cpus = 16        # 16 cores
  end

  # Install the packages and libraries needed by the labs
  config.vm.provision "shell", path: "./scripts/vm-setup.sh"
end
