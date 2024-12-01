{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "wger";
  version = "2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wger-project";
    repo = "wger";
    rev = version;
    hash = "sha256-LZsJEiWKVsu0nlFCgXarxnJzZ/0RUQc8v3nFBSQVVsA=";
  };

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  dependencies = with python3.pkgs; [
    bleach
    celery
    django-crispy-bootstrap4
    django-crispy-bootstrap5
    django
    # django-activity-stream
    (python3.pkgs.callPackage ./django-activity-stream.nix {})
    django-axes
    # django-bootstrap-breadcrumbs2
    (python3.pkgs.callPackage ./django-bootstrap-breadcrumbs2.nix {})
    django-compressor
    django-cors-headers
    django-crispy-forms
    # django-email-verification
    (python3.pkgs.callPackage ./django-email-verification.nix {})
    django-environ
    django-extensions
    django-filter
    django-formtools
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
    tzdata
  ];

  pythonRelaxDeps = true;

  pythonImportsCheck = [
    "wger"
  ];

  meta = {
    description = "Self hosted FLOSS fitness/workout, nutrition and weight tracker";
    homepage = "https://github.com/wger-project/wger";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "wger";
  };
}
