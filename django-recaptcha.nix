{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  django,
  coveralls,
  tox,
}:

buildPythonPackage rec {
  pname = "django-recaptcha";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-recaptcha";
    repo = "django-recaptcha";
    rev = version;
    hash = "sha256-B6Z9oKcMjSh+zE28k0ipoBppm9dD+Moa+PAZqXVabpA=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    django
    coveralls
    tox
  ];

  pythonImportsCheck = [
    # "django_recaptcha"
  ];

  meta = {
    description = "Django reCAPTCHA form field/widget integration app";
    homepage = "https://github.com/django-recaptcha/django-recaptcha";
    changelog = "https://github.com/django-recaptcha/django-recaptcha/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
