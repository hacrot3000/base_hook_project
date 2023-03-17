This is a project use Nim land to create a SO library which help you to hook into any ELF application.
Usuage:
- Use LD_PRELOAD trick to load the compiled SO library
- Define the function in server/private/common.nim, parametters and address must same with the application which you want to hook
- See "Setup a hook" in patch.nim for example
- Or you can seperate them into diffrent module like potential.nim

# update glibc to 2.17 for CentOS 6
```shell
#! /bin/sh
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-common-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-devel-2.17-55.el6.x86_64.rpm
wget http://copr-be.cloud.fedoraproject.org/results/mosquito/myrepo-el6/epel-6-x86_64/glibc-2.17-55.fc20/glibc-headers-2.17-55.el6.x86_64.rpm

sudo rpm -Uvh glibc-2.17-55.el6.x86_64.rpm \
glibc-common-2.17-55.el6.x86_64.rpm \
glibc-devel-2.17-55.el6.x86_64.rpm \
glibc-headers-2.17-55.el6.x86_64.rpm
```

Install required package:

```
nimble build

nimble install sim
nimble install https://github.com/ba0f3/ba0f3
nimble install https://github.com/ba0f3/ba0f3@#HEAD
nimble install redpool
nimble install https://github.com/ba0f3/nim-redisclient@0.2.1
nimble install https://github.com/OpenSystemsLab/nimpleflake
nimble install https://github.com/ba0f3/eventemitter

nimble install funchook
nimble install funchook@#ad6304c7b9d3bcb42fd074871823336baaf3053f

nimble install with@0.2.0
nimble install q
```
