# 使用官方 Node.js 20 LTS 镜像作为基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json（先只复制依赖相关文件，利用 Docker 缓存）
COPY package*.json ./

# 安装依赖（生产环境不安装 devDependencies）
RUN npm install

# 复制应用代码
COPY . .

# 暴露端口 3000
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]
