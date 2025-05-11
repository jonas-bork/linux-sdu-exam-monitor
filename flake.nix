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
    let
      settings = import ./settings.nix;
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        examMonitorJnlp = import ./nix/exam-monitor-jnlp.nix pkgs settings;
        javaws = "${pkgs.adoptopenjdk-icedtea-web}/bin/javaws";
      in
      {
        packages.default = pkgs.writeShellApplication {
          name = "exam-monitor";
          runtimeInputs = with pkgs; [
            jdk8
          ];

          text = ''
            #!/bin/sh
            ${javaws} ${examMonitorJnlp}
          '';
        };
      }
    );
}
