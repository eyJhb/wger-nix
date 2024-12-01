{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  django,
}:

buildPythonPackage rec {
  pname = "bootstrap-breadcrumbs";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "christianwgd";
    repo = "bootstrap-breadcrumbs";
    rev = version;
    hash = "sha256-maLFIWyBH2BOFwxr/+ZlKwJ5LzQMqo7uUcIRMmjGESU=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    django
  ];

  pythonImportsCheck = [
    # "bootstrap_breadcrumbs"
  ];

  meta = {
    description = "Django template tags for easy breadcrumbs using twitter bootstrap css classes or custom template";
    homepage = "https://github.com/christianwgd/bootstrap-breadcrumbs";
    changelog = "https://github.com/christianwgd/bootstrap-breadcrumbs/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
