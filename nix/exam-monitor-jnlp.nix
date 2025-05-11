pkgs: settings:
let
  url = "https://login.exammonitor.dk/exam.jnlp";
in

if settings.disableHashCheck then
  url
else
  pkgs.fetchurl {
    inherit url;
    sha256 = "sha256-01WIsftJiXSuStmDSxuCb0KuWgpTX8LD7F5fJQiF4h0=";
  }
