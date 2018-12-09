

function tempobjview(tempobj) {
	g_util.load("/query",
		true,
		function (result) {
		lyview(result);
	}, {
		"tbname": tbname,
		"obj": JSON.stringify(vm.tempobj)
	});
}

function tempobjdelete(tempobj, tempobjindex) {
	layer.confirm('删除&nbsp&nbsp' + tempobj.name + '&nbsp?', {
		icon: 2,
		title: '警告：请谨慎操作，删除动作不可逆！'
	}, function (index) {
		g_util.load("/delete", false, function (ret) {
			var pindex = 0;
			for (var i = 0; i < tempobjs.length; i++) {
				if (tempobjs[i].id == tempobj.id) {
					pindex = i;
				}
			}
			tempobjs.splice(pindex, 1);
			reshen(vm.activeNumber);
		}, {
			"tbname": tbname,
			"obj": JSON.stringify(tempobj)
		});
		layer.close(index);
	});
}

function tempobjadd() {
	vm.tempobj.age = new Date().toLocaleDateString();
	vm.tempobj.status = 0;
	delete vm.tempobj.id;
	delete vm.tempobj.createdAt;
	delete vm.tempobj.updatedAt;
	delete vm.tempobj.deletedAt;

	var temp = {};
	temp.tbname = tbname;
	temp.obj = vm.tempobj;

	console.log(JSON.stringify(temp));

	console.log(JSON.stringify(vm.tempobj));

	g_util.load("/add",
		true,
		function (result) {
		if (result.status == 0) {
			layer.alert("添加成功");
			vm.tempobjaddshow = false;
			tempobjs.push(result.result);
			reshen(vm.pageCout);
		} else {
			layer.alert("添加失败,错误原因为" + JSON.stringify(result.result));
		}
	}, {
		"tbname": tbname,
		"obj": JSON.stringify(vm.tempobj)
	});
}

function reshen(n) {
	vm.pageCout = Math.ceil(tempobjs.length / pagesize);
	n = n ? n : 1;
	vm.tempobjs = tempobjs.slice((n - 1) * 10, n * 10);
	vm.activeNumber = n;
}

function editview(tempobj) {
	vm.tempobj = tempobj;
	delete vm.tempobj.createdAt;
	delete vm.tempobj.updatedAt;
	delete vm.tempobj.deletedAt;
	vm.tempobjeditshow = true;
	layer.open({
		type: 1,
		title: "打印机信息修改",
		area: '800px',
		scrollbar: false,
		content: $("#editdlg"),
		btn: ["修改", "关闭"],
		yes: function (index) {
			layer.close(index);

			g_util.load("/edit",
				true,
				function (result) {
				if (result == "ok") {
					vm.tempobjeditshow = false;
					tempobj = vm.tempobj;
					layer.alert("修改成功");
				} else {
					layer.alert("修改失败,错误原因为" + result.result);
				}
			}, {
				"tbname": tbname,
				"obj": JSON.stringify(vm.tempobj)
			});

		},
		cancel: function (index) {
			vm.tempobjeditshow = false;
			layer.close(index);
		},
		btn2: function (index) {
			vm.tempobjeditshow = false;
			layer.close(index);
		}

	});
}
