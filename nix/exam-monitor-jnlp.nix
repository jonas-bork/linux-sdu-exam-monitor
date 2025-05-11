pkgs: settings:

if settings.disableHashCheck then
  "https://login.exammonitor.dk/exam.jnlp"
else
  pkgs.fetchurl {
    url = "https://login.exammonitor.dk/exam.jnlp";
    sha256 = "sha256-01WIsftJiXSuStmDSxuCb0KuWgpTX8LD7F5fJQiF4h0=";
  }
