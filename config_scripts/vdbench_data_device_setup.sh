cat << EOF > /home/vdbench/vdbench_data_init.vdb

fsd=fsd1,anchor=/vdbench_data,depth=4,width=2,files=6,size=100M
fwd=fwd1,fsd=fsd1,operation=read,xfersize=4k,fileio=sequential,fileselect=random,threads=2
rd=rd1,fwd=fwd1,fwdrate=100,format=yes,elapsed=10,interval=1

EOF
