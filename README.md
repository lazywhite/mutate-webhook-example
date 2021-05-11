# Usage

```
1. 获取CA Bundle
    kubectl config view --raw --minify --flatten -o jsonpath='{.clusters[].cluster.certificate-authority-data}';echo
2. 配置webhook-configuration, 替换CA_Bundle
3. generate ssl
    cd ssl;sh ssl.sh
4. 构建docker image
    sh build-image.sh
5. 创建deployment, 注意更改image name
6. 创建svc, webhook-configuration
7. 创建namespace
8. 创建测试pod
```
