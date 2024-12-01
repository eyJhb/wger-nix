{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  asgiref,
  coverage,
  deprecation,
  django,
  iniconfig,
  packaging,
  pluggy,
  pyjwt,
  pytest,
  pytest-django,
  sqlparse,
  validators,
}:

buildPythonPackage rec {
  pname = "django-email-verification";
  version = "unstable-2024-07-12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "LeoneBacciu";
    repo = "django-email-verification";
    rev = "49e841b96e8bd39f0ad359a75be4711508ac4879";
    hash = "sha256-4hMSA1d6GOu7Xo7Qq1tBob4lW2zq1E4YaD8w0BnFfVc=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    asgiref
    coverage
    deprecation
    django
    iniconfig
    packaging
    pluggy
    pyjwt
    pytest
    pytest-django
    sqlparse
    validators
  ];

  pythonImportsCheck = [
    # "django_email_verification"
  ];

  meta = {
    description = "A Django app that takes care of verifying a users's email address and activating their profile";
    homepage = "https://github.com/LeoneBacciu/django-email-verification";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
