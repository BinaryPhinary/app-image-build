#Mobile-eye image build
FROM centos
Label Eric Taylor
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install epel-release
RUN yum update -y
RUN yum -y groupinstall "Development Tools"
RUN yum -y install openssl-devel bzip2-devel libffi-devel xz-devel
RUN curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz
RUN tar -xvf Python-3.8.2.tar.xz
WORKDIR "/Python-3.8.2"
RUN ./configure --enable-optimizations
RUN make altinstall
COPY /app-text/hello_mobileye.txt /tmp
WORKDIR "/Python-3.8.2"
CMD python3.8 -m http.server --bind --directory /tmp/ 80