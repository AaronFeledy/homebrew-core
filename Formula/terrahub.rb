require "language/node"

class Terrahub < Formula
  desc "Terraform automation and orchestration tool"
  homepage "https://docs.terrahub.io"
  url "https://registry.npmjs.org/terrahub/-/terrahub-0.2.54.tgz"
  sha256 "2a4df110f25cf944a94cb634820321050c2c854469b23f94bf888c5e5b9162f0"

  bottle do
    cellar :any_skip_relocation
    sha256 "9bba3db67c2d96e6a7b692250958d3b1fa2442338f262b819712df4cbbf32a8f" => :mojave
    sha256 "e07dd6da3807a834e185b67c2d1f552159ad53567dc4d7f600ef8c3ac11fddfd" => :high_sierra
    sha256 "8cc85cb2c9a1025693da1e45d67af6066d61307055d4fbbef78ff14273fcd73b" => :sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/".terrahub.yml").write <<~EOF
      project:
        name: terrahub-demo
        code: abcd1234
      vpc_component:
        name: vpc
        root: ./vpc
      subnet_component:
        name: subnet
        root: ./subnet
    EOF
    output = shell_output("#{bin}/terrahub graph")
    assert_match "Project: terrahub-demo", output
  end
end
