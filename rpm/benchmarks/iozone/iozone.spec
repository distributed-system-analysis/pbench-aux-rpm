Name:           iozone
Version:        
Release:        
Summary:        IOzone Filesystem Benchmark

License:        GPLv3+
URL:            http://www.iozone.org/
Source0:        %{name}-%{version}.tar.gz
Buildarch:      x86_64
BuildRequires:  gcc

%define debug_package %{nil}

%description
The IOzone Filesystem Benchmark

%prep
%setup

%build

cd src/current
make linux-AMD64

%install
rm -rf %{buildroot}

cd src/current
install -d %{buildroot}/usr/local/bin
install -m 755 iozone %{buildroot}/usr/local/bin
install -m 755 fileop %{buildroot}/usr/local/bin
install -m 755 pit_server %{buildroot}/usr/local/bin

%post

%preun

%postun

%files
/usr/local/bin/iozone
/usr/local/bin/fileop
/usr/local/bin/pit_server

%doc
