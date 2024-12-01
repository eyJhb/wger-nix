{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  django,
}:

buildPythonPackage rec {
  pname = "django-activity-stream";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "justquick";
    repo = "django-activity-stream";
    rev = version;
    hash = "sha256-fZrZDCWBFx1R9GGcTkjos7blSBNx1JTdTIVLKz+E2+c=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    django
  ];

  pythonImportsCheck = [
    # "django_activity_stream"
    "actstream"
  ];

  meta = {
    description = "Generate generic activity streams from the actions on your site. Users can follow any actors' activities for personalized streams";
    homepage = "https://github.com/justquick/django-activity-stream";
    changelog = "https://github.com/justquick/django-activity-stream/blob/${src.rev}/CHANGELOG.rst";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
  };
}
