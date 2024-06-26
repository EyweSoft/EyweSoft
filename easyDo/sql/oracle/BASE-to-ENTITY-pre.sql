/**设置实体表**/
CREATE TABLE sys_entity(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	objectType varchar2(100),
    remark varchar2(1024),
    nameRul clob NULL,
    orderNum Integer,
    isSystem varchar2(1),
    isValid varchar2(2),
    isClose varchar2(2),
    creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
ALTER TABLE sys_entity ADD simpleName varchar2(256);
ALTER TABLE sys_entity ADD codeRule varchar2(2048);
ALTER TABLE sys_entity ADD editionRule varchar2(2048);

/**生命周期表**/
CREATE TABLE en_lifecycle(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	status varchar2(36) NULL,
	objectType varchar2(20) NULL,
	remark varchar2(2048) NULL,
	isDefault varchar2(2) NULL,
	isSystem varchar2(2) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**生命阶段表**/
CREATE TABLE en_phase(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	status varchar2(36) NULL,
	objectType varchar2(20) NULL,
	remark varchar2(2048) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	bgColor varchar2(20),
	fColor varchar2(20), 
	isEnd varchar2(2) NULL,
	PRIMARY KEY(id)
);

/**生命周期与阶段关联表**/
CREATE TABLE en_lifecyclePhase_rlt (
	id varchar2(36) NOT NULL,
	objectType varchar2(20) NULL,
	type number,
	codeType number,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	fixTran varchar2(1024) NULL,
	exeCls varchar2(256) NULL,
	tranExeCls clob NULL,
	toId clob NULL,
	isHide varchar2(2) NULL,
	isValid varchar2(2) NULL,
	chgField clob NULL,
	notSend varchar2(2) NULL,
	closeRes varchar2(2) NULL,
	orderNum number,
	PRIMARY KEY(id)
);

/**实体类型表**/
CREATE TABLE en_type(
	id varchar2(36) not null,
	name varchar2(256) null,
	objectType varchar2(20) NULL,
	code varchar2(36) null,
	codeRule varchar2(2048) null,
	editionRule varchar2(2048) null,
	lifecycleId varchar2(36) null,
	parentId varchar2(36) null,
	workflowGroupId varchar2(36) null,
	planTemplateId varchar2(4000) null,
	remark varchar2(1024) null,
	bgColor varchar2(20) null,
	fColor varchar2(20) null,
	isSystem varchar2(2) null,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**版本记录表**/
CREATE TABLE en_verRls(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(36) NULL,
	releaseId varchar2(36) NULL,
	PRIMARY KEY(id)
);

/**实体评论表**/
CREATE TABLE en_entity_cmnt(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark varchar2(2048) NULL,
	replyId varchar2(36) NULL,
	parentId varchar2(36) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	PRIMARY KEY(id)
);

/**文件夹表**/
CREATE TABLE en_folder (
	id varchar2(36) NOT NULL,
	objectType varchar2(20) NULL,
	type varchar2(20) NULL,
	name varchar2(256) NULL,
	parentId varchar2(36) NULL,
	objectId varchar2(36) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

/**文件夹关联表**/
CREATE TABLE en_folder_rlt(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	PRIMARY KEY(id)
);

/**文档表**/
CREATE TABLE en_doc(
	id varchar2(36) NOT NULL,
	ueId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	typeId varchar2(36) NULL,
	productId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	departmentId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	belongTypeId varchar2(36) NULL,
	secLevId varchar2(36) NULL,
	quaLevId varchar2(36) NULL,
	code varchar2(512) NULL,
	version varchar2(256) NULL,
	versionType number,
	name varchar2(512) NULL,
	keyWords varchar2(512) NULL,
	summary varchar2(2048) NULL,
	remark varchar2(2048) NULL,
	address varchar2(1024) NULL,
    fileSize number,
    viewCount number,
    light number,
	downLoadCount number,
	upgradeCount number,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	authorId varchar2(2048) NULL,
	extendName varchar2(128) NULL,
	checkOutUserId varchar2(36) NULL,
	checkOutTime TIMESTAMP NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_docExt_00001 ON en_doc_ext (objectId ASC);

/**文档操作记录表**/
CREATE TABLE en_doc_rec(
	id varchar2(36) NOT NULL ,
	objectId varchar2(36) NULL ,
	remark clob NULL,
	type varchar2(36) NULL ,
	tempTime TIMESTAMP NULL ,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_docRec_00001 ON en_doc_rec (objectId ASC);
CREATE INDEX Idx_docRec_00002 ON en_doc_rec (creatorId ASC);
CREATE INDEX Idx_docRec_00003 ON en_doc_rec (createdTime DESC);

CREATE TABLE en_pjt(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	simpleName varchar2(256) NULL,
	code varchar2(512) NULL,
	typeId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	departmentId varchar2(36) NULL,
	productId varchar2(36) NULL,
	levelId varchar2(36) NULL,
	managerId varchar2(36) NULL,
	assistantId varchar2(36) NULL,
	customerName varchar2(256) NULL,
	address varchar2(256) NULL,
	planStartDate TIMESTAMP NULL,
	planEndDate TIMESTAMP NULL,
	realStartDate TIMESTAMP NULL,
	realEndDate TIMESTAMP NULL,
	copRate number NULL,
	devRate number NULL,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	remark varchar2(2048) NULL,
	lampSign number NULL,
	mileStoneId varchar2(36) NULL,
	status varchar2(2) NULL,
	statusDet varchar2(2) NULL,
	bakType varchar2(2) NULL,
	bakTime TIMESTAMP NULL,
	workload float(53) NULL,
	ueId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	version varchar2(256) NULL,
	versionType number NULL,
	pjtConfig clob NULL,
	groupId varchar2(36) NULL,
	step varchar2(2) NULL,
	checkOutUserId varchar2(36) NULL,
	checkOutTime TIMESTAMP, 
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtExt_00001 ON en_pjt_ext (objectId ASC);

CREATE TABLE en_pjt_rec(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark clob NULL,
	type varchar2(36) NULL,
	tempTime TIMESTAMP NULL ,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	targetId varchar2(36) NULL,
	targetType varchar2(36) NULL,
	targetName varchar2(4000) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtRec_00001 ON en_pjt_rec (objectId ASC);
CREATE INDEX Idx_pjtRec_00002 ON en_pjt_rec (creatorId ASC);
CREATE INDEX Idx_pjtRec_00003 ON en_pjt_rec (createdTime DESC);
CREATE INDEX Idx_pjtRec_00004 ON en_pjt_rec (targetId ASC);
CREATE INDEX Idx_pjtRec_00005 ON en_pjt_rec (targetType ASC);

CREATE TABLE en_pjt_phase(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	status number NULL,
	remark varchar2(1024) NULL,
	orderNum number,
	isTemplate varchar2(2) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	objectId varchar2(36), 
	objectType varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE en_pjtPhase_rlt (
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	isTemplete varchar2(2) NULL,
	phaseId varchar2(36) NULL,
	startMileId varchar2(36) NULL,
	endMileId varchar2(36) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pjtPhaseRlt_00001 ON en_pjtPhase_rlt (objectId ASC);
CREATE INDEX Idx_pjtPhaseRlt_00002 ON en_pjtPhase_rlt (phaseId ASC);

CREATE TABLE en_mst(
	id varchar2(36) NOT NULL,
	ueId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	typeId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	copRate number,
	devRate number,
	version varchar2(256) NULL,
	versionType number,
	name varchar2(256) NULL,
	code varchar2(512) NULL,
	remark varchar2(2048) NULL,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	isLock varchar2(2) NULL,
	isValid varchar2(2) NULL,
	light number, 
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mstExt_00001 ON en_mst_ext (objectId ASC);

CREATE TABLE en_mstNode(
	id varchar2(36) NOT NULL,
	name varchar2(36) NOT NULL,
	typeId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	mileId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	canDelete varchar2(2) NULL, 
	status varchar2(2) NULL,
	isTemplete varchar2(2) NULL,
	planEndDate TIMESTAMP NULL,
	realEndDate TIMESTAMP NULL,
	remark varchar2(256) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mstNode_00001 ON en_mstNode(typeId ASC);
CREATE INDEX Idx_mstNode_00002 ON en_mstNode(projectId ASC);
CREATE INDEX Idx_mstNode_00003 ON en_mstNode(mileId ASC);
CREATE INDEX Idx_mstNode_00004 ON en_mstNode(status ASC);
CREATE INDEX Idx_mstNode_00005 ON en_mstNode(phaseId ASC);

CREATE TABLE en_plan(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	parentId varchar2(36) NULL,
	isTemplate varchar2(2) NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(36) NULL,
	status varchar2(2) NULL,
	planStartDate TIMESTAMP NULL,
	planEndDate TIMESTAMP NULL,
	realStartDate TIMESTAMP NULL,
	realEndDate TIMESTAMP NULL,
	copRate number NULL,
	devRate number NULL,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	isCurPlan varchar2(2) NULL,
	remark varchar2(2048) NULL,
	lampSign number NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_plan_00001 ON en_plan(parentId ASC);
CREATE INDEX Idx_plan_00002 ON en_plan(isTemplate ASC);
CREATE INDEX Idx_plan_00003 ON en_plan(objectId ASC);

CREATE TABLE en_prq(
	id varchar2(36) NOT NULL,
	ueId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	typeId varchar2(36) NULL,
	productId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	departmentId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	belongTypeId varchar2(36) NULL,
	name varchar2(512) NULL,
	code varchar2(512) NULL,
	levelId varchar2(36) NULL,
	version varchar2(256) NULL,
	versionType number,
	remark varchar2(2048) NULL,
  	light number,
	upgradeCount number,
	scopeId varchar2(36) NULL,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	checkOutUserId varchar2(36) NULL,
	checkOutTime TIMESTAMP NULL,
	demandValue varchar2(2048) NULL,
	competition varchar2(2048) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_prqExt_00001 ON en_prq_ext (objectId ASC);

CREATE TABLE en_prq_rec(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark clob NULL,
	type varchar2(36) NULL,
	tempTime TIMESTAMP NULL,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_prqRec_00001 ON en_prq_rec (objectId ASC);
CREATE INDEX Idx_prqRec_00002 ON en_prq_rec (creatorId ASC);
CREATE INDEX Idx_prqRec_00003 ON en_prq_rec (createdTime DESC);

CREATE TABLE res_planBurnDown(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	objectType varchar2(36) NULL,
	planWorkload float(53) NULL,
	projectId varchar2(36) NULL,
	isValid varchar2(1) NULL,
	createdTime TIMESTAMP NULL,
	creatorId varchar2(36) NULL,
	modifyId varchar2(36) NULL,
	modifyTime TIMESTAMP NULL, 
	PRIMARY KEY (id)
);

CREATE TABLE res_schedule(
	id varchar2(36) NOT NULL,
	name varchar2(248) NULL,
	ownerId varchar2(36) NULL,
	actorId clob NULL,
	startDate TIMESTAMP,  
	endDate TIMESTAMP,  
	type varchar2(36) NULL,
	remark varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_resSchedule_00001 ON res_schedule (ownerId ASC);

CREATE TABLE res_weekly(
	id varchar2(36) NOT NULL,
	userId varchar2(36) NULL,
	startDate TIMESTAMP,  
	endDate TIMESTAMP,  
	question varchar2(4000) NULL,
	summary clob NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_resWeekly_00001 ON res_weekly (userId ASC);
CREATE INDEX Idx_resWeekly_00002 ON res_weekly (startDate DESC);

CREATE TABLE res_monthly(
	id varchar2(36) NOT NULL,
	userId varchar2(36) NULL,
	startDate TIMESTAMP,  
	endDate TIMESTAMP,  
	question varchar2(4000) NULL,
	summary clob NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_monthly_00001 ON res_monthly (userId ASC);
CREATE INDEX Idx_monthly_00002 ON res_monthly (startDate DESC);

CREATE TABLE res_effortSta(
	id varchar2(36) NOT NULL,
	userId varchar2(36) NULL,
	workDay TIMESTAMP NULL,
	type varchar2(10) NULL,
	effort float(53) NULL,
	isValid varchar2(2),
	creatorId varchar2(36),
	createdTime TIMESTAMP NULL,
	modifyId varchar2(36) NULL,
	modifyTime TIMESTAMP NULL,
	isDelay varchar2(2) NULL, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_effortSta_00001 ON res_effortSta (userId ASC);
CREATE INDEX Idx_effortSta_00002 ON res_effortSta (workDay DESC);
CREATE INDEX Idx_effortSta_00003 ON res_effortSta (type ASC);

/**任务主表**/
CREATE TABLE en_tsk(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	projectId varchar2(36) NULL,
	deptId varchar2(36) NULL,
	planId varchar2(36) NULL,
	nodeId varchar2(36) NULL,
	typeId varchar2(36) NULL,
  	levelId varchar2(36) NULL,
	planStartDate TIMESTAMP,
	planEndDate TIMESTAMP,
	realStartDate TIMESTAMP,
	realEndDate TIMESTAMP,
	planWorkload float,
	realWorkload float,
	remWorkload float,
	confirmWorkload float,
	planDuration number,
	realDuration number,
	copRate number,
	devRate number,
	statusId varchar2(36) NULL,
	ownerId varchar2(36) NULL,
	actorId clob NULL,
	publisherId varchar2(36) NULL,
	publishDate TIMESTAMP,
	auditorId varchar2(2048) NULL,
	keyEvent varchar2(36) NULL,
	acceptCriteria varchar2(2048) NULL,
	remark varchar2(2048) NULL,
	selfEvalId varchar2(36) NULL,
	lastEvalId varchar2(36) NULL,
	preTaskId varchar2(36) NULL,
	milestoneId varchar2(36) NULL,
	parentId varchar2(36) NULL,
	isNode varchar2(2) NULL,
	isShare varchar2(2) NULL,
	isTemplate varchar2(2) NULL,
	taskType varchar2(10) NULL,
	baselineData clob NULL,
	changeNum number,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskExt_00001 ON en_tsk_ext (objectId ASC); 

/**执行日报表**/
CREATE TABLE en_tsk_dayRpt (
	id varchar2(36) NOT NULL,
	taskId varchar2(36) NULL,
	reportDay TIMESTAMP NOT NULL,
	copRate number,
	fillWorkload float,
	confirmWorkload float,
	forRemWorkload float,
	forCopDate TIMESTAMP NULL,
	remark varchar2(2048) NULL,
	issueRemark varchar2(2048) NULL,
	isSameDay varchar2(2) NULL,
	isCheck varchar2(2) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskDayRpt_00001 ON en_tsk_dayRpt (taskId ASC); 
CREATE INDEX Idx_tskDayRpt_00002 ON en_tsk_dayRpt (creatorId ASC); 
CREATE INDEX Idx_tskDayRpt_00003 ON en_tsk_dayRpt (modifyTime DESC); 

/**任务操作记录表**/
CREATE TABLE en_tsk_rec(
	id varchar2(36) NOT NULL ,
	objectId varchar2(36) NULL ,
	remark clob NULL,
	type varchar2(36) NULL ,
	tempTime TIMESTAMP NULL ,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskRec_00001 ON en_tsk_rec (objectId ASC); 
CREATE INDEX Idx_tskRec_00002 ON en_tsk_rec (modifyTime DESC); 

/**任务评论表**/
CREATE TABLE en_tsk_cmnt(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark varchar2(2048) NULL,
	replyId varchar2(36) NULL,
	parentId varchar2(36) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskCmnt_00001 ON en_tsk_cmnt (objectId ASC); 
CREATE INDEX Idx_tskCmnt_00002 ON en_tsk_cmnt (replyId ASC); 
CREATE INDEX Idx_tskCmnt_00003 ON en_tsk_cmnt (parentId ASC); 
CREATE INDEX Idx_tskCmnt_00004 ON en_tsk_cmnt (createdTime DESC); 

/**任务关联表**/
CREATE TABLE en_tsk_rlt(
	id varchar2(36) NOT NULL,
	taskId varchar2(36) NULL,
	userId varchar2(36) NOT NULL ,
	isOwner varchar2(1) NULL ,
	role varchar2(2) NOT NULL ,
	isRed varchar2(1) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskRlt_00001 ON en_tsk_rlt (taskId ASC); 
CREATE INDEX Idx_tskRlt_00002 ON en_tsk_rlt (userId ASC); 
CREATE INDEX Idx_tskRlt_00003 ON en_tsk_rlt (creatorId ASC); 
CREATE INDEX Idx_tskRlt_00004 ON en_tsk_rlt (modifyTime DESC); 

CREATE TABLE en_tsk_depend(
	id varchar2(36) NOT NULL,
	fromTaskId varchar2(36) NULL,
	toTaskId varchar2(36) NULL,
	planId varchar2(36) NULL,
	type number,
	lag_ number, 
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tskDepend_00001 ON en_tsk_depend (fromTaskId ASC); 
CREATE INDEX Idx_tskDepend_00002 ON en_tsk_depend (toTaskId ASC); 
CREATE INDEX Idx_tskDepend_00003 ON en_tsk_depend (planId ASC); 

CREATE TABLE en_tsc(
	id varchar2(36) NOT NULL,
	ueId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	typeId varchar2(36) NULL,
	productId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	departmentId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	belongTypeId varchar2(36) NULL,
	name varchar2(512) NULL,
	code varchar2(512) NULL,
	levelId varchar2(36) NULL,
	version varchar2(256) NULL,
	versionType number,
	remark varchar2(2048) NULL,
  	light number,
	upgradeCount number,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	checkOutUserId varchar2(36) NULL,
	checkOutTime TIMESTAMP NULL,
	preconditions varchar2(2048) NULL,
	expected varchar2(2048) NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tscExt_00001 ON en_tsc_ext (objectId ASC);

CREATE TABLE en_tsc_rec(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark clob NULL,
	type varchar2(36) NULL,
	tempTime TIMESTAMP NULL,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tscRec_00001 ON en_tsc_rec (objectId ASC);
CREATE INDEX Idx_tscRec_00002 ON en_tsc_rec (creatorId ASC);
CREATE INDEX Idx_tscRec_00003 ON en_tsc_rec (createdTime DESC);

create table en_tsc_step (
	id varchar2(36) not null,
	step clob,
	expect clob,
	objectId varchar2(36) null,
	orderNum number,
	PRIMARY KEY (id)
);

CREATE TABLE en_tsp(
	id varchar2(36) NOT NULL,
	ueId varchar2(36) NULL,
	lifecycleId varchar2(36) NULL,
	phaseId varchar2(36) NULL,
	lcPhaseId varchar2(36) NULL,
	typeId varchar2(36) NULL,
	productId varchar2(36) NULL,
	projectId varchar2(36) NULL,
	departmentId varchar2(36) NULL,
	folderId varchar2(36) NULL,
	name varchar2(512) NULL,
	code varchar2(512) NULL,
	version varchar2(256) NULL,
	versionType number,
	remark varchar2(2048) NULL,
	ownerId varchar2(36) NULL,
	actorId varchar2(2048) NULL,
	checkOutUserId varchar2(36) NULL,
	checkOutTime TIMESTAMP NULL,
	orderNum number,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
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
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspExt_00001 ON en_tsp_ext (objectId ASC);

CREATE TABLE en_tsp_rec(
	id varchar2(36) NOT NULL,
	objectId varchar2(36) NULL,
	remark clob NULL,
	type varchar2(36) NULL,
	tempTime TIMESTAMP NULL,
	reason varchar2(2048) NULL,
	isValid varchar2(2) NULL,
	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspRec_00001 ON en_tsp_rec (objectId ASC);
CREATE INDEX Idx_tspRec_00002 ON en_tsp_rec (creatorId ASC);
CREATE INDEX Idx_tspRec_00003 ON en_tsp_rec (createdTime DESC);

CREATE TABLE en_tsp_tsc(
	id varchar2(36) NOT NULL,
	tspId varchar2(36) NULL,
	tscId varchar2(36) NULL,
	testerId varchar2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTsc_00001 ON en_tsp_tsc (tspId ASC);
CREATE INDEX Idx_tspTsc_00002 ON en_tsp_tsc (tscId ASC);
CREATE INDEX Idx_tspTsc_00003 ON en_tsp_tsc (testerId ASC);

CREATE TABLE en_tspTsc_result(
	id varchar2(36) NOT NULL,
	tspId varchar2(36) NULL,
	tscId varchar2(36) NULL,
	executor varchar2(36) NULL,
	executeTime TIMESTAMP,
	result varchar2(2) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTscResult_00001 ON en_tspTsc_result (tspId ASC);
CREATE INDEX Idx_tspTscResult_00002 ON en_tspTsc_result (tscId ASC);
CREATE INDEX Idx_tspTscResult_00003 ON en_tspTsc_result (executor ASC);
CREATE INDEX Idx_tspTscResult_00004 ON en_tspTsc_result (executeTime DESC);

CREATE TABLE en_tspTscStep_result(
	id varchar2(36) NOT NULL,
	stepId varchar2(36) NULL,
	tscResultId varchar2(36) NULL,
	result varchar2(2) NULL,
	reality clob NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_tspTscStepResult_00001 ON en_tspTscStep_result (tscResultId ASC);
CREATE INDEX Idx_tspTscStepResult_00002 ON en_tspTscStep_result (stepId ASC);