FROM centos:7

# 清理默认仓库并添加自定义仓库
RUN rm -f /etc/yum.repos.d/*

# 复制自定义的 CentOS-Base.repo 文件
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

# 安装依赖并更新系统
RUN yum install -y epel-release && \
    yum update -y && \
    yum install -y nginx && \
    yum clean all && \
    echo "this is my nginx" > /usr/share/nginx/html/index.html

# 验证 Nginx 配置
RUN nginx -t

# 暴露端口
EXPOSE 80

# 设置健康检查
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]