FROM centos:7

RUN rm -f /etc/yum.repos.d/* && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y nginx && \
    yum clean all && \
    rm -f /usr/share/nginx/html/index.html && \
    echo "This is nico nginx" > /usr/share/nginx/html/index.html
RUN nginx -t

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]