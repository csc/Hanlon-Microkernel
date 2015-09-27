#!/usr/bin/env ruby
#
# This class defines the set of host utilities that are used by the
# Hanlon Microkernel Controller script
#
#

require 'rubygems'
require 'facter'

module HanlonMicrokernel
  class RzHostUtils

    def initialize
      @host_id = 'mk' + Facter.value('macaddress_eth0').gsub(':','')
    end

    # runs the "hostname" command in order to set the systems hostname
    # (used by the hnl_mk_controller script when setting up the system
    # during the boot process). Also modifies the contents of the
    # /etc/hosts and /etc/hostname file so that the hostname is set
    # consistently there as well
    def set_host_name
      %x[sudo hostname #{@host_id}]
      # %x[sudo sed -i 's/127.0.0.1 box/127.0.0.1 #{@host_id}/' /etc/hosts]
      # %x[sudo sed -i 's/box/#{@host_id}/' /etc/hostname]
    end

  end
end
