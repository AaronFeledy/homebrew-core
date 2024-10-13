class Waybackpy < Formula
  include Language::Python::Virtualenv

  desc "Wayback Machine API interface & command-line tool"
  homepage "https://pypi.org/project/waybackpy/"
  url "https://files.pythonhosted.org/packages/34/ab/90085feb81e7fad7d00c736f98e74ec315159ebef2180a77c85a06b2f0aa/waybackpy-3.0.6.tar.gz"
  sha256 "497a371756aba7644eb7ada0ebd4edb15cb8c53bc134cc973bf023a12caff83f"
  license "MIT"
  revision 6

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "876c3c23633e1a2516a7a9ec2687164f69809c07aa00fa9d694bf5c7797cc09a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "b180352f39d35fdfc2950fc0291fb9d990a6961eb686aad5f4313783d0f90170"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "b180352f39d35fdfc2950fc0291fb9d990a6961eb686aad5f4313783d0f90170"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b180352f39d35fdfc2950fc0291fb9d990a6961eb686aad5f4313783d0f90170"
    sha256 cellar: :any_skip_relocation, sonoma:         "9664d54979c41f2ded4d6eab777cae3baa9eda5f3bda3a934fbb8157c0c460be"
    sha256 cellar: :any_skip_relocation, ventura:        "9664d54979c41f2ded4d6eab777cae3baa9eda5f3bda3a934fbb8157c0c460be"
    sha256 cellar: :any_skip_relocation, monterey:       "f5173c74096a0966433386e0d8a93b5d313090138d8e311d04bdea4fbf71a5f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "269ef9bf80627292fc29b6dbe882f37355d0c874e04300b4857d2530fad479f9"
  end

  depends_on "certifi"
  depends_on "python@3.13"

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e/charset_normalizer-3.4.0.tar.gz"
    sha256 "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260/urllib3-2.2.3.tar.gz"
    sha256 "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/waybackpy -o --url https://brew.sh")
    assert_match "20130328163936", output
  end
end
