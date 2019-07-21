# hexo

## 使用方法

创建 hexo 项目

```
APP_NAME=blog
docker run -v $PWD/$APP_NAME:/app/$APP_NAME  kuops/hexo:latest hexo init $APP_NAME
```

安装依赖

```
docker run -v $PWD/$APP_NAME:/app  kuops/hexo:latest yarn install
```

运行 hexo 项目

```
docker run -d \
    --name hexo-server \
    -v $PWD/$APP_NAME:/app \
    -p 4000:4000 \
    kuops/hexo
```
