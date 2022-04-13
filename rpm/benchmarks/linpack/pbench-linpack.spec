%define __installdir /usr/local/pbench-linpack-11.1.3

Name:           pbench-linpack
Version:        11.1.3
Release:        1pbench
Summary:        Linpack
License:        GPLv3+
URL:            http://www.netlib.org
# Source0:        http://lacrosse.corp.redhat.com/~psatpute/linpack-11.1.3.tar.gz
# This tarball contains binaries - we don't build anything, we just install it.
Source0:        %{name}-%{version}.tar.gz
Buildarch:      x86_64

# no automatic deps generated
Autoreq:        0

%description
Linpack 11.1.3

%prep
%autosetup -n %{name}-%{version}

%install
export QA_RPATHS=0x0002

mkdir -p  %{buildroot}/usr/local
cd  %{buildroot}/usr/local; tar zxf %{sources}

%files
%{__installdir}/benchmarks/

%doc
%{__installdir}/doc/
%{__installdir}/readme.txt

