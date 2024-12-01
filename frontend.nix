{
  lib,
  python3,
  fetchFromGitHub,
  mkYarnPackage,
  fetchYarnDeps,
  sass,
  stdenv,
  yarn,
  fixup-yarn-lock,
}:

let 
  src = fetchFromGitHub {
    owner = "wger-project";
    repo = "wger";
    rev = "bfca74e88f6c9ff6e917e0ba0e8e9c782ae0047b";
    hash = "sha256-VuVKgkNp6Omiag72lOn6p51kC/jvApX/kRAPpK95U7w=";
  };

  offlineCache = fetchYarnDeps {
    yarnLock = "${src}/yarn.lock";
    hash = "sha256-olRU6ZGh6bpZ/WfwIKeREJRGd3oo7kEffFx8+4+7s5k=";
  };
in 
stdenv.mkDerivation {
  pname = "tetrio-plus";
  version = "1.0.0";

  src = src;

  nativeBuildInputs = [
    yarn
    fixup-yarn-lock
    sass
  ];

  buildPhase = ''
    runHook preBuild
    export HOME=$(mktemp -d)

    yarn config --offline set yarn-offline-mirror ${offlineCache}
    fixup-yarn-lock yarn.lock
    yarn install --offline --frozen-lockfile --ignore-platform --ignore-scripts --no-progress --non-interactive

    sass wger/core/static/scss/main.scss wger/core/static/yarn/bootstrap-compiled.css

    runHook postBuild
  '';

  installPhase = ''
    mkdir -p $out
    cp -a wger/core/static $out/static
  '';

  meta = {
    description = "";
    homepage = "https://github.com/wger-project/wger";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wger";
  };
}
