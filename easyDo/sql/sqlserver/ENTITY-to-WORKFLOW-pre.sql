CREATE TABLE act_evt_log (
    LOG_NR_ bigint IDENTITY(1,1) PRIMARY KEY,
    TYPE_ varchar(64) NULL,
    PROC_DEF_ID_ varchar(64) NULL,
    PROC_INST_ID_ varchar(64) NULL,
    EXECUTION_ID_ varchar(64) NULL,
    TASK_ID_ varchar(64) NULL,
    TIME_STAMP_ datetime2(3) NOT NULL DEFAULT GETDATE(),
    USER_ID_ varchar(255) NULL,
    DATA_ VARBINARY(MAX),
    LOCK_OWNER_ varchar(255) NULL,
    LOCK_TIME_ datetime2(3) NULL DEFAULT NULL,
    IS_PROCESSED_ tinyint DEFAULT 0
);

CREATE TABLE act_re_deployment (
    ID_ varchar(64) PRIMARY KEY,
    NAME_ varchar(255) NULL,
    CATEGORY_ varchar(255) NULL,
    TENANT_ID_ varchar(255) DEFAULT '',
    DEPLOY_TIME_ datetime2(3) NULL DEFAULT NULL,
    ENGINE_VERSION_ varchar(255) NULL,
    KEY_ varchar(255) NULL
);

CREATE TABLE act_ge_bytearray (
    ID_ varchar(64) PRIMARY KEY,
    REV_ int DEFAULT NULL,
    NAME_ varchar(255) NULL,
    DEPLOYMENT_ID_ varchar(64) NULL,
    BYTES_ VARBINARY(MAX),
    GENERATED_ tinyint DEFAULT NULL,
    CONSTRAINT ACT_FK_BYTEARR_DEPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES act_re_deployment (ID_)
);

CREATE TABLE act_ge_property (
   NAME_ varchar(64) NOT NULL,
   VALUE_ varchar(300) DEFAULT NULL,
   REV_ int DEFAULT NULL,
   PRIMARY KEY (NAME_)
);

CREATE TABLE act_hi_actinst (
   ID_ varchar(64) NOT NULL,
   PROC_DEF_ID_ varchar(64) NOT NULL,
   PROC_INST_ID_ varchar(64) NOT NULL,
   EXECUTION_ID_ varchar(64) NOT NULL,
   ACT_ID_ varchar(255) NOT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   CALL_PROC_INST_ID_ varchar(64) DEFAULT NULL,
   ACT_NAME_ varchar(255) DEFAULT NULL,
   ACT_TYPE_ varchar(255) NOT NULL,
   ASSIGNEE_ varchar(255) DEFAULT NULL,
   START_TIME_ datetime2(3) NOT NULL,
   END_TIME_ datetime2(3) DEFAULT NULL,
   DURATION_ bigint DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   DELETE_REASON_ varchar(4000) DEFAULT NULL,
   PRIMARY KEY (ID_),
   INDEX ACT_IDX_HI_ACT_INST_START (START_TIME_),
   INDEX ACT_IDX_HI_ACT_INST_END (END_TIME_),
   INDEX ACT_IDX_HI_ACT_INST_PROCINST (PROC_INST_ID_, ACT_ID_),
   INDEX ACT_IDX_HI_ACT_INST_EXEC (EXECUTION_ID_, ACT_ID_)
);

CREATE TABLE act_hi_attachment (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   USER_ID_ varchar(255) DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   DESCRIPTION_ varchar(4000) DEFAULT NULL,
   TYPE_ varchar(255) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   URL_ varchar(4000) DEFAULT NULL,
   CONTENT_ID_ varchar(64) DEFAULT NULL,
   TIME_ datetime2(3) DEFAULT NULL,
   PRIMARY KEY (ID_)
);

CREATE TABLE act_hi_comment (
   ID_ varchar(64) NOT NULL,
   TYPE_ varchar(255) DEFAULT NULL,
   TIME_ datetime2(3) NOT NULL,
   USER_ID_ varchar(255) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   ACTION_ varchar(255) DEFAULT NULL,
   MESSAGE_ varchar(4000) DEFAULT NULL,
   FULL_MSG_ VARBINARY(MAX),
   PRIMARY KEY (ID_)
);

CREATE TABLE act_hi_detail (
   ID_ varchar(64) NOT NULL,
   TYPE_ varchar(255) NOT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   ACT_INST_ID_ varchar(64) DEFAULT NULL,
   NAME_ varchar(255) NOT NULL,
   VAR_TYPE_ varchar(255) DEFAULT NULL,
   REV_ int DEFAULT NULL,
   TIME_ datetime2(3) NOT NULL,
   BYTEARRAY_ID_ varchar(64) DEFAULT NULL,
   DOUBLE_ float DEFAULT NULL,
   LONG_ bigint DEFAULT NULL,
   TEXT_ varchar(4000) DEFAULT NULL,
   TEXT2_ varchar(4000) DEFAULT NULL,
   PRIMARY KEY (ID_)
);

CREATE TABLE act_hi_identitylink (
   ID_ varchar(64) NOT NULL,
   GROUP_ID_ varchar(255) DEFAULT NULL,
   TYPE_ varchar(255) DEFAULT NULL,
   USER_ID_ varchar(255) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   PRIMARY KEY (ID_)
);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER ON act_hi_identitylink (USER_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TASK ON act_hi_identitylink (TASK_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROCINST ON act_hi_identitylink (PROC_INST_ID_);

CREATE TABLE act_hi_procinst (
   ID_ varchar(64) NOT NULL,
   PROC_INST_ID_ varchar(64) NOT NULL,
   BUSINESS_KEY_ varchar(255) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) NOT NULL,
   START_TIME_ datetime NOT NULL,
   END_TIME_ datetime DEFAULT NULL,
   DURATION_ bigint DEFAULT NULL,
   START_USER_ID_ varchar(255) DEFAULT NULL,
   START_ACT_ID_ varchar(255) DEFAULT NULL,
   END_ACT_ID_ varchar(255) DEFAULT NULL,
   SUPER_PROCESS_INSTANCE_ID_ varchar(64) DEFAULT NULL,
   DELETE_REASON_ varchar(4000) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   NAME_ varchar(255) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT UNQ_PROC_INST_ID UNIQUE (PROC_INST_ID_),
   INDEX ACT_IDX_HI_PRO_INST_END (END_TIME_),
   INDEX ACT_IDX_HI_PRO_I_BUSKEY (BUSINESS_KEY_)
);

CREATE TABLE act_hi_taskinst (
   ID_ varchar(64) NOT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   TASK_DEF_KEY_ varchar(255) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   PARENT_TASK_ID_ varchar(64) DEFAULT NULL,
   DESCRIPTION_ varchar(4000) DEFAULT NULL,
   OWNER_ varchar(255) DEFAULT NULL,
   ASSIGNEE_ varchar(255) DEFAULT NULL,
   START_TIME_ datetime NOT NULL,
   CLAIM_TIME_ datetime DEFAULT NULL,
   END_TIME_ datetime DEFAULT NULL,
   DURATION_ bigint DEFAULT NULL,
   DELETE_REASON_ varchar(4000) DEFAULT NULL,
   PRIORITY_ int DEFAULT NULL,
   DUE_DATE_ datetime DEFAULT NULL,
   FORM_KEY_ varchar(255) DEFAULT NULL,
   CATEGORY_ varchar(255) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   INDEX ACT_IDX_HI_TASK_INST_PROCINST (PROC_INST_ID_)
);

CREATE TABLE act_hi_varinst (
   ID_ varchar(64) NOT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   NAME_ varchar(255) NOT NULL,
   VAR_TYPE_ varchar(100) DEFAULT NULL,
   REV_ int DEFAULT NULL,
   BYTEARRAY_ID_ varchar(64) DEFAULT NULL,
   DOUBLE_ float DEFAULT NULL,
   LONG_ bigint DEFAULT NULL,
   TEXT_ varchar(4000) DEFAULT NULL,
   TEXT2_ varchar(4000) DEFAULT NULL,
   CREATE_TIME_ datetime DEFAULT NULL,
   LAST_UPDATED_TIME_ datetime DEFAULT NULL,
   PRIMARY KEY (ID_),
   INDEX ACT_IDX_HI_PROCVAR_PROC_INST (PROC_INST_ID_),
   INDEX ACT_IDX_HI_PROCVAR_NAME_TYPE (NAME_, VAR_TYPE_),
   INDEX ACT_IDX_HI_PROCVAR_TASK_ID (TASK_ID_)
);

CREATE TABLE act_id_info (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   USER_ID_ varchar(64) DEFAULT NULL,
   TYPE_ varchar(64) DEFAULT NULL,
   KEY_ varchar(255) DEFAULT NULL,
   VALUE_ varchar(255) DEFAULT NULL,
   PASSWORD_ VARBINARY(MAX),
   PARENT_ID_ varchar(255) DEFAULT NULL,
   PRIMARY KEY (ID_)
);

CREATE TABLE act_id_group (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   TYPE_ varchar(255) DEFAULT NULL,
   PRIMARY KEY (ID_)
);

CREATE TABLE act_id_user (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   FIRST_ varchar(255) DEFAULT NULL,
   LAST_ varchar(255) DEFAULT NULL,
   EMAIL_ varchar(255) DEFAULT NULL,
   PWD_ varchar(255) DEFAULT NULL,
   PICTURE_ID_ varchar(64) DEFAULT NULL,
   PRIMARY KEY (ID_)
);

CREATE TABLE act_id_membership (
   USER_ID_ varchar(64) NOT NULL,
   GROUP_ID_ varchar(64) NOT NULL,
   PRIMARY KEY (USER_ID_, GROUP_ID_),
   FOREIGN KEY (GROUP_ID_) REFERENCES act_id_group (ID_),
   FOREIGN KEY (USER_ID_) REFERENCES act_id_user (ID_)
);

CREATE TABLE act_re_procdef (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   CATEGORY_ varchar(255) DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   KEY_ varchar(255) NOT NULL,
   VERSION_ int NOT NULL,
   DEPLOYMENT_ID_ varchar(64) DEFAULT NULL,
   RESOURCE_NAME_ varchar(4000) DEFAULT NULL,
   DGRM_RESOURCE_NAME_ varchar(4000) DEFAULT NULL,
   DESCRIPTION_ varchar(4000) DEFAULT NULL,
   HAS_START_FORM_KEY_ bit DEFAULT NULL,
   HAS_GRAPHICAL_NOTATION_ bit DEFAULT NULL,
   SUSPENSION_STATE_ int DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   ENGINE_VERSION_ varchar(255) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_UNIQ_PROCDEF UNIQUE (KEY_, VERSION_, TENANT_ID_)
);

CREATE TABLE act_procdef_info (
   ID_ varchar(64) NOT NULL,
   PROC_DEF_ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   INFO_JSON_ID_ varchar(64) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_UNIQ_INFO_PROCDEF UNIQUE (PROC_DEF_ID_),
   INDEX ACT_IDX_INFO_PROCDEF (PROC_DEF_ID_),
   INDEX ACT_FK_INFO_JSON_BA (INFO_JSON_ID_),
   CONSTRAINT ACT_FK_INFO_JSON_BA FOREIGN KEY (INFO_JSON_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_INFO_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_re_model (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   KEY_ varchar(255) DEFAULT NULL,
   CATEGORY_ varchar(255) DEFAULT NULL,
   CREATE_TIME_ datetime2(3) NULL DEFAULT NULL,
   LAST_UPDATE_TIME_ datetime2(3) NULL DEFAULT NULL,
   VERSION_ int DEFAULT NULL,
   META_INFO_ varchar(4000) DEFAULT NULL,
   DEPLOYMENT_ID_ varchar(64) DEFAULT NULL,
   EDITOR_SOURCE_VALUE_ID_ varchar(64) DEFAULT NULL,
   EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_MODEL_DEPLOYMENT FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES act_re_deployment (ID_),
   CONSTRAINT ACT_FK_MODEL_SOURCE FOREIGN KEY (EDITOR_SOURCE_VALUE_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_MODEL_SOURCE_EXTRA FOREIGN KEY (EDITOR_SOURCE_EXTRA_VALUE_ID_) REFERENCES act_ge_bytearray (ID_)
);

CREATE TABLE act_ru_execution (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   BUSINESS_KEY_ varchar(255) DEFAULT NULL,
   PARENT_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   SUPER_EXEC_ varchar(64) DEFAULT NULL,
   ACT_ID_ varchar(255) DEFAULT NULL,
   IS_ACTIVE_ bit DEFAULT NULL,
   IS_CONCURRENT_ bit DEFAULT NULL,
   IS_SCOPE_ bit DEFAULT NULL,
   IS_EVENT_SCOPE_ bit DEFAULT NULL,
   SUSPENSION_STATE_ int DEFAULT NULL,
   CACHED_ENT_STATE_ int DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   NAME_ varchar(255) DEFAULT NULL,
   LOCK_TIME_ datetime2(3) NULL DEFAULT NULL,
   ROOT_PROC_INST_ID_ varchar(64) DEFAULT NULL,
   IS_MI_ROOT_ bit DEFAULT NULL,
   START_TIME_ datetime2(3) DEFAULT NULL,
   START_USER_ID_ varchar(255) DEFAULT NULL,
   IS_COUNT_ENABLED_ bit DEFAULT NULL,
   EVT_SUBSCR_COUNT_ int DEFAULT NULL,
   TASK_COUNT_ int DEFAULT NULL,
   JOB_COUNT_ int DEFAULT NULL,
   TIMER_JOB_COUNT_ int DEFAULT NULL,
   SUSP_JOB_COUNT_ int DEFAULT NULL,
   DEADLETTER_JOB_COUNT_ int DEFAULT NULL,
   VAR_COUNT_ int DEFAULT NULL,
   ID_LINK_COUNT_ int DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_EXE_PARENT FOREIGN KEY (PARENT_ID_) REFERENCES act_ru_execution (ID_) ON DELETE NO ACTION,
   CONSTRAINT ACT_FK_EXE_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_EXE_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_) ON DELETE NO ACTION,
   CONSTRAINT ACT_FK_EXE_SUPER FOREIGN KEY (SUPER_EXEC_) REFERENCES act_ru_execution (ID_) ON DELETE NO ACTION
);

CREATE TABLE act_ru_deadletter_job (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   TYPE_ varchar(255) NOT NULL,
   EXCLUSIVE_ bit DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROCESS_INSTANCE_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   EXCEPTION_STACK_ID_ varchar(64) DEFAULT NULL,
   EXCEPTION_MSG_ varchar(4000) DEFAULT NULL,
   DUEDATE_ datetime2(3) NULL DEFAULT NULL,
   REPEAT_ varchar(255) DEFAULT NULL,
   HANDLER_TYPE_ varchar(255) DEFAULT NULL,
   HANDLER_CFG_ varchar(4000) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_DEADLETTER_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_DEADLETTER_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_DEADLETTER_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_)
);

CREATE TABLE act_ru_event_subscr (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   EVENT_TYPE_ varchar(255) NOT NULL,
   EVENT_NAME_ varchar(255) DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   ACTIVITY_ID_ varchar(64) DEFAULT NULL,
   CONFIGURATION_ varchar(255) DEFAULT NULL,
   CREATED_ datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_EVENT_EXEC FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_)
);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_CONFIG_ ON act_ru_event_subscr (CONFIGURATION_);

CREATE TABLE act_ru_task (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   NAME_ varchar(255) DEFAULT NULL,
   PARENT_TASK_ID_ varchar(64) DEFAULT NULL,
   DESCRIPTION_ varchar(4000) DEFAULT NULL,
   TASK_DEF_KEY_ varchar(255) DEFAULT NULL,
   OWNER_ varchar(255) DEFAULT NULL,
   ASSIGNEE_ varchar(255) DEFAULT NULL,
   DELEGATION_ varchar(64) DEFAULT NULL,
   PRIORITY_ int DEFAULT NULL,
   CREATE_TIME_ datetime2(3) DEFAULT NULL,
   DUE_DATE_ datetime2(3) DEFAULT NULL,
   CATEGORY_ varchar(255) DEFAULT NULL,
   SUSPENSION_STATE_ int DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   FORM_KEY_ varchar(255) DEFAULT NULL,
   CLAIM_TIME_ datetime2(3) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_TASK_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TASK_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_TASK_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_)
);
CREATE INDEX ACT_IDX_TASK_CREATE ON act_ru_task (CREATE_TIME_);

CREATE TABLE act_ru_identitylink (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   GROUP_ID_ varchar(255) DEFAULT NULL,
   TYPE_ varchar(255) DEFAULT NULL,
   USER_ID_ varchar(255) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_ATHRZ_PROCEDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_IDL_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TSKASS_TASK FOREIGN KEY (TASK_ID_) REFERENCES act_ru_task (ID_)
);
CREATE INDEX ACT_IDX_IDENT_LNK_USER ON act_ru_identitylink (USER_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_GROUP ON act_ru_identitylink (GROUP_ID_);

CREATE TABLE act_ru_job (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   TYPE_ varchar(255) NOT NULL,
   LOCK_EXP_TIME_ datetime2(3) DEFAULT NULL,
   LOCK_OWNER_ varchar(255) DEFAULT NULL,
   EXCLUSIVE_ tinyint DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROCESS_INSTANCE_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   RETRIES_ int DEFAULT NULL,
   EXCEPTION_STACK_ID_ varchar(64) DEFAULT NULL,
   EXCEPTION_MSG_ varchar(4000) DEFAULT NULL,
   DUEDATE_ datetime2(3) DEFAULT NULL,
   REPEAT_ varchar(255) DEFAULT NULL,
   HANDLER_TYPE_ varchar(255) DEFAULT NULL,
   HANDLER_CFG_ varchar(4000) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_JOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_suspended_job (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   TYPE_ varchar(255) NOT NULL,
   EXCLUSIVE_ tinyint DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROCESS_INSTANCE_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   RETRIES_ int DEFAULT NULL,
   EXCEPTION_STACK_ID_ varchar(64) DEFAULT NULL,
   EXCEPTION_MSG_ varchar(4000) DEFAULT NULL,
   DUEDATE_ datetime2(3) DEFAULT NULL,
   REPEAT_ varchar(255) DEFAULT NULL,
   HANDLER_TYPE_ varchar(255) DEFAULT NULL,
   HANDLER_CFG_ varchar(4000) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_SUSPENDED_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_SUSPENDED_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_SUSPENDED_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_timer_job (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   TYPE_ varchar(255) NOT NULL,
   LOCK_EXP_TIME_ datetime2(3) NULL DEFAULT NULL,
   LOCK_OWNER_ varchar(255) DEFAULT NULL,
   EXCLUSIVE_ tinyint DEFAULT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROCESS_INSTANCE_ID_ varchar(64) DEFAULT NULL,
   PROC_DEF_ID_ varchar(64) DEFAULT NULL,
   RETRIES_ int DEFAULT NULL,
   EXCEPTION_STACK_ID_ varchar(64) DEFAULT NULL,
   EXCEPTION_MSG_ varchar(4000) DEFAULT NULL,
   DUEDATE_ datetime2(3) NULL DEFAULT NULL,
   REPEAT_ varchar(255) DEFAULT NULL,
   HANDLER_TYPE_ varchar(255) DEFAULT NULL,
   HANDLER_CFG_ varchar(4000) DEFAULT NULL,
   TENANT_ID_ varchar(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_TIMER_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_TIMER_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TIMER_JOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TIMER_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_variable (
   ID_ varchar(64) NOT NULL,
   REV_ int DEFAULT NULL,
   TYPE_ varchar(255) NOT NULL,
   NAME_ varchar(255) NOT NULL,
   EXECUTION_ID_ varchar(64) DEFAULT NULL,
   PROC_INST_ID_ varchar(64) DEFAULT NULL,
   TASK_ID_ varchar(64) DEFAULT NULL,
   BYTEARRAY_ID_ varchar(64) DEFAULT NULL,
   DOUBLE_ float DEFAULT NULL,
   LONG_ bigint DEFAULT NULL,
   TEXT_ varchar(4000) DEFAULT NULL,
   TEXT2_ varchar(4000) DEFAULT NULL,
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_VAR_BYTEARRAY FOREIGN KEY (BYTEARRAY_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_VAR_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_VAR_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_)
);

/**流程表**/
CREATE TABLE sys_workflow(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	simpleName varchar(256),
	objectType varchar(100),
  	remark varchar(1024),
	scope varchar(200),
  	nameRul VARCHAR(MAX) NULL,
  	codeRule varchar(2048),
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

/**流程实例表**/
CREATE TABLE wf_instance(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	objectType varchar(100),
  	remark varchar(1024),
	modelId varchar(36),
  	status varchar(20),
  	orderNum Integer,
  	isSystem varchar(1),
  	isValid varchar(2),
  	isDefault varchar(2),
	graphView VARBINARY(MAX) NULL,
	tranExeCls VARCHAR(MAX) NULL,
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
ALTER TABLE wf_instance ADD step varchar(2);
ALTER TABLE wf_instance ADD title varchar(256);
ALTER TABLE wf_instance ADD deploymentId varchar(50);
ALTER TABLE wf_instance ADD tempStatus varchar(20);

/**流程节点表**/
CREATE TABLE wf_node(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	workflowId varchar(36),
	type varchar(36),
	property varchar(256),
	linkedStatusId varchar(36),
	workflowPageId varchar(36),
	emailRole VARCHAR(MAX) NULL,
	notifyRole varchar(512),
	isEmailFile varchar(2),
	tranType varchar(2),
	phaseRule VARCHAR(MAX),
	lagMode varchar(8),
	autoToId varchar(36),
	exeCls varchar(256),
	entityOpRul VARCHAR(MAX),
	isSynEntity varchar(1),
	canWrite varchar(2),
	canUpdateFile varchar(2),
	canUpdateRelate varchar(2),
	rejectRole varchar(512),
	remark varchar(1024),
    orderNum Integer,
  	isSystem varchar(1),
  	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
ALTER TABLE wf_node ADD canRollback varchar(2) NULL;

/**流程操作表**/
CREATE TABLE wf_transition(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	nodeId varchar(36),
	toNodeId varchar(36),
	workflowPageId varchar(36),
	deriveWorkflowType varchar(36),
	toDeriveNodeId varchar(36),
	conditions VARCHAR(MAX),
	type varchar(36),
	isOnlyOnce varchar(2),
	isSaveNodeUser varchar(2),
	SynCondition varchar(2),
	exeCls varchar(256),
	workflowId varchar(36),
	deriveWorkflowId varchar(36),
	isDelPageUser varchar(4096),
	hasSave varchar(2),
	pageTo varchar(2),
	isMulTask varchar(2),
	functionRight varchar(36),
	mapField VARCHAR(MAX),
	deriveMode varchar(2),
	emailRemindAgain varchar(2),
	remark varchar(1024),
  	orderNum Integer,
  	isSystem varchar(2),
  	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
ALTER TABLE wf_transition ADD isForking varchar(2) NULL;
ALTER TABLE wf_transition ADD isDefaultForking varchar(2) NULL;

/**流程操作与生命周期关联表**/
CREATE TABLE wf_lifecycleTransition_rlt (
	id varchar(36) NOT NULL,
	name varchar(256),
	type varchar(20),
	lcPhaseId varchar(36),
	toLcPhaseId varchar(36),
	lastLcPhaseId varchar(36),
	toWorkflowType varchar(36),
	toWorkflowId varchar(36),
	toNodeId varchar(36),
	derivePageId varchar(36),
	deriveTranId varchar(36),
	tempNodeId varchar(36),
	exeCls varchar(256),
	mapField VARCHAR(MAX),
	remark varchar(1024),
	orderNum Integer,
	isValid varchar(2),
	isMulTask varchar(2),
	operateRole varchar(36),
	deriveMode varchar(2),
	pageTo varchar(2) NULL,
	PRIMARY KEY(id)
);

/**流程操作与角色关联表**/
CREATE TABLE wf_authorizationRole_rlt (
	id varchar(36) NOT NULL,
	transitionId varchar(36),
	roleId varchar(36),
	conditions varchar(36),
	isValid varchar(2),
	PRIMARY KEY(id)
);

/**流程操作与操作关联表**/
CREATE TABLE wf_authorizationOperate_rlt (
	id varchar(36) NOT NULL,
	transitionId varchar(36),
	role varchar(36),
	operate varchar(36),
	isValid varchar(2),
	PRIMARY KEY(id)
);

/**流程决策关联表**/
CREATE TABLE wf_decisionCondition (
	id varchar(36) NOT NULL,
	transitionId varchar(36),
	nodeId varchar(36),
	conditionValue VARCHAR(MAX),
	isValid varchar(2),
	PRIMARY KEY(id)
);

/**流程角色表**/
CREATE TABLE wf_role (
	id varchar(36) NOT NULL,
	workflowType varchar(36),
	name varchar(256),
	val varchar(36),
	orderNum Integer,
    isSystem varchar(2),
    isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**流程角色与字段关联表**/
CREATE TABLE wf_RoleMatch_rlt(
	id varchar(36) NOT NULL,
	pageFieldId varchar(36) NULL,
	pageId varchar(36) NULL,
	roleId varchar(36) NULL,
	PRIMARY KEY(id)
);

/**流程与实体关联表**/
CREATE TABLE wf_workflowEntity_rlt(
	id varchar(36) NOT NULL,
	srcId varchar(36) NULL,
	srcType varchar(36) NULL,
	destId varchar(36) NULL,
	destType varchar(36) NULL,
	relateId varchar(36) NULL,
	type int NULL,
	remark VARCHAR(MAX) NULL,
	parentId varchar(36) NULL,
	isAutoCreateTsk varchar(1) NULL, 
	orderNum int null,
	srcName varchar(255) NULL,
	destName varchar(255) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_workflowEntity_00001 ON wf_workflowEntity_rlt(srcId ASC);
CREATE INDEX Idx_workflowEntity_00002 ON wf_workflowEntity_rlt(srcType ASC);
CREATE INDEX Idx_workflowEntity_00003 ON wf_workflowEntity_rlt(destId ASC);
CREATE INDEX Idx_workflowEntity_00004 ON wf_workflowEntity_rlt(destType ASC);
CREATE INDEX Idx_workflowEntity_00005 ON wf_workflowEntity_rlt(relateId ASC);
CREATE INDEX Idx_workflowEntity_00006 ON wf_workflowEntity_rlt(type ASC);
CREATE INDEX Idx_workflowEntity_00007 ON wf_workflowEntity_rlt(createdTime DESC);

/**流程与派生关联表**/
CREATE TABLE wf_workflowDerive_rlt(
	id varchar(36) NOT NULL,
	isTarget varchar(2) NULL,
	remark VARCHAR(MAX) NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);

/**流程代办表**/
CREATE TABLE wf_myReceive (
	id varchar(36) not NULL,
	type varchar(36) NULL,
	objectId varchar(36) NULL,
	name varchar(256) NULL,
	code varchar(36) NULL,
	userId varchar(36) NULL,
	agtUserId varchar(36) NULL,
	isNew varchar(2) NULL,
	productId varchar(36) NULL,
	projectId varchar(36) NULL,
	departmentId varchar(36) NULL,
	statusId varchar(36) NULL,
	light int NULL,
	hasOperateFun varchar(2) NULL, 
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_myReceive_00001 ON wf_myReceive(type ASC);
CREATE INDEX Idx_myReceive_00002 ON wf_myReceive(userId ASC);

/**流程评论表**/
CREATE TABLE wf_workflow_cmnt(
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

/**流程组合表**/
CREATE TABLE wf_workflowGroup(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	status varchar(2) NULL,
	remark varchar(2048) NULL,
	isValid varchar(2) NULL,
	orderNum int null,
	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**流程组合关联表**/
CREATE TABLE wf_workflowGroup_rlt(
	id varchar(36) NOT NULL,
	groupId varchar(36) null,
	instanceId varchar(36) null,
	workflowType varchar(100) null, 
	isValid varchar(2) NULL,
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);

/**流程缺陷主表**/
CREATE TABLE wf_bug(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	typeId varchar(36) NULL,
	probabilityId varchar(36) NULL,
	severityId varchar(36) NULL,
	levelId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	hopeFinishDate datetime, 
	planFinishDate datetime, 
	realFinishDate datetime, 
	presenterId varchar(36) NULL,
	presentDate datetime,
	locatorId varchar(36) NULL,
	locatDate datetime,
	solverId varchar(36) NULL,
	solveDate datetime,
	verifierId varchar(36) NULL,
	verifyDate datetime,
	closeDate datetime,
	age float(53) NULL,
	isDemo varchar(36) NULL,
	moduleId varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	causeAnalysis varchar(2048) NULL,
	regressionRemark varchar(2048) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	reOpenTimes int,
	testAuditorId varchar(1024) NULL,
	developAuditorId varchar(1024) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerIds varchar(2048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bug_00001 ON wf_bug (code ASC); 
CREATE INDEX Idx_bug_00002 ON wf_bug (typeId ASC); 
CREATE INDEX Idx_bug_00003 ON wf_bug (levelId ASC); 
CREATE INDEX Idx_bug_00004 ON wf_bug (statusId ASC);
CREATE INDEX Idx_bug_00005 ON wf_bug (probabilityId ASC);
CREATE INDEX Idx_bug_00007 ON wf_bug (modifyTime DESC);
CREATE INDEX Idx_bug_00008 ON wf_bug (name ASC);
CREATE INDEX Idx_bug_00009 ON wf_bug (projectId ASC);
CREATE INDEX Idx_bug_00010 ON wf_bug (creatorId ASC);

/**流程缺陷扩展表**/
CREATE TABLE wf_bug_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bugExt_00001 ON wf_bug_Ext(objectId ASC);

/**流程缺陷角色用户关联表**/
CREATE TABLE wf_bugRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bugRoleUserRlt_00001 ON wf_bugRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_bugRoleUserRlt_00002 ON wf_bugRoleUser_rlt(userId ASC);

/**流程缺陷角色用户关联历史表**/
CREATE TABLE wf_bugRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bugRoleUserHis_00001 ON wf_bugRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_bugRoleUserHis_00002 ON wf_bugRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_bugRoleUserHis_00003 ON wf_bugRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_bugRoleUserHis_00004 ON wf_bugRoleUserHis_rlt(roleId ASC);

/**缺陷流程操作记录关联表**/
CREATE TABLE wf_bug_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bugOpRec_00001 ON wf_bug_opRec(objectId ASC);

/**缺陷流程操作历史关联表**/
CREATE TABLE wf_bug_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_bugOpHis_00001 ON wf_bug_OpHis(objectId ASC);

CREATE TABLE wf_chg(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	typeId varchar(36) NULL,
	levelId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	reason varchar(2048) NULL,
	effectAna varchar(2048) NULL,
	costEffectAna varchar(2048) NULL,
	scheEffectAna varchar(2048) NULL,
	changePlan varchar(2048) NULL,
	presenterId varchar(36) NULL,
	presentDate datetime NULL,
	projectMngId varchar(36) NULL,
	cbbControlIds varchar(1024) NULL,
	isEffectBasic varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(1048) NULL,
	ownerIds varchar(1048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chg_00001 ON wf_chg (code ASC); 
CREATE INDEX Idx_chg_00002 ON wf_chg (typeId ASC); 
CREATE INDEX Idx_chg_00003 ON wf_chg (levelId ASC); 
CREATE INDEX Idx_chg_00004 ON wf_chg (statusId ASC);
CREATE INDEX Idx_chg_00005 ON wf_chg (modifyTime DESC);
CREATE INDEX Idx_chg_00006 ON wf_chg (name ASC);
CREATE INDEX Idx_chg_00007 ON wf_chg (projectId ASC);
CREATE INDEX Idx_chg_00008 ON wf_chg (creatorId ASC);

CREATE TABLE wf_chg_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chgExt_00001 ON wf_chg_Ext(objectId ASC);

CREATE TABLE wf_chgRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chgRoleUserRlt_00001 ON wf_chgRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_chgRoleUserRlt_00002 ON wf_chgRoleUser_rlt(userId ASC);

CREATE TABLE wf_chgRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chgRoleUserHis_00001 ON wf_chgRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_chgRoleUserHis_00002 ON wf_chgRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_chgRoleUserHis_00003 ON wf_chgRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_chgRoleUserHis_00004 ON wf_chgRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_chg_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chgOpRec_00001 ON wf_chg_opRec(objectId ASC);

CREATE TABLE wf_chg_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_chgOpHis_00001 ON wf_chg_OpHis(objectId ASC);

CREATE TABLE wf_chg_milestone (
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	projectId varchar(36) NULL,
	planId varchar(36) NULL,
	isShowPhase varchar(2) NULL, 
	mileInfo VARCHAR(MAX) NULL,
	PRIMARY KEY(id)
);

CREATE TABLE wf_isu(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	typeId varchar(36) NULL,
	severityId varchar(36) NULL,
	levelId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	solution varchar(2048) NULL,
	questionRemark varchar(2048) NULL,
	hopeFinishDate datetime, 
	planFinishDate datetime, 
	realFinishDate datetime, 
	presenterId varchar(36) NULL,
	presentDate datetime,
	isDemo varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	ownerIds varchar(2048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isu_00001 ON wf_isu (code ASC); 
CREATE INDEX Idx_isu_00002 ON wf_isu (typeId ASC); 
CREATE INDEX Idx_isu_00003 ON wf_isu (levelId ASC); 
CREATE INDEX Idx_isu_00004 ON wf_isu (statusId ASC);
CREATE INDEX Idx_isu_00005 ON wf_isu (severityId ASC);
CREATE INDEX Idx_isu_00007 ON wf_isu (modifyTime DESC);
CREATE INDEX Idx_isu_00008 ON wf_isu (name ASC);
CREATE INDEX Idx_isu_00009 ON wf_isu (projectId ASC);
CREATE INDEX Idx_isu_00010 ON wf_isu (creatorId ASC);

CREATE TABLE wf_isu_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isuExt_00001 ON wf_isu_Ext(objectId ASC);

CREATE TABLE wf_isuRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isuRoleUserRlt_00001 ON wf_isuRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_isuRoleUserRlt_00002 ON wf_isuRoleUser_rlt(userId ASC);

CREATE TABLE wf_isuRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isuRoleUserHis_00001 ON wf_isuRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_isuRoleUserHis_00002 ON wf_isuRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_isuRoleUserHis_00003 ON wf_isuRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_isuRoleUserHis_00004 ON wf_isuRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_isu_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isuOpRec_00001 ON wf_isu_opRec(objectId ASC);

CREATE TABLE wf_isu_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_isuOpHis_00001 ON wf_isu_OpHis(objectId ASC);

CREATE TABLE wf_mrq(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	presenterId varchar(36) NULL,
	presentDate datetime,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	reviewerId varchar(36) NULL,
	reviewRemark varchar(2048) NULL,
	trackRemark varchar(2048) NULL,
	projectMngId varchar(36) NULL,
	reqAnalystId varchar(36) NULL,
	analysisReq varchar(2048) NULL,
	hopeImplDate datetime,
	planImplDate datetime,
	realImplDate datetime,
	acceptId varchar(36) NULL,
	acceptRemark varchar(1048) NULL,
	mrqSourceId varchar(36) NULL,
	secLevId varchar(36) NULL,
	gradeId varchar(36) NULL,
	stabilityId varchar(36) NULL,
	levelId varchar(36) NULL,
	typeId varchar(36) NULL,
	companyName varchar(128) NULL,
	customerName varchar(64) NULL,
	customerPosition varchar(64) NULL,
	telephone varchar(30) NULL,
	promiseRemark varchar(1048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	ownerIds varchar(2048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrq_00001 ON wf_mrq (code ASC); 
CREATE INDEX Idx_mrq_00002 ON wf_mrq (typeId ASC); 
CREATE INDEX Idx_mrq_00003 ON wf_mrq (statusId ASC);
CREATE INDEX Idx_mrq_00004 ON wf_mrq (mrqSourceId ASC);
CREATE INDEX Idx_mrq_00005 ON wf_mrq (secLevId ASC);
CREATE INDEX Idx_mrq_00006 ON wf_mrq (gradeId ASC);
CREATE INDEX Idx_mrq_00007 ON wf_mrq (stabilityId ASC);
CREATE INDEX Idx_mrq_00008 ON wf_mrq (levelId ASC);
CREATE INDEX Idx_mrq_00009 ON wf_mrq (modifyTime DESC);
CREATE INDEX Idx_mrq_00010 ON wf_mrq (name ASC);
CREATE INDEX Idx_mrq_00011 ON wf_mrq (projectId ASC);
CREATE INDEX Idx_mrq_00012 ON wf_mrq (creatorId ASC);

CREATE TABLE wf_mrq_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqExt_00001 ON wf_mrq_Ext(objectId ASC);

CREATE TABLE wf_mrqRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqRoleUserRlt_00001 ON wf_mrqRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_mrqRoleUserRlt_00002 ON wf_mrqRoleUser_rlt(userId ASC);

CREATE TABLE wf_mrqRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqRoleUserHis_00001 ON wf_mrqRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00002 ON wf_mrqRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00003 ON wf_mrqRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00004 ON wf_mrqRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_mrq_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqOpRec_00001 ON wf_mrq_opRec(objectId ASC);

CREATE TABLE wf_mrq_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqOpHis_00001 ON wf_mrq_OpHis(objectId ASC);

CREATE TABLE wf_pmc(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	projectMngId varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(1048) NULL,
	ownerIds varchar(1048) NULL,
	highMngId varchar(1048) NULL,
	pjtData VARCHAR(MAX),
	pjtSummary VARCHAR(MAX),
	lessonLearned VARCHAR(MAX),
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmc_00001 ON wf_pmc (code ASC); 
CREATE INDEX Idx_pmc_00002 ON wf_pmc (statusId ASC);
CREATE INDEX Idx_pmc_00003 ON wf_pmc (modifyTime DESC);
CREATE INDEX Idx_pmc_00004 ON wf_pmc (name ASC);
CREATE INDEX Idx_pmc_00005 ON wf_pmc (projectId ASC);
CREATE INDEX Idx_pmc_00006 ON wf_pmc (creatorId ASC);

CREATE TABLE wf_pmc_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcExt_00001 ON wf_pmc_Ext(objectId ASC);

CREATE TABLE wf_pmcRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcRoleUserRlt_00001 ON wf_pmcRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_pmcRoleUserRlt_00002 ON wf_pmcRoleUser_rlt(userId ASC);

CREATE TABLE wf_pmcRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcRoleUserHis_00001 ON wf_pmcRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00002 ON wf_pmcRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00003 ON wf_pmcRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00004 ON wf_pmcRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_pmc_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcOpRec_00001 ON wf_pmc_opRec(objectId ASC);

CREATE TABLE wf_pmc_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcOpHis_00001 ON wf_pmc_OpHis(objectId ASC);

CREATE TABLE wf_pmi(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	typeId varchar(36) NULL,
	levelId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	projectMngId varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(1048) NULL,
	ownerIds varchar(1048) NULL,
	customerName varchar(256) NULL,
	pjtBudget float,
	busAnalyzer varchar(1048) NULL, 
	highMngId varchar(1048) NULL, 
	pjtBackground VARCHAR(MAX), 
	pjtTarget VARCHAR(MAX), 
	pjtScope VARCHAR(MAX), 
	techAnalysis VARCHAR(MAX), 
	busAnalysis VARCHAR(MAX), 
	riskAnalysis VARCHAR(MAX), 
	planIds varchar(1048) NULL, 
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmi_00001 ON wf_pmi (code ASC); 
CREATE INDEX Idx_pmi_00002 ON wf_pmi (typeId ASC); 
CREATE INDEX Idx_pmi_00003 ON wf_pmi (levelId ASC); 
CREATE INDEX Idx_pmi_00004 ON wf_pmi (statusId ASC);
CREATE INDEX Idx_pmi_00005 ON wf_pmi (modifyTime DESC);
CREATE INDEX Idx_pmi_00006 ON wf_pmi (name ASC);
CREATE INDEX Idx_pmi_00007 ON wf_pmi (projectId ASC);
CREATE INDEX Idx_pmi_00008 ON wf_pmi (creatorId ASC);

CREATE TABLE wf_pmi_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiExt_00001 ON wf_pmi_Ext(objectId ASC);

CREATE TABLE wf_pmiRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiRoleUserRlt_00001 ON wf_pmiRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_pmiRoleUserRlt_00002 ON wf_pmiRoleUser_rlt(userId ASC);

CREATE TABLE wf_pmiRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiRoleUserHis_00001 ON wf_pmiRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00002 ON wf_pmiRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00003 ON wf_pmiRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00004 ON wf_pmiRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_pmi_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiOpRec_00001 ON wf_pmi_opRec(objectId ASC);

CREATE TABLE wf_pmi_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiOpHis_00001 ON wf_pmi_OpHis(objectId ASC);

CREATE TABLE wf_pmi_milestone (
	id varchar(36) NOT null,
	name varchar(256) null,
	objectId varchar(36) null,
	mileId varchar(36) null,
	phaseId varchar(36) null,
	isShowPhase varchar(2) null,
	status varchar(36) null,
	planEndDate datetime null, 
	realEndDate datetime null,
	isValid varchar(2) null,
	orderNum Integer,
	remark varchar(2048) null,
	canDelete varchar(2) null,
	PRIMARY KEY(id)
);

CREATE TABLE wf_pmi_roleMember (
	id varchar(36) NOT null,
	objectId varchar(36) null,
	roleId varchar(36) null,
	userIds varchar(2048) null,
	isValid varchar(2) null,
	PRIMARY KEY(id)
);

CREATE TABLE wf_rew(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	pointId varchar(36) NULL,
	presenterId varchar(36) NULL,
	planRewDate datetime,
	realRewDate datetime,
	preRequest varchar(2048) NULL,
	formalRequest varchar(2048) NULL,
	rewResultId varchar(36) NULL,
	rewDocScoreId varchar(36) NULL,
	rewProcScoreId varchar(36) NULL,
	rewRemark varchar(2048) NULL,
	address varchar(500) NULL,
	rewTimes int,
	projectMngId varchar(36) NULL,
	functionMngId varchar(36) NULL,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(1024) NULL,
	ownerIds varchar(2048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rew_00001 ON wf_rew (name ASC);
CREATE INDEX Idx_rew_00002 ON wf_rew (code ASC); 
CREATE INDEX Idx_rew_00003 ON wf_rew (statusId ASC);
CREATE INDEX Idx_rew_00004 ON wf_rew (projectId ASC);
CREATE INDEX Idx_rew_00005 ON wf_rew (creatorId ASC);
CREATE INDEX Idx_rew_00006 ON wf_rew (modifyTime DESC);
CREATE INDEX Idx_rew_00007 ON wf_rew (pointId ASC); 
CREATE INDEX Idx_rew_00008 ON wf_rew (rewResultId ASC);
CREATE INDEX Idx_rew_00009 ON wf_rew (presenterId ASC);
CREATE INDEX Idx_rew_00010 ON wf_rew (ownerId ASC);

CREATE TABLE wf_rew_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewExt_00001 ON wf_rew_Ext(objectId ASC);

CREATE TABLE wf_rewRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewRoleUserRlt_00001 ON wf_rewRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_rewRoleUserRlt_00002 ON wf_rewRoleUser_rlt(userId ASC);

CREATE TABLE wf_rewRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewRoleUserHis_00001 ON wf_rewRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_rewRoleUserHis_00002 ON wf_rewRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_rewRoleUserHis_00003 ON wf_rewRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_rewRoleUserHis_00004 ON wf_rewRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_rew_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewOpRec_00001 ON wf_rew_opRec(objectId ASC);

CREATE TABLE wf_rew_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewOpHis_00001 ON wf_rew_OpHis(objectId ASC);

CREATE TABLE wf_rew_element(
	id varchar(36) NOT NULL,
	name varchar(2048) NULL,
	pointId varchar(36) NULL,
	categoryId varchar(36) NULL,
	importanceId varchar(36) NULL,
	remark varchar(2048) NULL,
	orderNum Integer,
	status varchar(2) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewElement_00001 ON wf_rew_element(pointId ASC);
CREATE INDEX Idx_rewElement_00002 ON wf_rew_element(categoryId ASC);
CREATE INDEX Idx_rewElement_00003 ON wf_rew_element(status ASC);

CREATE TABLE wf_rew_importance(
	id varchar(36) NOT NULL,
	name varchar(521) NULL,
	remark varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE wf_rew_checkResult(
	id varchar(36) NOT NULL,
	name varchar(521) NULL,
	remark varchar(2048) NULL,
	orderNum Integer,
	status varchar(2) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE wf_rew_point(
	id varchar(36) NOT NULL,
	name varchar(521) NULL,
	pjtRole varchar(521) NULL,
	remark varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	isShowCategory varchar(2) NULL,
	status varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE wf_rew_category(
	id varchar(36) NOT NULL,
	name varchar(2048) NULL,
	pjtRole varchar(521) NULL,
	remark varchar(2048) NULL,
	pointId varchar(36) NULL,
	orderNum Integer,
	status varchar(2) NULL,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);

CREATE TABLE wf_rew_elementResultRlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	pointId varchar(36) NULL,
	elementId varchar(36) NULL,
	resultId varchar(36) NULL,
	detail varchar(2048) NULL,
	orderNum Integer,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_elementResultRlt_00001 ON wf_rew_elementResultRlt(objectId ASC);
CREATE INDEX Idx_elementResultRlt_00002 ON wf_rew_elementResultRlt(pointId ASC);
CREATE INDEX Idx_elementResultRlt_00003 ON wf_rew_elementResultRlt(elementId ASC);
CREATE INDEX Idx_elementResultRlt_00004 ON wf_rew_elementResultRlt(resultId ASC);
CREATE INDEX Idx_elementResultRlt_00005 ON wf_rew_elementResultRlt(creatorId ASC);
CREATE INDEX Idx_elementResultRlt_00006 ON wf_rew_elementResultRlt(modifyTime DESC);

CREATE TABLE wf_rsk(
	id varchar(36) NOT NULL,
	code varchar(36) NULL,
	name varchar(256) NULL,
	projectId varchar(36) NULL,
	productId varchar(36) NULL,
	departmentId varchar(36) NULL,
	typeId varchar(36) NULL,
	probabilityId varchar(36) NULL,
	effectId varchar(36) NULL,
	gradeId varchar(36) NULL,
	isDemo varchar(36) NULL,
	statusId varchar(36) NULL,
	remark varchar(2048) NULL,
	hopeFinishDate datetime, 
	planFinishDate datetime, 
	realFinishDate datetime, 
	presenterId varchar(36) NULL,
	presentDate datetime,
	entityStatusId varchar(36) NULL,
	signOpinionId varchar(36) NULL,
	signRemark varchar(2048) NULL,
	auditorId varchar(1024) NULL,
	auditDate datetime,
	auditRemark varchar(2048) NULL,
	effectRemark varchar(1024) NULL,
	respondPlan varchar(1024) NULL,
	riskAnalysis varchar(1024) NULL,
	acceptReason varchar(1024) NULL,
	riskRemark varchar(1024) NULL,
	trackRemark varchar(1024) NULL,
	lampSign int,
	ownerId varchar(36) NULL,
	actorId varchar(2048) NULL,
	ownerIds varchar(2048) NULL,
	nodeEnterTime datetime,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rsk_00001 ON wf_rsk (code ASC); 
CREATE INDEX Idx_rsk_00002 ON wf_rsk (typeId ASC); 
CREATE INDEX Idx_rsk_00003 ON wf_rsk (probabilityId ASC); 
CREATE INDEX Idx_rsk_00004 ON wf_rsk (statusId ASC);
CREATE INDEX Idx_rsk_00005 ON wf_rsk (effectId ASC);
CREATE INDEX Idx_rsk_00006 ON wf_rsk (gradeId ASC);
CREATE INDEX Idx_rsk_00007 ON wf_rsk (isDemo ASC);
CREATE INDEX Idx_rsk_00008 ON wf_rsk (modifyTime DESC);
CREATE INDEX Idx_rsk_00009 ON wf_rsk (name ASC);
CREATE INDEX Idx_rsk_00010 ON wf_rsk (projectId ASC);
CREATE INDEX Idx_rsk_00011 ON wf_rsk (creatorId ASC);

CREATE TABLE wf_rsk_Ext(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskExt_00001 ON wf_rsk_Ext(objectId ASC);

CREATE TABLE wf_rskRoleUser_rlt(
	id varchar(36) NOT NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	isGlobalRole varchar(2) NULL,
	fieldName varchar(36) NULL,
	isNew varchar(2) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskRoleUserRlt_00001 ON wf_rskRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_rskRoleUserRlt_00002 ON wf_rskRoleUser_rlt(userId ASC);

CREATE TABLE wf_rskRoleUserHis_rlt(
	id varchar(36) NOT NULL,
	nodeId varchar(36) NULL,
	objectId varchar(36) NULL,
	userId varchar(36) NULL,
	roleId varchar(36) NULL,
	fieldName varchar(36) NULL,
	isValid varchar(2) NULL,
	agtUserId varchar(36) NULL, 
	creatorId varchar(36) NULL,
	createdTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskRoleUserHis_00001 ON wf_rskRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_rskRoleUserHis_00002 ON wf_rskRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_rskRoleUserHis_00003 ON wf_rskRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_rskRoleUserHis_00004 ON wf_rskRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_rsk_opRec (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	nodeId varchar(36) NULL,
	transitionId varchar(36) NULL,
	remark VARCHAR(MAX) NULL,
	isValid varchar(2),
    creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskOpRec_00001 ON wf_rsk_opRec(objectId ASC);

CREATE TABLE wf_rsk_OpHis (
	id varchar(36) NOT NULL,
	name varchar(512) NULL,
	projectId varchar(36) NULL, 
	objectId varchar(36) NULL,
	transitionId varchar(36) NULL,
	fromValue varchar(36) NULL,
	toValue varchar(36) NULL,
	type varchar(36) NULL,
	remark varchar(2048) NULL,
	recView VARCHAR(MAX) NULL,
	isValid varchar(2),
  	creatorId varchar(36), 
	createdTime datetime, 
	modifyId varchar(36),
	modifyTime datetime,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskOpHis_00001 ON wf_rsk_OpHis(objectId ASC);

CREATE TABLE wf_rskLibrary(
	id varchar(36) NOT NULL,
	name varchar(256) NULL,
	typeId varchar(36) NULL,
	probabilityId varchar(36) NULL,
	effectId varchar(36) NULL,
	gradeId varchar(36) NULL,
	remark varchar(2048) NULL,
	effectRemark varchar(1024) NULL,
	respondPlan varchar(1024) NULL,
	riskAnalysis varchar(1024) NULL,
	riskRemark varchar(1024) NULL,
	status varchar(36) NULL,
	useTimes int,
	isValid varchar(2) NULL,
	creatorId varchar(36) NULL,
	createdTime datetime,
	modifyId varchar(36) NULL,
	modifyTime datetime,
	PRIMARY KEY(id)
);