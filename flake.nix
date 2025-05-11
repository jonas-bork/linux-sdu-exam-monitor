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
      settings = {
        # DANGER: When true, uses the latest exam monitor from their website without checking its hash.
        # This might be useful if exam monitor updated but this flake has not been updated for it.
        disableHashCheck = false;
      };
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        examMonitorJnlp = import ./nix/exam-monitor-jnlp.nix pkgs settings;

        javaws = "${pkgs.adoptopenjdk-icedtea-web}/bin/javaws";

        examMonitorApp = pkgs.writeShellApplication {
          name = "exam-monitor";
          runtimeInputs = with pkgs; [
            jdk8
          ];

          text = ''
            #!/bin/sh
            ${javaws} ${examMonitorJnlp}
          '';
        };
      in
      {
        packages.default = examMonitorApp;

        # packages.default = pkgs.stdenv.mkDerivation rec {
        #   name = "exam-monitor";
        #
        #   src = examMonitor;
        #
        #   unpackPhase = ":";
        #
        #   installPhase = ''
        #     # ensureDir $out/bin
        #     mkdir -p $out/bin
        #     cp ${examMonitor} $out/bin
        #     echo "#!/bin/sh" > $out/bin/exam-monitor
        #     echo "${pkgs.adoptopenjdk-icedtea-web}/bin/javaws $out/exam.jnlp" >> $out/bin/exam-monitor
        #     chmod +x $out/bin/exam-monitor
        #   '';
        #
        #   depsTargetTarget = with pkgs; [
        #     jdk8
        #     adoptopenjdk-icedtea-web
        #   ];
        # };

        devShell = pkgs.mkShell {
          packages = with pkgs; [
            jdk8
            adoptopenjdk-icedtea-web
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
            with pkgs;
            [
              zlib
              zstd
              stdenv.cc.cc
              curl
              openssl
              attr
              libssh
              bzip2
              libxml2
              acl
              libsodium
              util-linux
              xz
              systemd
              libGL
              glibc
              glib
            ]
          );
        };
      }
    );
}
