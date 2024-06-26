{pkgs}: {
  channel = "stable-23.11";
  env = {
     BASE_URL="https://eaa3-102-68-193-191.ngrok-free.app/api/v1";
  };
  packages = [
    pkgs.unixtools.ifconfig
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
  ];
  idx.extensions = [
    
  ];
  idx.previews = {
    previews = {
      web = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "web-server"
          "--web-hostname"
          "0.0.0.0"
          "--web-port"
          "$PORT"
        ];
        manager = "flutter";
      };
      android = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "android"
          "-d"
          "emulator-5554"
        ];
        manager = "flutter";
      };
    };
  };
}