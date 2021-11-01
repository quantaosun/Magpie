# NAMD-MD_private

使用notebook 的前两步，生成已经修复了断裂主链和更改非天然氨基酸为天然氨基酸的output.pdb。

然后下载，按照图示顺序进行操作，生成ionized.psf 文件

![image](https://user-images.githubusercontent.com/75652473/139612116-9512ac87-0004-48a6-8d9f-5216cea0a471.png)
 测量水盒子的三维和中心坐标，修改nvt.namd，修改nvt.namd 的参数文件名称和路径
 然后上传ionized.psf 和 ionized.pdb 到notebook，进行在线模拟。
 
 问题，水盒子的密度和restrain 目前没有弄明白，需要进一步完善。
