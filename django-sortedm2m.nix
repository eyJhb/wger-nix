{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  coverage,
  isort,
  pycodestyle,
  pylint-django,
}:

buildPythonPackage rec {
  pname = "django-sortedm2m";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "django-sortedm2m";
    rev = version;
    hash = "sha256-Jr3C6teU4On2PiJJV9vW4EEPEuknNCZRVMDMmrs6VY8=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    coverage
    isort
    pycodestyle
    pylint-django
    setuptools
  ];

  pythonImportsCheck = [
    # "django_sortedm2m"
  ];

  meta = {
    description = "A transparent sorted ManyToMany field for django";
    homepage = "https://github.com/jazzband/django-sortedm2m";
    changelog = "https://github.com/jazzband/django-sortedm2m/blob/${src.rev}/CHANGES.rst";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
