{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pydantic,
  requests,
  tqdm,
  pillow,
  redis,
}:

buildPythonPackage rec {
  pname = "openfoodfacts-python";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openfoodfacts";
    repo = "openfoodfacts-python";
    rev = "v${version}";
    hash = "sha256-aG+zbFr7lhh5OCdPe7h2XJSwok7sdrnpsEBzPgJ6Bas=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    pydantic
    requests
    tqdm
  ];

  optional-dependencies = {
    Pillow = [
      pillow
    ];
    redis = [
      redis
    ];
  };

  pythonImportsCheck = [
    "openfoodfacts"
  ];

  meta = {
    description = "Python package for Open Food Facts";
    homepage = "https://github.com/openfoodfacts/openfoodfacts-python";
    changelog = "https://github.com/openfoodfacts/openfoodfacts-python/blob/${src.rev}/CHANGELOG.md";
    license = with lib.licenses; [ mit asl20 ];
    maintainers = with lib.maintainers; [ ];
  };
}
