{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  django,
  six,
}:

buildPythonPackage rec {
  pname = "bootstrap-breadcrumbs";
  version = "0.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "prymitive";
    repo = "bootstrap-breadcrumbs";
    rev = version;
    hash = "sha256-w6s3LL/skzz4EnWtdsa5GXeISrJzr4yQ8hm/gQMva1o=";
  };

  patches = [
    ./patches/breadcrumbs.patch
  ];

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    django
    six
  ];

  pythonImportsCheck = [
    # "bootstrap_breadcrumbs"
  ];

  meta = {
    description = "Django template tags for easy breadcrumbs using twitter bootstrap css classes or custom template";
    homepage = "https://github.com/prymitive/bootstrap-breadcrumbs";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
