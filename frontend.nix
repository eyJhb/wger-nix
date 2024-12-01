{
  lib,
  python3,
  fetchFromGitHub,
  mkYarnPackage,
  fetchYarnDeps,
  sass,
}:

mkYarnPackage rec {
  pname = "wger";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "wger-project";
    repo = "wger";
    rev = "bfca74e88f6c9ff6e917e0ba0e8e9c782ae0047b";
    hash = "sha256-VuVKgkNp6Omiag72lOn6p51kC/jvApX/kRAPpK95U7w=";
  };

  packageJSON = /state/home/projects/workbench/nix-wger/wger/package.json;
  # offlineCache = fetchYarnDeps {
  #   yarnLock = "${src}/yarn.lock";
  #   hash = "sha256-olRU6ZGh6bpZ/WfwIKeREJRGd3oo7kEffFx8+4+7s5k=";
  # };

  nativeBuildInputs = [
    sass
  ];


  distPhase = "true";

  buildPhase = ''
    ls -al ${src}
    sass ${src}/wger/core/static/scss/main.scss bootstrap-compiled.css
    exit 1
    yarn --offline build
    find package.json yarn.lock static/css static/js -type f | sort | xargs md5sum > static/dist/sum.md5
  '';



  meta = {
    description = "";
    homepage = "https://github.com/wger-project/wger";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wger";
  };
}
