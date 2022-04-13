Name:           dbench
Version:        
Release:        
Summary:        The dbench benchmark

License:        GPLv3+
URL:            https://dbench.samba.org/web/index.html
Source0:        file:///tmp/%{name}-%{version}.tar.gz
Buildarch:      x86_64
BuildRequires: autoconf automake gcc
BuildRequires: popt-devel zlib-devel rpcgen libtirpc-devel

Patch0: dbench.patch
Patch1: dbench-tirpc.patch

%description
The dbench benchmark

%prep
%setup -q

%patch0 -p1
%patch1 -p1

%build
./autogen.sh
./configure
make %{?_smp_mflags}

%install
rm -rf %{buildroot}

make %{?_smp_mflags} DESTDIR=$RPM_BUILD_ROOT install

%post

%preun

%postun

%files
/usr/local/bin/dbench
/usr/local/share/doc/dbench/loadfiles/client.txt
/usr/local/share/doc/dbench/loadfiles/iscsi.txt
/usr/local/share/doc/dbench/loadfiles/nfs.txt
/usr/local/share/doc/dbench/loadfiles/nfs_2.txt
/usr/local/share/doc/dbench/loadfiles/scsi.txt
/usr/local/share/doc/dbench/loadfiles/smb.txt
/usr/local/share/doc/dbench/loadfiles/smb_1.txt
/usr/local/share/doc/dbench/loadfiles/smb_2.txt
/usr/local/share/doc/dbench/loadfiles/smb_3.txt
/usr/local/share/man/man1/dbench.1

%doc
