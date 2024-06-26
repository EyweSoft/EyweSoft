/**设置实体表**/
CREATE TABLE sys_entity(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	objectType varchar(100),
    remark varchar(1024),
    nameRul VARCHAR(MAX) NULL,
    orderNum Integer,
    isSystem varchar(1),
    isValid varchar(2),
    isClose varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
ALTER TABLE sys_entity ADD simpleName varchar(256);
ALTER TABLE sys_entity ADD codeRule varchar(2048);
ALTER TABLE sys_entity ADD editionRule varchar(2048);

/**生命周期表**/
CREATE TABLE en_lifecycle(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	status varchar(36) NULL,
	objectType varchar(20) NULL,
	remark varchar(2048) NULL,
	isDefault varchar(2) NULL,
	isSystem varchar(2) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**生命阶段表**/
CREATE TABLE en_phase(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	status varchar(36) NULL,
	objectType varchar(20) NULL,
	remark varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	bgColor varchar(20),
	fColor varchar(20), 
	isEnd varchar(2) NULL,
	PRIMARY KEY(id)
);

/**生命周期与阶段关联表**/
CREATE TABLE en_lifecyclePhase_rlt (
	id varchar(36) NOT NULL,
	objectType varchar(20) NULL,
	type Integer,
	codeType Integer,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	fixTran varchar(1024) NULL,
	exeCls varchar(256) NULL,
	tranExeCls VARCHAR(MAX) NULL,
	toId VARCHAR(MAX) NULL,
	isHide varchar(2) NULL,
	isValid varchar(2) NULL,
	chgField VARCHAR(MAX) NULL,
	notSend varchar(2) NULL,
	closeRes varchar(2) NULL,
	orderNum Integer,
	PRIMARY KEY(id)
);

/**实体类型表**/
CREATE TABLE en_type(
	id varchar(36) not null,
	name varchar(256) null,
	objectType varchar(20) NULL,
	code varchar(36) null,
	codeRule varchar(2048) null,
	editionRule varchar(2048) null,
	lifecycleId varchar(36) null,
	parentId varchar(36) null,
	workflowGroupId varchar(36) null,
	planTemplateId varchar(4096) null,
	remark varchar(1024) null,
	bgColor varchar(20) null,
	fColor varchar(20) null,
	isSystem varchar(2) null,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**版本记录表**/
CREATE TABLE en_verRls(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	objectType varchar(36) NULL,
	releaseId varchar(36) NULL,
	PRIMARY KEY(id)
);

/**实体评论表**/
CREATE TABLE en_entity_cmnt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark varchar(2048) NULL,
	replyId varchar(36) NULL,
	parentId varchar(36) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	PRIMARY KEY(id)
);

/**文件夹表**/
CREATE TABLE en_folder (
	id varchar(36) NOT NULL,
	objectType varchar(20) NULL,
	type varchar(20) NULL,
	name varchar(256) NULL,
	parentId varchar(36) NULL,
	objectId varchar(36) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**文件夹关联表**/
CREATE TABLE en_folder_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	folderId varchar(36) NULL,
	PRIMARY KEY(id)
);

/**文档表**/
CREATE TABLE en_doc(
	id varchar(36) NOT NULL,
	ueId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	typeId varchar(36) NULL,
	productId varchar(36) NULL,
	projectId varchar(36) NULL,
	departmentId varchar(36) NULL,
	folderId varchar(36) NULL,
	belongTypeId varchar(36) NULL,
	secLevId varchar(36) NULL,
	quaLevId varchar(36) NULL,
	code varchar(512) NULL,
	version varchar(256) NULL,
	versionType Integer,
	name varchar(512) NULL,
	keyWords varchar(512) NULL,
	summary varchar(2048) NULL,
	remark varchar(2048) NULL,
	address varchar(1024) NULL,
    fileSize Integer,
    viewCount Integer,
    light Integer,
	downLoadCount Integer,
	upgradeCount Integer,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	authorId varchar(2048) NULL,
	extendName varchar(128) NULL,
	checkOutUserId varchar(36) NULL,
	checkOutTime datetime NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_doc_00001 ON en_doc (lifecycleId ASC); 
CREATE INDEX Idx_doc_00002 ON en_doc (phaseId ASC); 
CREATE INDEX Idx_doc_00003 ON en_doc (lcPhaseId ASC); 
CREATE INDEX Idx_doc_00004 ON en_doc (typeId ASC);
CREATE INDEX Idx_doc_00005 ON en_doc (productId ASC);
CREATE INDEX Idx_doc_00006 ON en_doc (projectId ASC);
CREATE INDEX Idx_doc_00007 ON en_doc (departmentId ASC);
CREATE INDEX Idx_doc_00008 ON en_doc (folderId ASC);
CREATE INDEX Idx_doc_00009 ON en_doc (ownerId ASC);
CREATE INDEX Idx_doc_00010 ON en_doc (ueId ASC);
CREATE INDEX Idx_doc_00011 ON en_doc (creatorId ASC);
CREATE INDEX Idx_doc_00012 ON en_doc (modifyTime DESC);
CREATE INDEX Idx_doc_00013 ON en_doc (belongTypeId ASC);

/**文档扩展表**/
CREATE TABLE en_doc_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_docExt_00001 ON en_doc_ext (objectId ASC);

/**文档操作记录表**/
CREATE TABLE en_doc_rec(
	id varchar(36) NOT NULL ,
	objectId varchar(36) NULL ,
	remark VARCHAR(MAX) NULL DEFAULT NULL ,
	type varchar(36) NULL ,
	tempTime datetime NULL ,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_docRec_00001 ON en_doc_rec (objectId ASC);
CREATE INDEX Idx_docRec_00002 ON en_doc_rec (creatorId ASC);
CREATE INDEX Idx_docRec_00003 ON en_doc_rec (createdTime DESC);

CREATE TABLE en_pjt(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	simpleName varchar(256) NULL,
	code varchar(512) NULL,
	typeId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	departmentId varchar(36) NULL,
	productId varchar(36) NULL,
	levelId varchar(36) NULL,
	managerId varchar(36) NULL,
	assistantId varchar(36) NULL,
	customerName varchar(256) NULL,
	address varchar(256) NULL,
	planStartDate datetime NULL,
	planEndDate datetime NULL,
	realStartDate datetime NULL,
	realEndDate datetime NULL,
	copRate int NULL,
	devRate int NULL,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	remark varchar(2048) NULL,
	lampSign int NULL,
	mileStoneId varchar(36) NULL,
	status varchar(2) NULL,
	statusDet varchar(2) NULL,
	bakType varchar(2) NULL,
	bakTime datetime NULL,
	workload float(53) NULL,
	ueId varchar(36) NULL,
	folderId varchar(36) NULL,
	version varchar(256) NULL,
	versionType int NULL,
	pjtConfig VARCHAR(MAX) NULL,
	groupId varchar(36) NULL,
	step varchar(2) NULL,
	checkOutUserId varchar(36) NULL,
	checkOutTime datetime, 
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjt_00001 ON en_pjt (typeId ASC); 
CREATE INDEX Idx_pjt_00002 ON en_pjt (lifecycleId ASC); 
CREATE INDEX Idx_pjt_00003 ON en_pjt (phaseId ASC); 
CREATE INDEX Idx_pjt_00004 ON en_pjt (lcPhaseId ASC); 
CREATE INDEX Idx_pjt_00005 ON en_pjt (departmentId ASC); 
CREATE INDEX Idx_pjt_00006 ON en_pjt (productId ASC); 
CREATE INDEX Idx_pjt_00007 ON en_pjt (levelId ASC); 
CREATE INDEX Idx_pjt_00008 ON en_pjt (managerId ASC); 
CREATE INDEX Idx_pjt_00009 ON en_pjt (ownerId ASC); 
CREATE INDEX Idx_pjt_00010 ON en_pjt (mileStoneId ASC); 
CREATE INDEX Idx_pjt_00011 ON en_pjt (ueId ASC); 
CREATE INDEX Idx_pjt_00012 ON en_pjt (folderId ASC); 
CREATE INDEX Idx_pjt_00013 ON en_pjt (modifyTime DESC);  

CREATE TABLE en_pjt_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtExt_00001 ON en_pjt_ext (objectId ASC);

CREATE TABLE en_pjt_rec(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark VARCHAR(MAX) NULL DEFAULT NULL,
	type varchar(36) NULL,
	tempTime datetime NULL ,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	targetId varchar(36) NULL,
	targetType varchar(36) NULL,
	targetName varchar(4000) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtRec_00001 ON en_pjt_rec (objectId ASC);
CREATE INDEX Idx_pjtRec_00002 ON en_pjt_rec (creatorId ASC);
CREATE INDEX Idx_pjtRec_00003 ON en_pjt_rec (createdTime DESC);
CREATE INDEX Idx_pjtRec_00004 ON en_pjt_rec (targetId ASC);
CREATE INDEX Idx_pjtRec_00005 ON en_pjt_rec (targetType ASC);

CREATE TABLE en_pjt_phase(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	status int NULL,
	remark varchar(1024) NULL,
	orderNum Integer,
	isTemplate varchar(2) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	objectId varchar(36), 
	objectType varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE en_pjtPhase_rlt (
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	isTemplete varchar(2) NULL,
	phaseId varchar(36) NULL,
	startMileId varchar(36) NULL,
	endMileId varchar(36) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtPhaseRlt_00001 ON en_pjtPhase_rlt (objectId ASC);
CREATE INDEX Idx_pjtPhaseRlt_00002 ON en_pjtPhase_rlt (phaseId ASC);

CREATE TABLE en_mst(
	id varchar(36) NOT NULL,
	ueId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	typeId varchar(36) NULL,
	projectId varchar(36) NULL,
	copRate Integer,
	devRate Integer,
	version varchar(256) NULL,
	versionType Integer,
	name varchar(256) NULL,
	code varchar(512) NULL,
	remark varchar(2048) NULL,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	isLock varchar(2) NULL,
	isValid varchar(2) NULL,
	light Integer, 
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mst_00001 ON en_mst (ueId ASC);
CREATE INDEX Idx_mst_00002 ON en_mst (lifecycleId ASC);
CREATE INDEX Idx_mst_00003 ON en_mst (phaseId ASC);
CREATE INDEX Idx_mst_00004 ON en_mst (lcPhaseId ASC);
CREATE INDEX Idx_mst_00005 ON en_mst (typeId ASC);
CREATE INDEX Idx_mst_00006 ON en_mst (projectId ASC);
CREATE INDEX Idx_mst_00007 ON en_mst (version ASC);
CREATE INDEX Idx_mst_00008 ON en_mst (modifyTime DESC);

CREATE TABLE en_mst_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mstExt_00001 ON en_mst_ext (objectId ASC);

CREATE TABLE en_mstNode(
	id varchar(36) NOT NULL,
	name varchar(36) NOT NULL,
	typeId varchar(36) NULL,
	projectId varchar(36) NULL,
	mileId varchar(36) NULL,
	phaseId varchar(36) NULL,
	canDelete varchar(2) NULL, 
	status varchar(2) NULL,
	isTemplete varchar(2) NULL,
	planEndDate datetime NULL,
	realEndDate datetime NULL,
	remark varchar(256) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mstNode_00001 ON en_mstNode(typeId ASC);
CREATE INDEX Idx_mstNode_00002 ON en_mstNode(projectId ASC);
CREATE INDEX Idx_mstNode_00003 ON en_mstNode(mileId ASC);
CREATE INDEX Idx_mstNode_00004 ON en_mstNode(status ASC);
CREATE INDEX Idx_mstNode_00005 ON en_mstNode(phaseId ASC);

CREATE TABLE en_plan(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	parentId varchar(36) NULL,
	isTemplate varchar(2) NULL,
	objectId varchar(36) NULL,
	objectType varchar(36) NULL,
	status varchar(2) NULL,
	planStartDate datetime NULL,
	planEndDate datetime NULL,
	realStartDate datetime NULL,
	realEndDate datetime NULL,
	copRate int NULL,
	devRate int NULL,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	isCurPlan varchar(2) NULL,
	remark varchar(2048) NULL,
	lampSign int NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_plan_00001 ON en_plan(parentId ASC);
CREATE INDEX Idx_plan_00002 ON en_plan(isTemplate ASC);
CREATE INDEX Idx_plan_00003 ON en_plan(objectId ASC);

CREATE TABLE en_prq(
	id varchar(36) NOT NULL,
	ueId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	typeId varchar(36) NULL,
	productId varchar(36) NULL,
	projectId varchar(36) NULL,
	departmentId varchar(36) NULL,
	folderId varchar(36) NULL,
	belongTypeId varchar(36) NULL,
	name varchar(512) NULL,
	code varchar(512) NULL,
	levelId varchar(36) NULL,
	version varchar(256) NULL,
	versionType Integer,
	remark varchar(2048) NULL,
  	light Integer,
	upgradeCount Integer,
	scopeId varchar(36) NULL,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	checkOutUserId varchar(36) NULL,
	checkOutTime datetime NULL,
	demandValue varchar(2048) NULL,
	competition varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_prq_00001 ON en_prq (lifecycleId ASC); 
CREATE INDEX Idx_prq_00002 ON en_prq (phaseId ASC); 
CREATE INDEX Idx_prq_00003 ON en_prq (lcPhaseId ASC); 
CREATE INDEX Idx_prq_00004 ON en_prq (typeId ASC);
CREATE INDEX Idx_prq_00005 ON en_prq (productId ASC);
CREATE INDEX Idx_prq_00006 ON en_prq (projectId ASC);
CREATE INDEX Idx_prq_00007 ON en_prq (departmentId ASC);
CREATE INDEX Idx_prq_00008 ON en_prq (folderId ASC);
CREATE INDEX Idx_prq_00009 ON en_prq (ownerId ASC);
CREATE INDEX Idx_prq_00010 ON en_prq (ueId ASC);
CREATE INDEX Idx_prq_00011 ON en_prq (creatorId ASC);
CREATE INDEX Idx_prq_00012 ON en_prq (modifyTime DESC);
CREATE INDEX Idx_prq_00013 ON en_prq (belongTypeId ASC);
CREATE INDEX Idx_prq_00014 ON en_prq (levelId ASC);

CREATE TABLE en_prq_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_prqExt_00001 ON en_prq_ext (objectId ASC);

CREATE TABLE en_prq_rec(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark VARCHAR(MAX) NULL DEFAULT NULL,
	type varchar(36) NULL,
	tempTime datetime NULL,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_prqRec_00001 ON en_prq_rec (objectId ASC);
CREATE INDEX Idx_prqRec_00002 ON en_prq_rec (creatorId ASC);
CREATE INDEX Idx_prqRec_00003 ON en_prq_rec (createdTime DESC);

CREATE TABLE res_planBurnDown(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	objectType varchar(36) NULL,
	planWorkload float(53) NULL,
	projectId varchar(36) NULL,
	isValid varchar(1) NULL,
	createdTime datetime NULL,
	creatorId varchar(36) NULL,
	modifyId varchar(36) NULL,
	modifyTime datetime NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE res_schedule(
	id varchar(36) NOT NULL,
	name varchar(248) NULL,
	ownerId varchar(36) NULL,
	actorId VARCHAR(MAX) NULL,
	startDate datetime,  
	endDate datetime,  
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_resSchedule_00001 ON res_schedule (ownerId ASC);

CREATE TABLE res_weekly(
	id varchar(36) NOT NULL,
	userId varchar(36) NULL,
	startDate datetime,  
	endDate datetime,  
	question varchar(4096) NULL,
	summary VARCHAR(MAX) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_resWeekly_00001 ON res_weekly (userId ASC);
CREATE INDEX Idx_resWeekly_00002 ON res_weekly (startDate DESC);

CREATE TABLE res_monthly(
	id varchar(36) NOT NULL,
	userId varchar(36) NULL,
	startDate datetime,  
	endDate datetime,  
	question varchar(4096) NULL,
	summary VARCHAR(MAX) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_monthly_00001 ON res_monthly (userId ASC);
CREATE INDEX Idx_monthly_00002 ON res_monthly (startDate DESC);

CREATE TABLE res_effortSta(
	id varchar(36) NOT NULL,
	userId varchar(36) NULL,
	workDay datetime NULL,
	type varchar(10) NULL,
	effort float(53) NULL,
	isValid varchar(2),
	creatorId varchar(36),
	createdTime datetime NULL,
	modifyId varchar(36) NULL,
	modifyTime datetime NULL,
	isDelay varchar(2) NULL, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_effortSta_00001 ON res_effortSta (userId ASC);
CREATE INDEX Idx_effortSta_00002 ON res_effortSta (workDay DESC);
CREATE INDEX Idx_effortSta_00003 ON res_effortSta (type ASC);

/**任务主表**/
CREATE TABLE en_tsk(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	deptId varchar(36) NULL,
	planId varchar(36) NULL,
	nodeId varchar(36) NULL,
	typeId varchar(36) NULL,
  	levelId varchar(36) NULL,
	planStartDate datetime,
	planEndDate datetime,
	realStartDate datetime,
	realEndDate datetime,
	planWorkload float,
	realWorkload float,
	remWorkload float,
	confirmWorkload float,
	planDuration Integer,
	realDuration Integer,
	copRate Integer,
	devRate Integer,
	statusId varchar(36) NULL,
	ownerId varchar(36) NULL,
	actorId VARCHAR(MAX) NULL,
	publisherId varchar(36) NULL,
	publishDate datetime,
	auditorId varchar(2048) NULL,
	keyEvent varchar(36) NULL,
	acceptCriteria varchar(2048) NULL,
	remark varchar(2048) NULL,
	selfEvalId varchar(36) NULL,
	lastEvalId varchar(36) NULL,
	preTaskId varchar(36) NULL,
	milestoneId varchar(36) NULL,
	parentId varchar(36) NULL,
	isNode varchar(2) NULL,
	isShare varchar(2) NULL,
	isTemplate varchar(2) NULL,
	taskType varchar(10) NULL,
	baselineData VARCHAR(MAX) NULL,
	changeNum Integer,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tsk_00001 ON en_tsk (projectId ASC); 
CREATE INDEX Idx_tsk_00002 ON en_tsk (deptId ASC); 
CREATE INDEX Idx_tsk_00003 ON en_tsk (planId ASC); 
CREATE INDEX Idx_tsk_00004 ON en_tsk (typeId ASC);
CREATE INDEX Idx_tsk_00005 ON en_tsk (levelId ASC);
CREATE INDEX Idx_tsk_00006 ON en_tsk (ownerId ASC);
CREATE INDEX Idx_tsk_00008 ON en_tsk (statusId ASC);
CREATE INDEX Idx_tsk_00009 ON en_tsk (parentId ASC);
CREATE INDEX Idx_tsk_00010 ON en_tsk (creatorId ASC);
CREATE INDEX Idx_tsk_00011 ON en_tsk (modifyTime DESC);

/**任务扩展表**/
CREATE TABLE en_tsk_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskExt_00001 ON en_tsk_ext (objectId ASC); 

/**执行日报表**/
CREATE TABLE en_tsk_dayRpt (
	id varchar(36) NOT NULL,
	taskId varchar(36) NULL,
	reportDay datetime NOT NULL,
	copRate Integer,
	fillWorkload float,
	confirmWorkload float,
	forRemWorkload float,
	forCopDate datetime NULL,
	remark varchar(2048) NULL,
	issueRemark varchar(2048) NULL,
	isSameDay varchar(2) NULL,
	isCheck varchar(2) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskDayRpt_00001 ON en_tsk_dayRpt (taskId ASC); 
CREATE INDEX Idx_tskDayRpt_00002 ON en_tsk_dayRpt (creatorId ASC); 
CREATE INDEX Idx_tskDayRpt_00003 ON en_tsk_dayRpt (modifyTime DESC); 

/**任务操作记录表**/
CREATE TABLE en_tsk_rec(
	id varchar(36) NOT NULL ,
	objectId varchar(36) NULL ,
	remark VARCHAR(MAX) NULL DEFAULT NULL ,
	type varchar(36) NULL ,
	tempTime datetime NULL ,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskRec_00001 ON en_tsk_rec (objectId ASC); 
CREATE INDEX Idx_tskRec_00002 ON en_tsk_rec (modifyTime DESC); 

/**任务评论表**/
CREATE TABLE en_tsk_cmnt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark varchar(2048) NULL,
	replyId varchar(36) NULL,
	parentId varchar(36) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskCmnt_00001 ON en_tsk_cmnt (objectId ASC); 
CREATE INDEX Idx_tskCmnt_00002 ON en_tsk_cmnt (replyId ASC); 
CREATE INDEX Idx_tskCmnt_00003 ON en_tsk_cmnt (parentId ASC); 
CREATE INDEX Idx_tskCmnt_00004 ON en_tsk_cmnt (createdTime DESC); 

/**任务关联表**/
CREATE TABLE en_tsk_rlt(
	id varchar(36) NOT NULL,
	taskId varchar(36) NULL,
	userId varchar(36) NOT NULL ,
	isOwner varchar(1) NULL ,
	role varchar(2) NOT NULL ,
	isRed varchar(1) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskRlt_00001 ON en_tsk_rlt (taskId ASC); 
CREATE INDEX Idx_tskRlt_00002 ON en_tsk_rlt (userId ASC); 
CREATE INDEX Idx_tskRlt_00003 ON en_tsk_rlt (creatorId ASC); 
CREATE INDEX Idx_tskRlt_00004 ON en_tsk_rlt (modifyTime DESC); 

CREATE TABLE en_tsk_depend(
	id varchar(36) NOT NULL,
	fromTaskId varchar(36) NULL,
	toTaskId varchar(36) NULL,
	planId varchar(36) NULL,
	type Integer,
	lag_ Integer, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskDepend_00001 ON en_tsk_depend (fromTaskId ASC); 
CREATE INDEX Idx_tskDepend_00002 ON en_tsk_depend (toTaskId ASC); 
CREATE INDEX Idx_tskDepend_00003 ON en_tsk_depend (planId ASC); 

CREATE TABLE en_tsc(
	id varchar(36) NOT NULL,
	ueId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	typeId varchar(36) NULL,
	productId varchar(36) NULL,
	projectId varchar(36) NULL,
	departmentId varchar(36) NULL,
	folderId varchar(36) NULL,
	belongTypeId varchar(36) NULL,
	name varchar(512) NULL,
	code varchar(512) NULL,
	levelId varchar(36) NULL,
	version varchar(256) NULL,
	versionType Integer,
	remark varchar(2048) NULL,
  	light Integer,
	upgradeCount Integer,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	checkOutUserId varchar(36) NULL,
	checkOutTime datetime NULL,
	preconditions varchar(2048) NULL,
	expected varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tsc_00001 ON en_tsc (lifecycleId ASC); 
CREATE INDEX Idx_tsc_00002 ON en_tsc (phaseId ASC); 
CREATE INDEX Idx_tsc_00003 ON en_tsc (lcPhaseId ASC); 
CREATE INDEX Idx_tsc_00004 ON en_tsc (typeId ASC);
CREATE INDEX Idx_tsc_00005 ON en_tsc (productId ASC);
CREATE INDEX Idx_tsc_00006 ON en_tsc (projectId ASC);
CREATE INDEX Idx_tsc_00007 ON en_tsc (departmentId ASC);
CREATE INDEX Idx_tsc_00008 ON en_tsc (folderId ASC);
CREATE INDEX Idx_tsc_00009 ON en_tsc (ownerId ASC);
CREATE INDEX Idx_tsc_00010 ON en_tsc (ueId ASC);
CREATE INDEX Idx_tsc_00011 ON en_tsc (creatorId ASC);
CREATE INDEX Idx_tsc_00012 ON en_tsc (modifyTime DESC);
CREATE INDEX Idx_tsc_00013 ON en_tsc (belongTypeId ASC);
CREATE INDEX Idx_tsc_00014 ON en_tsc (levelId ASC);

CREATE TABLE en_tsc_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tscExt_00001 ON en_tsc_ext (objectId ASC);

CREATE TABLE en_tsc_rec(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark VARCHAR(MAX) NULL DEFAULT NULL,
	type varchar(36) NULL,
	tempTime datetime NULL,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tscRec_00001 ON en_tsc_rec (objectId ASC);
CREATE INDEX Idx_tscRec_00002 ON en_tsc_rec (creatorId ASC);
CREATE INDEX Idx_tscRec_00003 ON en_tsc_rec (createdTime DESC);

create table en_tsc_step (
	id varchar(36) not null,
	step VARCHAR(MAX),
	expect VARCHAR(MAX),
	objectId varchar(36) null,
	orderNum Integer,
	PRIMARY KEY (id)
);

CREATE TABLE en_tsp(
	id varchar(36) NOT NULL,
	ueId varchar(36) NULL,
	lifecycleId varchar(36) NULL,
	phaseId varchar(36) NULL,
	lcPhaseId varchar(36) NULL,
	typeId varchar(36) NULL,
	productId varchar(36) NULL,
	projectId varchar(36) NULL,
	departmentId varchar(36) NULL,
	folderId varchar(36) NULL,
	name varchar(512) NULL,
	code varchar(512) NULL,
	version varchar(256) NULL,
	versionType Integer,
	remark varchar(2048) NULL,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	checkOutUserId varchar(36) NULL,
	checkOutTime datetime NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tsp_00001 ON en_tsp (lifecycleId ASC); 
CREATE INDEX Idx_tsp_00002 ON en_tsp (phaseId ASC); 
CREATE INDEX Idx_tsp_00003 ON en_tsp (lcPhaseId ASC); 
CREATE INDEX Idx_tsp_00004 ON en_tsp (typeId ASC);
CREATE INDEX Idx_tsp_00005 ON en_tsp (productId ASC);
CREATE INDEX Idx_tsp_00006 ON en_tsp (projectId ASC);
CREATE INDEX Idx_tsp_00007 ON en_tsp (departmentId ASC);
CREATE INDEX Idx_tsp_00008 ON en_tsp (folderId ASC);
CREATE INDEX Idx_tsp_00009 ON en_tsp (ownerId ASC);
CREATE INDEX Idx_tsp_00010 ON en_tsp (ueId ASC);
CREATE INDEX Idx_tsp_00011 ON en_tsp (creatorId ASC);
CREATE INDEX Idx_tsp_00012 ON en_tsp (modifyTime DESC);

CREATE TABLE en_tsp_ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspExt_00001 ON en_tsp_ext (objectId ASC);

CREATE TABLE en_tsp_rec(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	remark VARCHAR(MAX) NULL DEFAULT NULL,
	type varchar(36) NULL,
	tempTime datetime NULL,
	reason varchar(2048) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspRec_00001 ON en_tsp_rec (objectId ASC);
CREATE INDEX Idx_tspRec_00002 ON en_tsp_rec (creatorId ASC);
CREATE INDEX Idx_tspRec_00003 ON en_tsp_rec (createdTime DESC);

CREATE TABLE en_tsp_tsc(
	id varchar(36) NOT NULL,
	tspId varchar(36) NULL,
	tscId varchar(36) NULL,
	testerId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTsc_00001 ON en_tsp_tsc (tspId ASC);
CREATE INDEX Idx_tspTsc_00002 ON en_tsp_tsc (tscId ASC);
CREATE INDEX Idx_tspTsc_00003 ON en_tsp_tsc (testerId ASC);

CREATE TABLE en_tspTsc_result(
	id varchar(36) NOT NULL,
	tspId varchar(36) NULL,
	tscId varchar(36) NULL,
	executor varchar(36) NULL,
	executeTime datetime,
	result varchar(2) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTscResult_00001 ON en_tspTsc_result (tspId ASC);
CREATE INDEX Idx_tspTscResult_00002 ON en_tspTsc_result (tscId ASC);
CREATE INDEX Idx_tspTscResult_00003 ON en_tspTsc_result (executor ASC);
CREATE INDEX Idx_tspTscResult_00004 ON en_tspTsc_result (executeTime DESC);

CREATE TABLE en_tspTscStep_result(
	id varchar(36) NOT NULL,
	stepId varchar(36) NULL,
	tscResultId varchar(36) NULL,
	result varchar(2) NULL,
	reality VARCHAR(MAX) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTscStepResult_00001 ON en_tspTscStep_result (tscResultId ASC);
CREATE INDEX Idx_tspTscStepResult_00002 ON en_tspTscStep_result (stepId ASC);