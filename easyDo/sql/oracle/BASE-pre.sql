/**公司表**/
create table sys_company (
	id varchar2(36) not null,
	name varchar2(200) not null,
	simpleName varchar2(200),
	sysAddress varchar2(200),
	webAddress varchar2(200),
	telphone varchar2(100),
	address varchar2(2000),
	logoAddress varchar2(200), 
	workTime float, 
	redWorkTime float, 
	upWorkTime float, 
	lowWorkTime float, 
	grayWorkTime float, 
	standardWorkday float, 
	weekdays varchar2(100),
	amStartTime varchar2(50),
	amEndTime varchar2(50),
	pmStartTime varchar2(50),
	pmEndTime varchar2(50),
	isValid varchar2(2) default 'Y',
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**系统菜单**/
create table sys_menu (
	id varchar2(36) not null,
	name varchar2(200) not null,
	parentId varchar2(36),
	url varchar2(200), 
	perms varchar2(200), 
	type number, 
	icon varchar2(200),
	orderNum number,
	category varchar2(20),
	remark varchar2(2000),
	isSystem varchar2(2),
	preId varchar2(36),
	levels varchar2(2),
	moduleId varchar2(36),
	exeCls varchar2(200),
	isValid varchar2(2) default 'Y',
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**系统角色**/
create table sys_role (
	id varchar2(36) not null,
	name varchar2(200) not null,
	roleName varchar2(200) not null,
	roleSign varchar2(200),
	parentId varchar2(36) null,
	remark varchar2(2000),
	objectType varchar2(100),
	objectId varchar2(36),
	orderNum number,
	dataScope varchar2(2000),
	filterField clob,
	tabRight clob,
	isSystem varchar2(2),
	isValid varchar2(2) default 'Y',
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**角色和目录关系表**/
create table sys_roleMenu_rlt (
	id varchar2(36) not null,
	roleId varchar2(36) not null,
	menuId varchar2(36) not null,
	PRIMARY KEY (id)
);

/**部门**/
create table sys_dept (
	id varchar2(36) not null,
	name varchar2(200) not null,
	spellName varchar2(500),
	code varchar2(200) null,
	parentId varchar2(36) null,
	managerId varchar2(36) null,
	assistantId varchar2(36) null,
	telPhone varchar2(50) null,
	fax varchar2(50) null,
	officeAddress varchar2(2000) null,
	remark varchar2(2000) null,
	workflowGroupId varchar2(36) null,
	domainName varchar2(200) null,
	orderNum number,
	isValid varchar2(2) default 'Y',
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**用户**/
create table sys_user (
	id varchar2(36) not null,
	name varchar2(200) not null,
	username varchar2(200) not null,
	spellName varchar2(500),
	jobNumber varchar2(200),
	picId varchar2(200),
	password varchar2(200),
    deptId varchar2(36),
	deptName varchar2(200),
	email varchar2(100),
	status number,
	sex number,
	theme varchar2(20),
	skin varchar2(20),
	positionid varchar2(36),
	levelid varchar2(36),
	isworklog varchar2(2),
	birthdate TIMESTAMP,
	joindate TIMESTAMP,
	officeaddress varchar2(500),
	introduction clob,
	memory clob,
	telephone varchar2(100),
	maritalStatus varchar2(2),
	orderNum number,
	isValid varchar2(2) default 'Y',
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

create table sys_userEdu_rlt (
	id varchar2(36) not null,
	userId varchar2(36) not null,
	school varchar2(200) not null,
	levelId varchar2(36) not null,
	startDate TIMESTAMP,
	endDate TIMESTAMP,
	isValid varchar2(2),
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);
CREATE INDEX Idx_userEdu_00001 ON sys_userEdu_rlt (userId ASC); 
CREATE INDEX Idx_userEdu_00002 ON sys_userEdu_rlt (startDate ASC); 

create table sys_userExp_rlt (
	id varchar2(36) not null,
	userId varchar2(36) not null,
	company varchar2(200) not null,
	position varchar2(200) not null,
	startDate TIMESTAMP,
	endDate TIMESTAMP,
	isValid varchar2(2),
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);
CREATE INDEX Idx_userExp_00001 ON sys_userExp_rlt (userId ASC); 
CREATE INDEX Idx_userExp_00002 ON sys_userExp_rlt (startDate ASC); 

CREATE TABLE sys_position(
	id varchar2(36) NOT NULL,
	parentId varchar2(36) NULL,
	name varchar2(36) NOT NULL,
	isType varchar2(2) NULL,
	remark varchar2(2048) NULL,
	avgCost float(53) NULL,
	orderNum number,
	isValid varchar2(2),
  	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**常用联系人关系表**/
create table sys_userContact_rlt(
	id varchar2(36) not null,
	userId varchar2(36) not null,
	contactId varchar2(36) not null,
	PRIMARY KEY (id)
);

/**用户角色表**/
create table sys_userRole_rlt (
	id varchar2(36) not null,
	userId varchar2(36),
	roleId varchar2(36),
	PRIMARY KEY (id)
);

/**用户配置导航表**/
create table sys_userConfig_rlt (
	id varchar2(36) not null,
	userId varchar2(36),
	type varchar2(10),
	navigateMenuId clob,
	PRIMARY KEY (id)
);

/**字段表**/
CREATE TABLE sys_field (
	id varchar2(36) NOT NULL,
	colName varchar2(50) NULL,
  	showName varchar2(100),
	objectType varchar2(36) NULL,
	dataType varchar2(36),
  	htmlType varchar2(36),
	fieldType varchar2(2) NULL,
	displayWidth float(53) NULL,
  	remark varchar2(1024) NULL,
	defaultValue clob NULL,
	defaultRule varchar2(4000) NULL,
  	extendClass varchar2(256) NULL,
	layout varchar2(2) NULL,
	showMobile varchar2(2) NULL,
	isCommon varchar2(2) NULL,
	parentId varchar2(36) NULL,
	isDBField varchar2(2),
  	isValid varchar2(2) NULL,
  	orderNum number NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**字段排序表**/
CREATE TABLE sys_fieldNum (
	id varchar2(36) NOT NULL,
	objectType varchar2(50) NULL,
  	fieldId varchar2(36) NULL,
  	orderNum number NULL,
	PRIMARY KEY (id)
);

/**数据源表**/
CREATE TABLE sys_dataSource (
	id varchar2(36) NOT NULL,
	objectType varchar2(2000),
	name varchar2(256),
    val varchar2(100),
	isSystem varchar2(1),
    remark varchar2(1024),
    linkFieldId varchar2(4000),
    isValid varchar2(2),
    orderNum number,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**数据源选项表**/
CREATE TABLE sys_dataOption (
	id varchar2(36) NOT NULL,
	objectType varchar2(2000),
	name varchar2(256) NULL,
    dataBaseId varchar2(36) NOT NULL,
	parentId varchar2(36),
	isSystem varchar2(1),
    remark varchar2(1024),
	bgColor varchar2(20),
	fColor varchar2(20), 
    isValid varchar2(2),
    orderNum number,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY (id)
);

/**实体和流程页面表**/
CREATE TABLE sys_page (
	id varchar2(36) NOT NULL,
	name varchar2(256),
	objectType varchar2(100),
	pageType varchar2(100),
	parentId varchar2(36) NULL,
	workflowID varchar2(36) NULL,
	deriveWfType varchar2(36) NULL,
	deriveWfID varchar2(36) NULL,
	mapField clob NULL,
	isStartPage varchar2(1) NULL,
	entityTypeID varchar2(36) NULL,
	extPageUrl varchar2(256) NULL,
	extPageCls varchar2(256) NULL,
	subType varchar2(100),
	isSystem varchar2(1),
    remark varchar2(1024),
    isValid varchar2(2),
    orderNum number,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**页面与字段关联表**/
CREATE TABLE sys_pageField_rlt(
	id varchar2(36) NOT NULL,
	pageId varchar2(36),
	fieldId varchar2(36),
	orderNum number,
	isRequired varchar2(2),
	isReaded varchar2(2),
	isReseted varchar2(2),
	isRecorded varchar2(2),
	isShowed varchar2(2),
	layout varchar2(2),
	isValid varchar2(2),
	module varchar2(100),
	PRIMARY KEY (id)
);

/**列表页面与字段关联表**/
CREATE TABLE sys_pageList_rlt(
	id varchar2(36) NOT NULL,
	pageId varchar2(36),
	objectType varchar2(100),
	fieldView clob NULL,
	filterCondition clob NULL,
    isValid varchar2(2),
	PRIMARY KEY(id)
);

/**实体和流程状态表**/
CREATE TABLE sys_status(
	id varchar2(36) NOT NULL,
	objectType varchar2(100),
	Name varchar2(256) NULL,
	Remark varchar2(1024) NULL,
	bgColor varchar2(20) NULL,
	fColor varchar2(20) NULL, 
	isCalcLag varchar2(2) NULL,
	isEnd varchar2(2) NULL,
    isValid varchar2(2) NULL,
    orderNum number,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
ALTER TABLE sys_status ADD workflowId varchar2(36);

/**高级设置表**/
CREATE TABLE sys_advanceSet(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	val varchar2(4000) NULL,
	num number,
	objectType varchar2(20) NULL,
	PRIMARY KEY(id)
);

/**数字单位表**/
CREATE TABLE sys_unit(
	id varchar2(36) NOT NULL,
	name varchar2(36) NULL,
	unit varchar2(36) NOT NULL ,
	type varchar2(20) NULL ,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**附件表**/
CREATE TABLE com_attachment (
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(20) NULL,
	name varchar2(256) NULL,
	extendName varchar2(100) NULL,
	docId varchar2(36) NULL,
	fileType varchar2(128) NULL,
	fileSize float(53) NULL,
	remark varchar2(256) NULL,
	address varchar2(256) NULL,
	storageId varchar2(36) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**用户委托表**/
CREATE TABLE sys_userAgent(
	id varchar2(36) NOT NULL,
	userId varchar2(36) NULL,
	defUserId varchar2(36) NULL,
	startDate TIMESTAMP NULL,
	endDate TIMESTAMP NULL,
	type varchar2(2) NULL,
	configView clob NULL,
	PRIMARY KEY(id)
);

/**邮件通知**/
CREATE TABLE sys_mail(
	id varchar2(36) NOT NULL,
	title varchar2(256) NULL,
	host varchar2(128) NULL,
	port number NULL,
	sender varchar2(128) NULL,
	userName varchar2(256) NULL,
	password varchar2(128) NULL,
	content varchar2(1024) NULL,
	footer varchar2(512) NULL,
	type varchar2(20) NULL,
	isValid varchar2(2),
  	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**消息提醒**/
CREATE TABLE sys_message (
	id varchar2(36) not NULL,
	code varchar2(36) NULL,
	form varchar2(36) NULL,
	tos varchar2(4000) NULL,
	cc varchar2(4000) NULL,
	subject varchar2(215) NULL, 
	content clob NULL, 
	type varchar2(10) NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(36) NULL,
	isSend varchar2(2) null,
	isRead varchar2(2) null,
	userId varchar2(36), 
	createdTime TIMESTAMP, 
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
	id varchar2(36) not NULL,
	code varchar2(36) NULL,
	form varchar2(36) NULL,
	tos varchar2(4000) NULL,
	cc varchar2(4000) NULL,
	subject varchar2(215) NULL, 
	content clob NULL, 
	type varchar2(10) NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(36) NULL,
	userId varchar2(36), 
	createdTime TIMESTAMP, 
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
	id varchar2(36) NOT NULL,
	companyId varchar2(36) NULL,
	dateId varchar2(36) NOT NULL,
	workDays varchar2(128) NULL,
	isValid varchar2(1) NULL,
	creatorId varchar2(36) NULL,
	createdTime TIMESTAMP NULL,
	modifyId varchar2(36) NULL,
	modifyTime TIMESTAMP NULL,
	PRIMARY KEY (id)
);
CREATE INDEX sys_calendar_00001 ON sys_calendar(dateId DESC);

/**用户转发**/
CREATE TABLE sys_userAgt(
	id varchar2(36) NOT NULL,
	userId varchar2(36) NULL,
	defUserId varchar2(36) NULL,
	startDate TIMESTAMP NULL,
	endDate TIMESTAMP NULL,
	type varchar2(1) NULL,
	configView clob NULL,
	PRIMARY KEY (id)
);

/**报表设置表**/
CREATE TABLE sys_reportChart(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	simpleName varchar2(256) NULL,
	status varchar2(10) NULL,
	isCandidate varchar2(36) NULL,
	objectType varchar2(36) NULL,
	chartType varchar2(36) NULL,
	dataFieldId varchar2(36) NULL,
	categoryFieldId varchar2(36) NULL, 
	scope varchar2(50) NULL,
	remark varchar2(2048) NULL, 
	orderNum number null,
	parentId varchar2(36),
	pjtOrderNum number,
	pjtStatus varchar2(10),
	isUsePjt varchar2(2),
	height varchar2(10),
	width varchar2(10),
	isValid varchar2(2) NULL,
    creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**系统操作日志表**/
CREATE TABLE sys_operateRecord (
	id varchar2(36) NOT NULL,
	opUserId varchar2(36) NULL,
	transitionId varchar2(36) NULL,
	transitionName varchar2(100) NULL,
    objectType varchar2(36) NULL,
	objectTypeName varchar2(100) NULL,
    objectId varchar2(36) NULL,
	objectName varchar2(4000) NULL,
	ip varchar2(50) NULL,
	opTime TIMESTAMP NULL,
    remark clob,
    isValid varchar2(2) NULL,
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
	id varchar2(36) not NULL,
	name varchar2(256) NULL,
	val varchar2(256) NULL,
	objectType varchar2(36) NULL,
	exeCls varchar2(2048) NULL,
	orderNum number null,
	PRIMARY KEY(id)
);
CREATE INDEX com_aopModule_rlt_00001 ON com_aopModule_rlt(objectType ASC);

/**公共看板表**/
CREATE TABLE com_scrumBoard(
	id varchar2(36) not NULL,
	name varchar2(256) NULL,
	objectType varchar2(36) NULL,
	rltStatus varchar2(4000) NULL,
	remark varchar2(4000) NULL,
	orderNum number null,
	displayWidth float(53) NULL,
	isValid varchar2(2) NULL,
    creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**定时器表**/
CREATE TABLE sys_timer(
	id varchar2(36) NOT NULL,
	name varchar2(200) NULL,
	timerName varchar2(100) NULL,
	frequency number NULL,
	delay number NULL,
	period number NULL,
	isAllowConfig varchar2(2) null,
	orderNum number NULL,
	isValid varchar2(2) NULL,
	PRIMARY KEY (id)
);

/**系统运行日志表**/
CREATE TABLE sys_runLog(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	type varchar2(36) NULL,
	remark clob NULL,	
	isValid varchar2(2) NULL,
	createdTime TIMESTAMP NULL
);


/**报表管理表，我的地盘、驾驶舱等**/
CREATE TABLE sys_dashboard(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	simpleName varchar2(256) NULL,
	status varchar2(10) NULL,
	objectType varchar2(36) NULL,
	remark varchar2(2048) NULL, 
	orderNum number null,	
	isValid varchar2(2) NULL,
	isSystem varchar2(2) NULL,
	isClose varchar2(2) NULL,
	moduleInfo clob NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE sys_dashboardUserRlt(
	id varchar2(36) NOT NULL,
	dashboardId varchar2(36) NULL,
	userId varchar2(36) NULL,
	moduleInfo clob NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_dashboardUser_00001 ON sys_dashboardUserRlt (dashboardId ASC); 
CREATE INDEX Idx_dashboardUser_00002 ON sys_dashboardUserRlt (userId ASC); 

/**报表模块**/
CREATE TABLE sys_dashboardBlock(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	status varchar2(10) NULL,
	blockType varchar2(36) NULL,
	objectType varchar2(36) NULL,
	scope varchar2(50) NULL,
	remark varchar2(2048) NULL, 
	height varchar2(10),
	width varchar2(10),
	params clob,
	extendClass varchar2(200),
	orderNum number null,	
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);