/**
 * 
 * @param  Num 每页最大记录数
 * @param  TableId 需要控制的table的id属性
 * @param  TBodyId 需要控制的table的tbody 的id属性
 * @Author Shawzt
 * @CreateTime 2012/3/17
 */

function Page(Num, TableId, TBodyId) {
	this.num = Num;
	this.tableId = TableId;
	this.tBodyId = TBodyId;
	this.pageIndex = 0; //页索引
	this.Table = null; //表格引用
	this.TBody = null; //要分页内容
	this.dataRows = 0; //记录行引用
	this.rowCount = 0; //记录数
	this.pageCount = 0; //页数
	this.MyInit(); //初始化;
};
/**
 初始化
 */
function MyInit() {
	this.Table = document.getElementById(this.tableId); //获取table引用
	this.TBody = this.Table.tBodies[this.tBodyId]; //获取tBody引用
	this.dataRows = this.TBody.rows;
	this.rowCount = this.dataRows.length;
	try {
		/*如果设定的每页最大显示的记录数num<=0 则num=1
		 * 否则，若num大于要显示的数据行数rowCount，num=rowCount
		 * 否则，num就为设定的值
		 */
		this.num = (this.num <= 0) || (this.num > this.rowCount) ? this.rowCount
				: this.num;
		/*
		 * 计算设定总页数
		 * 当rowCount能被num整除时,pageCount=rowCount/num
		 * 否则要pageCount=rowCount/num+1
		 */
		this.pageCount = parseInt(this.rowCount % this.num == 0 ? this.rowCount
				/ this.num : this.rowCount / this.num + 1);
	} catch (exception) {
	}
	this.updateTableRows();
};
/**
 下一页
 */
function nextPage() {
	if (this.pageIndex + 1 < this.pageCount) {
		this.pageIndex += 1;
		this.updateTableRows();
	}
};
/**
 上一页
 */
function prePage() {
	if (this.pageIndex >= 1) {
		this.pageIndex -= 1;
		this.updateTableRows();
	}
};
/**
 首页
 */
function firstPage() {
	if (this.pageIndex != 0) {
		this.pageIndex = 0;
		this.updateTableRows();
	}
};
/**
 尾页
 */
function lastPage() {
	if (this.pageIndex + 1 != this.pageCount) {
		this.pageIndex = this.pageCount - 1;
		this.updateTableRows();
	}
};
/**
 页定位方法
 */
function aimPage(iPageIndex) {
	if (iPageIndex > this.pageCount - 1) {
		this.pageIndex = this.pageCount - 1;
	} else if (iPageIndex < 0) {
		this.pageIndex = 0;
	} else {
		this.pageIndex = iPageIndex;
	}
	this.updateTableRows();
};
/**
 执行分页时，更新显示表格内容
 */
function updateTableRows() {
	var iCurrentRowCount = this.num * this.pageIndex;
	var iMoreRow = this.num + iCurrentRowCount > this.rowCount ? this.num
			+ iCurrentRowCount - this.rowCount : 0;
	var tempRows = this.cloneRows();
	var removedTBody = this.Table.removeChild(this.TBody);
	var newTBody = document.createElement("TBODY");
	newTBody.setAttribute("id", this.tBodyId);

	for ( var i = iCurrentRowCount; i < this.num + iCurrentRowCount - iMoreRow; i++) {
		newTBody.appendChild(tempRows[i]);
	}
	this.Table.appendChild(newTBody);
	/*
	 this.dataRows为this.oTBody的一个引用，
	 移除this.oTBody那么this.dataRows引用将销失,
	 code:this.dataRows = tempRows;恢复原始操作行集合.
	 */
	this.dataRows = tempRows;
	this.TBody = newTBody;
};
/**
 克隆原始操作行集合
 */
function cloneRows() {
	var tempRows = [];
	for ( var i = 0; i < this.dataRows.length; i++) {
		/*
		 code:this.dataRows[i].cloneNode(param), 
		 param = 1 or true:复制以指定节点发展出去的所有节点,
		 param = 0 or false:只有指定的节点和它的属性被复制.
		 */
		tempRows[i] = this.dataRows[i].cloneNode(1);
	}
	return tempRows;
};