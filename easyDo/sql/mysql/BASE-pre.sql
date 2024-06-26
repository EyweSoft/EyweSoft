/**公司表**/
create table sys_company (
	id varchar(36) not null,
	name varchar(200) not null,
	simpleName varchar(200),
	sysAddress varchar(200),
	webAddress varchar(200),
	telphone varchar(100),
	address varchar(2000),
	logoAddress varchar(200), 
	workTime float, 
	redWorkTime float, 
	upWorkTime float, 
	lowWorkTime float, 
	grayWorkTime float, 
	standardWorkday float, 
	weekdays varchar(100),
	amStartTime varchar(50),
	amEndTime varchar(50),
	pmStartTime varchar(50),
	pmEndTime varchar(50),
	isValid varchar(2) default 'Y',
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**系统菜单**/
create table sys_menu (
	id varchar(36) not null,
	name varchar(200) not null,
	parentId varchar(36),
	url varchar(200), 
	perms varchar(200), 
	type Integer, 
	icon varchar(200),
	orderNum Integer,
	category varchar(20),
	remark varchar(2000),
	isSystem varchar(2),
	preId varchar(36),
	levels varchar(2),
	moduleId varchar(36),
	exeCls varchar(200),
	isValid varchar(2) default 'Y',
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**系统角色**/
create table sys_role (
	id varchar(36) not null,
	name varchar(200) not null,
	roleName varchar(200) not null,
	roleSign varchar(200),
	parentId varchar(36) null,
	remark varchar(2000),
	objectType varchar(100),
	objectId varchar(36),
	orderNum Integer,
	dataScope varchar(2000),
	filterField text,
	tabRight text,
	isSystem varchar(2),
	isValid varchar(2) default 'Y',
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**角色和目录关系表**/
create table sys_roleMenu_rlt (
	id varchar(36) not null,
	roleId varchar(36) not null,
	menuId varchar(36) not null,
	PRIMARY KEY (id)
);

/**部门**/
create table sys_dept (
	id varchar(36) not null,
	name varchar(200) not null,
	spellName varchar(500),
	code varchar(200) null,
	parentId varchar(36) null,
	managerId varchar(36) null,
	assistantId varchar(36) null,
	telPhone varchar(50) null,
	fax varchar(50) null,
	officeAddress varchar(2000) null,
	remark varchar(2000) null,
	workflowGroupId varchar(36) null,
	domainName varchar(200) null,
	orderNum Integer,
	isValid varchar(2) default 'Y',
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**用户**/
create table sys_user (
	id varchar(36) not null,
	name varchar(200) not null,
	username varchar(200) not null,
	spellName varchar(500),
	jobNumber varchar(200),
	picId varchar(200),
	password varchar(200),
    deptId varchar(36),
	deptName varchar(200),
	email varchar(100),
	status Integer,
	sex Integer,
	theme varchar(20),
	skin varchar(20),
	positionid varchar(36),
	levelid varchar(36),
	isworklog varchar(2),
	birthdate datetime,
	joindate datetime,
	officeaddress varchar(500),
	introduction text,
	memory text,
	telephone varchar(100),
	maritalStatus varchar(2),
	orderNum Integer,
	isValid varchar(2) default 'Y',
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

create table sys_userEdu_rlt (
	id varchar(36) not null,
	userId varchar(36) not null,
	school varchar(200) not null,
	levelId varchar(36) not null,
	startDate datetime,
	endDate datetime,
	isValid varchar(2),
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);
CREATE INDEX Idx_userEdu_00001 ON sys_userEdu_rlt (userId ASC); 
CREATE INDEX Idx_userEdu_00002 ON sys_userEdu_rlt (startDate ASC); 

create table sys_userExp_rlt (
	id varchar(36) not null,
	userId varchar(36) not null,
	company varchar(200) not null,
	position varchar(200) not null,
	startDate datetime,
	endDate datetime,
	isValid varchar(2),
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);
CREATE INDEX Idx_userExp_00001 ON sys_userExp_rlt (userId ASC); 
CREATE INDEX Idx_userExp_00002 ON sys_userExp_rlt (startDate ASC); 

CREATE TABLE sys_position(
	id varchar(36) NOT NULL,
	parentId varchar(36) NULL,
	name varchar(36) NOT NULL,
	isType varchar(2) NULL,
	remark varchar(2048) NULL,
	avgCost float(53) NULL,
	orderNum Integer,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**常用联系人关系表**/
create table sys_userContact_rlt(
	id varchar(36) not null,
	userId varchar(36) not null,
	contactId varchar(36) not null,
	PRIMARY KEY (id)
);

/**用户角色表**/
create table sys_userRole_rlt (
	id varchar(36) not null,
	userId varchar(36),
	roleId varchar(36),
	PRIMARY KEY (id)
);

/**用户配置导航表**/
create table sys_userConfig_rlt (
	id varchar(36) not null,
	userId varchar(36),
	type varchar(10),
	navigateMenuId text,
	PRIMARY KEY (id)
);

/**字段表**/
CREATE TABLE sys_field (
	id varchar(36) NOT NULL,
	colName varchar(50) NULL,
  	showName varchar(100),
	objectType varchar(36) NULL,
	dataType varchar(36),
  	htmlType varchar(36),
	fieldType varchar(2) NULL,
	displayWidth float(53) NULL,
  	remark varchar(1024) NULL,
	defaultValue longtext NULL,
	defaultRule varchar(4000) NULL,
  	extendClass varchar(256) NULL,
	layout varchar(2) NULL,
	showMobile varchar(2) NULL,
	isCommon varchar(2) NULL,
	parentId varchar(36) NULL,
	isDBField varchar(2),
  	isValid varchar(2) NULL,
  	orderNum Integer NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**字段排序表**/
CREATE TABLE sys_fieldNum (
	id varchar(36) NOT NULL,
	objectType varchar(50) NULL,
  	fieldId varchar(36) NULL,
  	orderNum Integer NULL,
	PRIMARY KEY (id)
);

/**数据源表**/
CREATE TABLE sys_dataSource (
	id varchar(36) NOT NULL,
	objectType varchar(2000),
	name varchar(256),
    val varchar(100),
	isSystem varchar(1),
    remark varchar(1024),
    linkFieldId varchar(4096),
    isValid varchar(2),
    orderNum Integer,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**数据源选项表**/
CREATE TABLE sys_dataOption (
	id varchar(36) NOT NULL,
	objectType varchar(2000),
	name varchar(256) NULL,
    dataBaseId varchar(36) NOT NULL,
	parentId varchar(36),
	isSystem varchar(1),
    remark varchar(1024),
	bgColor varchar(20),
	fColor varchar(20), 
    isValid varchar(2),
    orderNum Integer,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY (id)
);

/**实体和流程页面表**/
CREATE TABLE sys_page (
	id varchar(36) NOT NULL,
	name varchar(256),
	objectType varchar(100),
	pageType varchar(100),
	parentId varchar(36) NULL,
	workflowID varchar(36) NULL,
	deriveWfType varchar(36) NULL,
	deriveWfID varchar(36) NULL,
	mapField text NULL,
	isStartPage varchar(1) NULL,
	entityTypeID varchar(36) NULL,
	extPageUrl varchar(256) NULL,
	extPageCls varchar(256) NULL,
	subType varchar(100),
	isSystem varchar(1),
    remark varchar(1024),
    isValid varchar(2),
    orderNum Integer,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**页面与字段关联表**/
CREATE TABLE sys_pageField_rlt(
	id varchar(36) NOT NULL,
	pageId varchar(36),
	fieldId varchar(36),
	orderNum Integer,
	isRequired varchar(2),
	isReaded varchar(2),
	isReseted varchar(2),
	isRecorded varchar(2),
	isShowed varchar(2),
	layout varchar(2),
	isValid varchar(2),
	module varchar(100),
	PRIMARY KEY (id)
);

/**列表页面与字段关联表**/
CREATE TABLE sys_pageList_rlt(
	id varchar(36) NOT NULL,
	pageId varchar(36),
	objectType varchar(100),
	fieldView text NULL,
	filterCondition text NULL,
    isValid varchar(2),
	PRIMARY KEY(id)
);

/**实体和流程状态表**/
CREATE TABLE sys_status(
	id varchar(36) NOT NULL,
	objectType varchar(100),
	Name varchar(256) NULL,
	Remark varchar(1024) NULL,
	bgColor varchar(20) NULL,
	fColor varchar(20) NULL, 
	isCalcLag varchar(2) NULL,
	isEnd varchar(2) NULL,
    isValid varchar(2) NULL,
    orderNum Integer,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
ALTER TABLE sys_status ADD workflowId varchar(36);

/**高级设置表**/
CREATE TABLE sys_advanceSet(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	val varchar(4096) NULL,
	num Integer,
	objectType varchar(20) NULL,
	PRIMARY KEY(id)
);

/**数字单位表**/
CREATE TABLE sys_unit(
	id varchar(36) NOT NULL,
	name varchar(36) NULL,
	unit varchar(36) NOT NULL ,
	type varchar(20) NULL ,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**附件表**/
CREATE TABLE com_attachment (
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	objectType varchar(20) NULL,
	name varchar(256) NULL,
	extendName varchar(100) NULL,
	docId varchar(36) NULL,
	fileType varchar(128) NULL,
	fileSize float(53) NULL,
	remark varchar(256) NULL,
	address varchar(256) NULL,
	storageId varchar(36) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**用户委托表**/
CREATE TABLE sys_userAgent(
	id varchar(36) NOT NULL,
	userId varchar(36) NULL,
	defUserId varchar(36) NULL,
	startDate datetime NULL,
	endDate datetime NULL,
	type varchar(2) NULL,
	configView text NULL,
	PRIMARY KEY(id)
);

/**邮件通知**/
CREATE TABLE sys_mail(
	id varchar(36) NOT NULL,
	title varchar(256) NULL,
	host varchar(128) NULL,
	port int NULL,
	sender varchar(128) NULL,
	userName varchar(256) NULL,
	password varchar(128) NULL,
	content varchar(1024) NULL,
	footer varchar(512) NULL,
	type varchar(20) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**消息提醒**/
CREATE TABLE sys_message (
	id varchar(36) not NULL,
	code varchar(36) NULL,
	form varchar(36) NULL,
	tos varchar(4096) NULL,
	cc varchar(4096) NULL,
	subject varchar(215) NULL, 
	content text NULL, 
	type varchar(10) NULL,
	objectId varchar(36) NULL,
	objectType varchar(36) NULL,
	isSend varchar(2) null,
	isRead varchar(2) null,
	userId varchar(36), 
	createdTime datetime, 
	PRIMARY KEY(id)
);
CREATE INDEX sys_message_00001 ON sys_message(form ASC);
CREATE INDEX sys_message_00002 ON sys_message(type ASC);
CREATE INDEX sys_message_00003 ON sys_message(objectId ASC);
CREATE INDEX sys_message_00004 ON sys_message(objectType ASC);
CREATE INDEX sys_message_00005 ON sys_message(isSend ASC);
CREATE INDEX sys_message_00006 ON sys_message(userId ASC);
CREATE INDEX sys_message_00007 ON sys_message(createdTime DESC);

/**消息提醒历史**/
CREATE TABLE sys_messageHis (
	id varchar(36) not NULL,
	code varchar(36) NULL,
	form varchar(36) NULL,
	tos varchar(4096) NULL,
	cc varchar(4096) NULL,
	subject varchar(215) NULL, 
	content text NULL, 
	type varchar(10) NULL,
	objectId varchar(36) NULL,
	objectType varchar(36) NULL,
	userId varchar(36), 
	createdTime datetime, 
	PRIMARY KEY(id)
);
CREATE INDEX sys_messageHis_00001 ON sys_messageHis(form ASC);
CREATE INDEX sys_messageHis_00002 ON sys_messageHis(type ASC);
CREATE INDEX sys_messageHis_00003 ON sys_messageHis(objectId ASC);
CREATE INDEX sys_messageHis_00004 ON sys_messageHis(objectType ASC);
CREATE INDEX sys_messageHis_00005 ON sys_messageHis(userId ASC);
CREATE INDEX sys_messageHis_00006 ON sys_messageHis(createdTime DESC);

/**企业日历功能**/
CREATE TABLE sys_calendar(
	id varchar(36) NOT NULL,
	companyId varchar(36) NULL,
	dateId varchar(36) NOT NULL,
	workDays varchar(128) NULL,
	isValid varchar(1) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime NULL,
	modifyId varchar(36) NULL,
	modifyTime datetime NULL,
	PRIMARY KEY (id)
);
CREATE INDEX sys_calendar_00001 ON sys_calendar(dateId DESC);

/**用户转发**/
CREATE TABLE sys_userAgt(
	id varchar(36) NOT NULL,
	userId varchar(36) NULL,
	defUserId varchar(36) NULL,
	startDate datetime NULL,
	endDate datetime NULL,
	type varchar(1) NULL,
	configView text NULL,
	PRIMARY KEY (id)
);

/**报表设置表**/
CREATE TABLE sys_reportChart(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	simpleName varchar(256) NULL,
	status varchar(10) NULL,
	isCandidate varchar(36) NULL,
	objectType varchar(36) NULL,
	chartType varchar(36) NULL,
	dataFieldId varchar(36) NULL,
	categoryFieldId varchar(36) NULL, 
	scope varchar(50) NULL,
	remark varchar(2048) NULL, 
	orderNum int null,
	parentId varchar(36),
	pjtOrderNum int,
	pjtStatus VARCHAR(10),
	isUsePjt VARCHAR(2),
	height VARCHAR(10),
	width VARCHAR(10),
	isValid varchar(2) NULL,
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**系统操作日志表**/
CREATE TABLE sys_operateRecord (
	id varchar(36) NOT NULL,
	opUserId varchar(36) NULL,
	transitionId varchar(36) NULL,
	transitionName varchar(100) NULL,
    objectType varchar(36) NULL,
	objectTypeName varchar(100) NULL,
    objectId varchar(36) NULL,
	objectName varchar(4096) NULL,
	ip varchar(50) NULL,
	opTime datetime NULL,
    remark text,
    isValid varchar(2) NULL,
    PRIMARY KEY (id)
);
CREATE INDEX sys_operateRecord_00001 ON sys_operateRecord(opUserId ASC);
CREATE INDEX sys_operateRecord_00002 ON sys_operateRecord(transitionId ASC);
CREATE INDEX sys_operateRecord_00003 ON sys_operateRecord(objectType ASC);
CREATE INDEX sys_operateRecord_00004 ON sys_operateRecord(objectId ASC);
CREATE INDEX sys_operateRecord_00006 ON sys_operateRecord(ip ASC);
CREATE INDEX sys_operateRecord_00007 ON sys_operateRecord(opTime DESC);
CREATE INDEX sys_operateRecord_00008 ON sys_operateRecord(transitionName ASC);

/**公共的Aop模块关联表**/
CREATE TABLE com_aopModule_rlt(
	id varchar(36) not NULL,
	name varchar(256) NULL,
	val varchar(256) NULL,
	objectType varchar(36) NULL,
	exeCls varchar(2048) NULL,
	orderNum int null,
	PRIMARY KEY(id)
);
CREATE INDEX com_aopModule_rlt_00001 ON com_aopModule_rlt(objectType ASC);

/**公共看板表**/
CREATE TABLE com_scrumBoard(
	id varchar(36) not NULL,
	name varchar(256) NULL,
	objectType varchar(36) NULL,
	rltStatus varchar(4096) NULL,
	remark varchar(4096) NULL,
	orderNum int null,
	displayWidth float(53) NULL,
	isValid varchar(2) NULL,
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**定时器表**/
CREATE TABLE sys_timer(
	id varchar(36) NOT NULL,
	name varchar(200) NULL,
	timerName varchar(100) NULL,
	frequency int NULL,
	delay int NULL,
	period int NULL,
	isAllowConfig varchar(2) null,
	orderNum int NULL,
	isValid varchar(2) NULL,
	PRIMARY KEY (id)
);

/**系统运行日志表**/
CREATE TABLE sys_runLog(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	type varchar(36) NULL,
	remark text NULL,	
	isValid varchar(2) NULL,
	createdTime datetime NULL
);

/**报表管理表，我的地盘、驾驶舱等**/
CREATE TABLE sys_dashboard(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	simpleName varchar(256) NULL,
	status varchar(10) NULL,
	objectType varchar(36) NULL,
	remark varchar(2048) NULL, 
	orderNum int null,	
	isValid varchar(2) NULL,
	isSystem varchar(2) NULL,
	isClose varchar(2) NULL,
	moduleInfo longtext NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE sys_dashboardUserRlt(
	id varchar(36) NOT NULL,
	dashboardId varchar(36) NULL,
	userId varchar(36) NULL,
	moduleInfo longtext NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_dashboardUser_00001 ON sys_dashboardUserRlt (dashboardId ASC); 
CREATE INDEX Idx_dashboardUser_00002 ON sys_dashboardUserRlt (userId ASC); 

/**报表模块**/
CREATE TABLE sys_dashboardBlock(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	status varchar(10) NULL,
	blockType varchar(36) NULL,
	objectType varchar(36) NULL,
	scope varchar(50) NULL,
	remark varchar(2048) NULL, 
	height VARCHAR(10),
	width VARCHAR(10),
	params longtext,
	extendClass VARCHAR(200),
	orderNum int null,	
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
