{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        settings = import ./settings.nix;

        examMonitorJnlp = import ./nix/exam-monitor-jnlp.nix pkgs settings;
        javaws = "${pkgs.adoptopenjdk-icedtea-web}/bin/javaws";
      in
      {
        packages.default = pkgs.writeShellApplication {
          name = "exam-monitor";

          text = ''
            #!/bin/sh
            export JAVA_HOME=${pkgs.jdk8}
            export PATH="$JAVA_HOME/bin:$PATH"

            ${javaws} ${examMonitorJnlp}
          '';
        };
      }
    );
}
