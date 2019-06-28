self: super:
{
  myWifi = super.writeShellScriptBin "myWifi" ''
    ${super.wpa_supplicant} -B -i interface -c <(${super.wpa_passphrase} "$@"
  '';   
}
