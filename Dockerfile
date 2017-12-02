# 使用Node精简版作为基础镜像
FROM node:6.10.3-slim

# 安装nginx
RUN apt-get update \    
    && apt-get install -y nginx

# 指定工作目录
WORKDIR /app

# 当前目录拷贝到工作目录下
COPY . /app/

# 声明运行时容器提供服务端口
EXPOSE 80

# 安装依赖
# build
# 拷贝到ng目录下
# 删除目录文件
RUN  npm install \
     && npm run build \     
     && cp -r dist/* /var/www/html \     
     && rm -rf /app

# 以前台形式启动ng
CMD ["nginx","-g","daemon off;"]