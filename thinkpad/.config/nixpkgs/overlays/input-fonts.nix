self: super:
{
  input-fonts = super.input-fonts.overrideDerivation (oldAttrs: {
    src = super.requireFile {
      name = "Input-Font.zip";
      url = "file:///home/oscar/Downloads/Input-Font.zip";
      sha256 = "13p99ji1garc53aid6m2hwbli5n17z2s8mbc6cav1vbm21v5n2nd";
    };

    outputHashAlgo = null;
    outputHash = null;
  });
}
