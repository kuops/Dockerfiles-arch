## 用法

```
git clone git@github.com:k8s-images-sync/xxx.git
cd xxx/
docker run  -v $HOME/.ssh:$HOME/.ssh -v $PWD:/code kuops/gcrsync ./get_image_tag.sh
```
