menu(title='Go to' image=\uE1F4)
{
	item(title='Windows' image=inherit cmd=sys.dir)
	item(title='System' image=inherit cmd=sys.bin)
	item(title='Program Files' image=inherit cmd=sys.prog)
	item(title='Program Files x86' image=inherit cmd=sys.prog32)
	item(title='ProgramData' image=inherit cmd=sys.programdata)
	item(title='Applications' image=inherit cmd='shell:appsfolder')
	item(title='Users' image=inherit cmd=sys.users)
	separator
	//item(title='@user.name@@@sys.name' vis=label)
	item(title='Desktop' image=inherit cmd=user.desktop)
	item(title='Downloads' image=inherit cmd=user.downloads)
	item(title='Pictures' image=inherit cmd=user.pictures)
	item(title='Documents' image=inherit cmd=user.documents)
	item(title='Startmenu' image=inherit cmd=user.startmenu)
	item(title='AppData' image=inherit cmd=user.appdata)
	item(title='Temp' image=inherit cmd=user.temp)
}