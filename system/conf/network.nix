{ config, lib, pkgs, options, modulesPath, inputs, self, username, hostname, system, timezone, storage, ... }:

{

  # Networking
  networking = {
    hostId = "88888888"; # Machine ID
    hostName = hostname; # HostName
    useDHCP = false;
    nftables = {
      enable = true;
    };
    nameservers = [ # DNS Servers
      "1.1.1.1"  # Cloudflare | Primary
      "9.9.9.9"  # Quad9      | Secondary
    ];
    enableIPv6 = true;
    firewall = {
      enable = true;
      backend = "nftables";
    };
    resolvconf = {
      enable = false;
    };
    networkmanager = {
      enable              = true;
      logLevel            = "OFF";
      dhcp                = "internal";
      dns                 = "systemd-resolved";
      ethernet.macAddress = "AA:AA:AA:AA:AA:AA";
      wifi.macAddress     = "random";
    };
  };

  # Services
  services = {
    resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNSOverTLS = false; # Will break VPNs if enabled.
          DNSSEC     = false; # Will break VPNs if enabled.
        };
      };
    };
  };

}
