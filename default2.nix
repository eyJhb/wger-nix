{
  lib,
  python3,
  fetchFromGitHub,
  callPackage,
}:

let
  frontend = callPackage ./frontend.nix {};
in python3.pkgs.buildPythonApplication rec {
  pname = "wger";
  version = "unstable";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wger-project";
    repo = "wger";
    rev = "bfca74e88f6c9ff6e917e0ba0e8e9c782ae0047b";
    hash = "sha256-VuVKgkNp6Omiag72lOn6p51kC/jvApX/kRAPpK95U7w=";
  };

  build-system = [
    python3.pkgs.hatchling
  ];

  patches = [
    ./patches/pyproject.patch
    ./patches/tasks.patch
  ];

  # dependencies = with python3.pkgs; [
  propagatedBuildInputs = with python3.pkgs; [
    bleach
    celery
    django-crispy-bootstrap5
    django
    # django-activity-stream
    (python3.pkgs.callPackage ./django-activity-stream.nix {})
    django-axes
    django-compressor
    django-cors-headers
    django-crispy-forms
    # django-email-verification
    (python3.pkgs.callPackage ./django-email-verification.nix {})
    django-environ
    django-filter
    django-formtools
    django-prometheus
    # django-recaptcha
    (python3.pkgs.callPackage ./django-recaptcha.nix {})
    django-simple-history
    # django-sortedm2m
    (python3.pkgs.callPackage ./django-sortedm2m.nix {})
    django-storages
    djangorestframework
    djangorestframework-simplejwt
    drf-spectacular
    easy-thumbnails
    flower
    fontawesomefree
    icalendar
    invoke
    # openfoodfacts
    (python3.pkgs.callPackage ./openfoodfacts.nix {})
    pillow
    reportlab
    requests
    tqdm
    tzdata

    # extra??
    drf-spectacular-sidecar
    (python3.pkgs.callPackage ./django-bootstrap-breadcrumbs.nix {})
    psycopg2
  ];

  postInstall = ''
    cp -a ${frontend}/static/yarn $out/${python3.sitePackages}/wger/core/static
    ls -al $out/${python3.sitePackages}/wger/core/static
  '';

  pythonImportsCheck = [
    "wger"
  ];

  meta = {
    description = "";
    homepage = "https://github.com/wger-project/wger";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wger";
  };
}
