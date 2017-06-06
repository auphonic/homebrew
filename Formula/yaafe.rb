class Yaafe < Formula
  desc "Yaafe - audio features extraction"
  homepage "http://yaafe.sourceforge.net/"
  url "https://github.com/Yaafe/Yaafe/archive/0.70.zip"
  sha256 "ea08030deb897d1aad3614998ab9379d32b3fa97305fa4a75afaab99405e304c"

  option "with-lapack", "Enable LaPack support"

  depends_on "cmake" => :build
  depends_on "argtable"
  depends_on "eigen"
  depends_on "libsndfile" => :optional
  depends_on "hdf5" => :optional
  depends_on "fftw" => :optional
  depends_on "mpg123" => :optional

  def install
    Dir.mkdir('build')
    Dir.chdir('build')
    std_cmake_args << "-DWITH_FFTW3=ON" if build.with? 'fftw'
    std_cmake_args << "-DWITH_HDF5=ON" if build.with? 'hdf5'
    std_cmake_args << "-DWITH_LAPACK=ON" if build.with? 'lapack'
    std_cmake_args << "-DWITH_SNDFILE=ON" if build.with? 'libsndfile'
    std_cmake_args << "-DWITH_MPG123=ON" if build.with? 'mpg123'

    system "cmake", *std_cmake_args, ".."
    system "make"
    system "make install"
  end

end
