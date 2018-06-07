## 使用方法

创建 hexo 项目
```
BLOG_DIR_NAME=blog
docker run -v $PWD/$BLOG_DIR_NAME:/app/$BLOG_DIR_NAME  kuops/hexo:latest  hexo init $BLOG_DIR_NAME
```

安装依赖
```
docker run -v $PWD/$BLOG_DIR_NAME:/app  kuops/hexo:latest  npm install
```

运行 hexo 项目
```
docker run -d \
    --name hexo \
    -v $PWD/blog:/app \
    -p 4000:4000 \
    kuops/hexo
```
