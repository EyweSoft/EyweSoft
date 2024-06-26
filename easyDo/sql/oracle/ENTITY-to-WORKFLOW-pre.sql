CREATE TABLE act_evt_log (
    LOG_NR_ NUMBER(20) PRIMARY KEY,
    TYPE_ VARCHAR2(64),
    PROC_DEF_ID_ VARCHAR2(64),
    PROC_INST_ID_ VARCHAR2(64),
    EXECUTION_ID_ VARCHAR2(64),
    TASK_ID_ VARCHAR2(64),
    TIME_STAMP_ TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    USER_ID_ VARCHAR2(255),
    DATA_ CLOB,
    LOCK_OWNER_ VARCHAR2(255),
    LOCK_TIME_ TIMESTAMP(3),
    IS_PROCESSED_ NUMBER(1) DEFAULT 0
);

CREATE TABLE act_re_deployment (
    ID_ VARCHAR2(64) PRIMARY KEY,
    NAME_ VARCHAR2(255),
    CATEGORY_ VARCHAR2(255),
    TENANT_ID_ VARCHAR2(255) DEFAULT '',
    DEPLOY_TIME_ TIMESTAMP(3),
    ENGINE_VERSION_ VARCHAR2(255),
    KEY_ VARCHAR2(255)
);

CREATE TABLE act_ge_bytearray (
    ID_ VARCHAR2(64) PRIMARY KEY,
    REV_ NUMBER(11),
    NAME_ VARCHAR2(255),
    DEPLOYMENT_ID_ VARCHAR2(64),
    BYTES_ BLOB,
    GENERATED_ NUMBER(1),
    CONSTRAINT ACT_FK_BYTEARR_DEPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES act_re_deployment (ID_)
);

CREATE TABLE act_ge_property (
    NAME_ VARCHAR2(64) PRIMARY KEY,
    VALUE_ VARCHAR2(300),
    REV_ NUMBER(11)
);

CREATE TABLE act_hi_actinst (
    ID_ VARCHAR2(64) PRIMARY KEY,
    PROC_DEF_ID_ VARCHAR2(64) NOT NULL,
    PROC_INST_ID_ VARCHAR2(64) NOT NULL,
    EXECUTION_ID_ VARCHAR2(64) NOT NULL,
    ACT_ID_ VARCHAR2(255) NOT NULL,
    TASK_ID_ VARCHAR2(64),
    CALL_PROC_INST_ID_ VARCHAR2(64),
    ACT_NAME_ VARCHAR2(255),
    ACT_TYPE_ VARCHAR2(255) NOT NULL,
    ASSIGNEE_ VARCHAR2(255),
    START_TIME_ TIMESTAMP(3) NOT NULL,
    END_TIME_ TIMESTAMP(3),
    DURATION_ NUMBER(20),
    TENANT_ID_ VARCHAR2(255) DEFAULT '',
    DELETE_REASON_ VARCHAR2(4000)
);

CREATE TABLE act_hi_attachment (
    ID_ VARCHAR2(64) PRIMARY KEY,
    REV_ NUMBER(11),
    USER_ID_ VARCHAR2(255),
    NAME_ VARCHAR2(255),
    DESCRIPTION_ VARCHAR2(4000),
    TYPE_ VARCHAR2(255),
    TASK_ID_ VARCHAR2(64),
    PROC_INST_ID_ VARCHAR2(64),
    URL_ VARCHAR2(4000),
    CONTENT_ID_ VARCHAR2(64),
    TIME_ TIMESTAMP(3)
);

CREATE TABLE act_hi_comment (
    ID_ VARCHAR2(64) PRIMARY KEY,
    TYPE_ VARCHAR2(255),
    TIME_ TIMESTAMP(3) NOT NULL,
    USER_ID_ VARCHAR2(255),
    TASK_ID_ VARCHAR2(64),
    PROC_INST_ID_ VARCHAR2(64),
    ACTION_ VARCHAR2(255),
    MESSAGE_ VARCHAR2(4000),
    FULL_MSG_ CLOB
);

CREATE TABLE act_hi_detail (
    ID_ VARCHAR2(64) PRIMARY KEY,
    TYPE_ VARCHAR2(255) NOT NULL,
    PROC_INST_ID_ VARCHAR2(64),
    EXECUTION_ID_ VARCHAR2(64),
    TASK_ID_ VARCHAR2(64),
    ACT_INST_ID_ VARCHAR2(64),
    NAME_ VARCHAR2(255) NOT NULL,
    VAR_TYPE_ VARCHAR2(255),
    REV_ NUMBER(11),
    TIME_ TIMESTAMP(3) NOT NULL,
    BYTEARRAY_ID_ VARCHAR2(64),
    DOUBLE_ FLOAT,
    LONG_ NUMBER(20),
    TEXT_ VARCHAR2(4000),
    TEXT2_ VARCHAR2(4000)
);

CREATE TABLE act_hi_identitylink (
   ID_ VARCHAR2(64) PRIMARY KEY,
   GROUP_ID_ VARCHAR2(255),
   TYPE_ VARCHAR2(255),
   USER_ID_ VARCHAR2(255),
   TASK_ID_ VARCHAR2(64),
   PROC_INST_ID_ VARCHAR2(64)
);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER ON act_hi_identitylink (USER_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TASK ON act_hi_identitylink (TASK_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROCINST ON act_hi_identitylink (PROC_INST_ID_);

CREATE TABLE act_hi_procinst (
    ID_ VARCHAR2(64) PRIMARY KEY,
    PROC_INST_ID_ VARCHAR2(64) NOT NULL,
    BUSINESS_KEY_ VARCHAR2(255),
    PROC_DEF_ID_ VARCHAR2(64) NOT NULL,
    START_TIME_ TIMESTAMP(3) NOT NULL,
    END_TIME_ TIMESTAMP(3),
    DURATION_ NUMBER(20),
    START_USER_ID_ VARCHAR2(255),
    START_ACT_ID_ VARCHAR2(255),
    END_ACT_ID_ VARCHAR2(255),
    SUPER_PROCESS_INSTANCE_ID_ VARCHAR2(64),
    DELETE_REASON_ VARCHAR2(4000),
    TENANT_ID_ VARCHAR2(255) DEFAULT '',
    NAME_ VARCHAR2(255)
);
CREATE UNIQUE INDEX idx_proc_inst_id ON act_hi_procinst (PROC_INST_ID_);
CREATE INDEX idx_hi_pro_inst_end ON act_hi_procinst (END_TIME_);
CREATE INDEX idx_hi_pro_i_buskey ON act_hi_procinst (BUSINESS_KEY_);

CREATE TABLE act_hi_taskinst (
    ID_ VARCHAR2(64) PRIMARY KEY,
    PROC_DEF_ID_ VARCHAR2(64),
    TASK_DEF_KEY_ VARCHAR2(255),
    PROC_INST_ID_ VARCHAR2(64),
    EXECUTION_ID_ VARCHAR2(64),
    NAME_ VARCHAR2(255),
    PARENT_TASK_ID_ VARCHAR2(64),
    DESCRIPTION_ VARCHAR2(4000),
    OWNER_ VARCHAR2(255),
    ASSIGNEE_ VARCHAR2(255),
    START_TIME_ TIMESTAMP(3) NOT NULL,
    CLAIM_TIME_ TIMESTAMP(3),
    END_TIME_ TIMESTAMP(3),
    DURATION_ NUMBER(20),
    DELETE_REASON_ VARCHAR2(4000),
    PRIORITY_ NUMBER(11),
    DUE_DATE_ TIMESTAMP(3),
    FORM_KEY_ VARCHAR2(255),
    CATEGORY_ VARCHAR2(255),
    TENANT_ID_ VARCHAR2(255) DEFAULT ''
);
CREATE INDEX idx_hi_task_inst_procinst ON act_hi_taskinst (PROC_INST_ID_);

CREATE TABLE act_hi_varinst (
    ID_ VARCHAR2(64) PRIMARY KEY,
    PROC_INST_ID_ VARCHAR2(64),
    EXECUTION_ID_ VARCHAR2(64),
    TASK_ID_ VARCHAR2(64),
    NAME_ VARCHAR2(255) NOT NULL,
    VAR_TYPE_ VARCHAR2(100),
    REV_ NUMBER(11),
    BYTEARRAY_ID_ VARCHAR2(64),
    DOUBLE_ FLOAT,
    LONG_ NUMBER(20),
    TEXT_ VARCHAR2(4000),
    TEXT2_ VARCHAR2(4000),
    CREATE_TIME_ TIMESTAMP(3),
    LAST_UPDATED_TIME_ TIMESTAMP(3)
);
CREATE INDEX idx_hi_procvartask_id ON act_hi_varinst (TASK_ID_);
CREATE INDEX idx_hi_procvartask_name_type ON act_hi_varinst (NAME_, VAR_TYPE_);
CREATE INDEX idx_hi_procvartask_proc_inst ON act_hi_varinst (PROC_INST_ID_);

CREATE TABLE act_id_info (
    ID_ VARCHAR2(64) PRIMARY KEY,
    REV_ NUMBER,
    USER_ID_ VARCHAR2(64),
    TYPE_ VARCHAR2(64),
    KEY_ VARCHAR2(255),
    VALUE_ VARCHAR2(255),
    PASSWORD_ BLOB,
    PARENT_ID_ VARCHAR2(255)
);

CREATE TABLE act_id_group (
    ID_ VARCHAR2(64) PRIMARY KEY,
    REV_ NUMBER(11),
    NAME_ VARCHAR2(255),
    TYPE_ VARCHAR2(255)
);

CREATE TABLE act_id_user (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   FIRST_ VARCHAR2(255),
   LAST_ VARCHAR2(255),
   EMAIL_ VARCHAR2(255),
   PWD_ VARCHAR2(255),
   PICTURE_ID_ VARCHAR2(64)
);

CREATE TABLE act_id_membership (
   USER_ID_ VARCHAR2(64),
   GROUP_ID_ VARCHAR2(64),
   PRIMARY KEY (USER_ID_, GROUP_ID_),
   CONSTRAINT ACT_PK_MEMB_USER FOREIGN KEY (USER_ID_) REFERENCES act_id_user(ID_),
   CONSTRAINT ACT_PK_MEMB_GROUP FOREIGN KEY (GROUP_ID_) REFERENCES act_id_group(ID_)
);

CREATE TABLE act_re_procdef (
   ID_ VARCHAR2(64),
   REV_ NUMBER(11) DEFAULT NULL,
   CATEGORY_ VARCHAR2(255),
   NAME_ VARCHAR2(255),
   KEY_ VARCHAR2(255) NOT NULL,
   VERSION_ NUMBER(11) NOT NULL,
   DEPLOYMENT_ID_ VARCHAR2(64),
   RESOURCE_NAME_ VARCHAR2(4000),
   DGRM_RESOURCE_NAME_ VARCHAR2(4000),
   DESCRIPTION_ VARCHAR2(4000),
   HAS_START_FORM_KEY_ NUMBER(1) DEFAULT NULL,
   HAS_GRAPHICAL_NOTATION_ NUMBER(1) DEFAULT NULL,
   SUSPENSION_STATE_ NUMBER(11),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   ENGINE_VERSION_ VARCHAR2(255),
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_UNIQ_PROCDEF UNIQUE (KEY_, VERSION_, TENANT_ID_)
);

CREATE TABLE act_procdef_info (
   ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   REV_ NUMBER(11) DEFAULT NULL,
   INFO_JSON_ID_ VARCHAR2(64),
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_UNIQ_INFO_PROCDEF UNIQUE (PROC_DEF_ID_),
   CONSTRAINT ACT_FK_INFO_JSON_BA FOREIGN KEY (INFO_JSON_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_INFO_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_re_model (
   ID_ VARCHAR2(64),
   REV_ NUMBER(11) DEFAULT NULL,
   NAME_ VARCHAR2(255),
   KEY_ VARCHAR2(255),
   CATEGORY_ VARCHAR2(255),
   CREATE_TIME_ TIMESTAMP(3),
   LAST_UPDATE_TIME_ TIMESTAMP(3),
   VERSION_ NUMBER(11) DEFAULT NULL,
   META_INFO_ VARCHAR2(4000),
   DEPLOYMENT_ID_ VARCHAR2(64),
   EDITOR_SOURCE_VALUE_ID_ VARCHAR2(64),
   EDITOR_SOURCE_EXTRA_VALUE_ID_ VARCHAR2(64),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_MODEL_DEPLOYMENT FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES act_re_deployment (ID_),
   CONSTRAINT ACT_FK_MODEL_SOURCE FOREIGN KEY (EDITOR_SOURCE_VALUE_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_MODEL_SOURCE_EXTRA FOREIGN KEY (EDITOR_SOURCE_EXTRA_VALUE_ID_) REFERENCES act_ge_bytearray (ID_)
);

CREATE TABLE act_ru_execution (
   ID_ VARCHAR2(64),
   REV_ NUMBER(11),
   PROC_INST_ID_ VARCHAR2(64),
   BUSINESS_KEY_ VARCHAR2(255),
   PARENT_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   SUPER_EXEC_ VARCHAR2(64),
   ACT_ID_ VARCHAR2(255),
   IS_ACTIVE_ NUMBER(1),
   IS_CONCURRENT_ NUMBER(1),
   IS_SCOPE_ NUMBER(1),
   IS_EVENT_SCOPE_ NUMBER(1),
   SUSPENSION_STATE_ NUMBER(11),
   CACHED_ENT_STATE_ NUMBER(11),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   NAME_ VARCHAR2(255),
   LOCK_TIME_ TIMESTAMP(3) NULL,
   ROOT_PROC_INST_ID_ VARCHAR2(64),
   IS_MI_ROOT_ NUMBER(1),
   START_TIME_ TIMESTAMP(3),
   START_USER_ID_ VARCHAR2(255),
   IS_COUNT_ENABLED_ NUMBER(1),
   EVT_SUBSCR_COUNT_ NUMBER(11),
   TASK_COUNT_ NUMBER(11),
   JOB_COUNT_ NUMBER(11),
   TIMER_JOB_COUNT_ NUMBER(11),
   SUSP_JOB_COUNT_ NUMBER(11),
   DEADLETTER_JOB_COUNT_ NUMBER(11),
   VAR_COUNT_ NUMBER(11),
   ID_LINK_COUNT_ NUMBER(11),
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_EXE_PARENT FOREIGN KEY (PARENT_ID_) REFERENCES act_ru_execution (ID_) ON DELETE CASCADE,
   CONSTRAINT ACT_FK_EXE_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_EXE_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_) ON DELETE CASCADE,
   CONSTRAINT ACT_FK_EXE_SUPER FOREIGN KEY (SUPER_EXEC_) REFERENCES act_ru_execution (ID_) ON DELETE CASCADE
);

CREATE TABLE act_ru_deadletter_job (
   ID_ VARCHAR2(64),
   REV_ NUMBER(11),
   TYPE_ VARCHAR2(255) NOT NULL,
   EXCLUSIVE_ NUMBER(1),
   EXECUTION_ID_ VARCHAR2(64),
   PROCESS_INSTANCE_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   EXCEPTION_STACK_ID_ VARCHAR2(64),
   EXCEPTION_MSG_ VARCHAR2(4000),
   DUEDATE_ TIMESTAMP(3) NULL,
   REPEAT_ VARCHAR2(255),
   HANDLER_TYPE_ VARCHAR2(255),
   HANDLER_CFG_ VARCHAR2(4000),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_JOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_JOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_JOB_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_JOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_event_subscr (
   ID_ VARCHAR2(64),
   REV_ NUMBER(11),
   EVENT_TYPE_ VARCHAR2(255) NOT NULL,
   EVENT_NAME_ VARCHAR2(255),
   EXECUTION_ID_ VARCHAR2(64),
   PROC_INST_ID_ VARCHAR2(64),
   ACTIVITY_ID_ VARCHAR2(64),
   CONFIGURATION_ VARCHAR2(255),
   CREATED_ TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3),
   PROC_DEF_ID_ VARCHAR2(64),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   PRIMARY KEY (ID_),
   CONSTRAINT ACT_FK_EVENT_EXEC FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_)
);

CREATE TABLE act_ru_task (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   EXECUTION_ID_ VARCHAR2(64),
   PROC_INST_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   NAME_ VARCHAR2(255),
   PARENT_TASK_ID_ VARCHAR2(64),
   DESCRIPTION_ VARCHAR2(4000),
   TASK_DEF_KEY_ VARCHAR2(255),
   OWNER_ VARCHAR2(255),
   ASSIGNEE_ VARCHAR2(255),
   DELEGATION_ VARCHAR2(64),
   PRIORITY_ NUMBER(11),
   CREATE_TIME_ TIMESTAMP(3),
   DUE_DATE_ TIMESTAMP(3),
   CATEGORY_ VARCHAR2(255),
   SUSPENSION_STATE_ NUMBER(11),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   FORM_KEY_ VARCHAR2(255),
   CLAIM_TIME_ TIMESTAMP(3),
   CONSTRAINT ACT_FK_TASK_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TASK_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TASK_PROCDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_identitylink (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   GROUP_ID_ VARCHAR2(255),
   TYPE_ VARCHAR2(255),
   USER_ID_ VARCHAR2(255),
   TASK_ID_ VARCHAR2(64),
   PROC_INST_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   CONSTRAINT ACT_FK_ATHRZ_PROCEDEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_IDL_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TSKASS_TASK FOREIGN KEY (TASK_ID_) REFERENCES act_ru_task (ID_)
);

CREATE TABLE act_ru_job (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   TYPE_ VARCHAR2(255) NOT NULL,
   LOCK_EXP_TIME_ TIMESTAMP(3),
   LOCK_OWNER_ VARCHAR2(255),
   EXCLUSIVE_ NUMBER(1),
   EXECUTION_ID_ VARCHAR2(64),
   PROCESS_INSTANCE_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   RETRIES_ NUMBER(11),
   EXCEPTION_STACK_ID_ VARCHAR2(64),
   EXCEPTION_MSG_ VARCHAR2(4000),
   DUEDATE_ TIMESTAMP(3),
   REPEAT_ VARCHAR2(255),
   HANDLER_TYPE_ VARCHAR2(255),
   HANDLER_CFG_ VARCHAR2(4000),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   CONSTRAINT ACT_FK_RUJOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_RUJOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_RUJOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_RUJOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_suspended_job (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   TYPE_ VARCHAR2(255) NOT NULL,
   EXCLUSIVE_ NUMBER(1),
   EXECUTION_ID_ VARCHAR2(64),
   PROCESS_INSTANCE_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   RETRIES_ NUMBER(11),
   EXCEPTION_STACK_ID_ VARCHAR2(64),
   EXCEPTION_MSG_ VARCHAR2(4000),
   DUEDATE_ TIMESTAMP(3),
   REPEAT_ VARCHAR2(255),
   HANDLER_TYPE_ VARCHAR2(255),
   HANDLER_CFG_ VARCHAR2(4000),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   CONSTRAINT ACT_FK_RSJOB_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_RSJOB_PROCESS_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_RSJOB_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_),
   CONSTRAINT ACT_FK_RSJOB_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_)
);

CREATE TABLE act_ru_timer_job (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   TYPE_ VARCHAR2(255) NOT NULL,
   LOCK_EXP_TIME_ TIMESTAMP(3),
   LOCK_OWNER_ VARCHAR2(255),
   EXCLUSIVE_ NUMBER(1),
   EXECUTION_ID_ VARCHAR2(64),
   PROCESS_INSTANCE_ID_ VARCHAR2(64),
   PROC_DEF_ID_ VARCHAR2(64),
   RETRIES_ NUMBER(11),
   EXCEPTION_STACK_ID_ VARCHAR2(64),
   EXCEPTION_MSG_ VARCHAR2(4000),
   DUEDATE_ TIMESTAMP(3),
   REPEAT_ VARCHAR2(255),
   HANDLER_TYPE_ VARCHAR2(255),
   HANDLER_CFG_ VARCHAR2(4000),
   TENANT_ID_ VARCHAR2(255) DEFAULT '',
   CONSTRAINT ACT_FK_TIMER_EXCEPTION FOREIGN KEY (EXCEPTION_STACK_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_TIMER_EXECUTION FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TIMER_INSTANCE FOREIGN KEY (PROCESS_INSTANCE_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_TIMER_PROC_DEF FOREIGN KEY (PROC_DEF_ID_) REFERENCES act_re_procdef (ID_)
);

CREATE TABLE act_ru_variable (
   ID_ VARCHAR2(64) PRIMARY KEY,
   REV_ NUMBER(11),
   TYPE_ VARCHAR2(255) NOT NULL,
   NAME_ VARCHAR2(255) NOT NULL,
   EXECUTION_ID_ VARCHAR2(64),
   PROC_INST_ID_ VARCHAR2(64),
   TASK_ID_ VARCHAR2(64),
   BYTEARRAY_ID_ VARCHAR2(64),
   DOUBLE_ FLOAT,
   LONG_ NUMBER(20),
   TEXT_ VARCHAR2(4000),
   TEXT2_ VARCHAR2(4000),
   CONSTRAINT ACT_FK_VAR_BYTEARRAY FOREIGN KEY (BYTEARRAY_ID_) REFERENCES act_ge_bytearray (ID_),
   CONSTRAINT ACT_FK_VAR_EXE FOREIGN KEY (EXECUTION_ID_) REFERENCES act_ru_execution (ID_),
   CONSTRAINT ACT_FK_VAR_PROCINST FOREIGN KEY (PROC_INST_ID_) REFERENCES act_ru_execution (ID_)
);

/**流程表**/
CREATE TABLE sys_workflow (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    simpleName VARCHAR2(256),
    objectType VARCHAR2(100),
    remark VARCHAR2(1024),
    scope VARCHAR2(200),
    nameRul CLOB,
    codeRule VARCHAR2(2048),
    orderNum NUMBER(10),
    isSystem VARCHAR2(1),
    isValid VARCHAR2(2),
    isClose VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY (id)
);

/**流程实例表**/
CREATE TABLE wf_instance (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    objectType VARCHAR2(100),
    remark VARCHAR2(1024),
    modelId VARCHAR2(36),
    status VARCHAR2(20),
    orderNum NUMBER(10),
    isSystem VARCHAR2(1),
    isValid VARCHAR2(2),
    isDefault VARCHAR2(2),
    graphView BLOB,
    tranExeCls CLOB,
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY (id)
);
ALTER TABLE wf_instance ADD step VARCHAR2(2);
ALTER TABLE wf_instance ADD title VARCHAR2(256);
ALTER TABLE wf_instance ADD deploymentId VARCHAR2(50);
ALTER TABLE wf_instance ADD tempStatus VARCHAR2(20);

/**流程节点表**/
CREATE TABLE wf_node (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    workflowId VARCHAR2(36),
    type VARCHAR2(36),
    property VARCHAR2(256),
    linkedStatusId VARCHAR2(36),
    workflowPageId VARCHAR2(36),
    emailRole CLOB,
    notifyRole VARCHAR2(512),
    isEmailFile VARCHAR2(2),
    tranType VARCHAR2(2),
    phaseRule CLOB,
    lagMode VARCHAR2(8),
    autoToId VARCHAR2(36),
    exeCls VARCHAR2(256),
    entityOpRul CLOB,
    isSynEntity VARCHAR2(1),
    canWrite VARCHAR2(2),
    canUpdateFile VARCHAR2(2),
    canUpdateRelate VARCHAR2(2),
    rejectRole VARCHAR2(512),
    remark VARCHAR2(1024),
    orderNum NUMBER(10),
    isSystem VARCHAR2(1),
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY (id)
);
ALTER TABLE wf_node ADD canRollback VARCHAR2(2) NULL;

/**流程操作表**/
CREATE TABLE wf_transition (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    nodeId VARCHAR2(36),
    toNodeId VARCHAR2(36),
    workflowPageId VARCHAR2(36),
    deriveWorkflowType VARCHAR2(36),
    toDeriveNodeId VARCHAR2(36),
    conditions CLOB,
    type VARCHAR2(36),
    isOnlyOnce VARCHAR2(2),
    isSaveNodeUser VARCHAR2(2),
    SynCondition VARCHAR2(2),
    exeCls VARCHAR2(256),
    workflowId VARCHAR2(36),
    deriveWorkflowId VARCHAR2(36),
    isDelPageUser VARCHAR2(4000),
    hasSave VARCHAR2(2),
    pageTo VARCHAR2(2),
    isMulTask VARCHAR2(2),
    functionRight VARCHAR2(36),
    mapField CLOB,
    deriveMode VARCHAR2(2),
    emailRemindAgain VARCHAR2(2),
    remark VARCHAR2(1024),
    orderNum NUMBER(10),
    isSystem VARCHAR2(2),
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY (id)
);
ALTER TABLE wf_transition ADD isForking VARCHAR2(2) NULL;
ALTER TABLE wf_transition ADD isDefaultForking VARCHAR2(2) NULL;

/**流程操作与生命周期关联表**/
CREATE TABLE wf_lifecycleTransition_rlt (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    type VARCHAR2(20),
    lcPhaseId VARCHAR2(36),
    toLcPhaseId VARCHAR2(36),
    lastLcPhaseId VARCHAR2(36),
    toWorkflowType VARCHAR2(36),
    toWorkflowId VARCHAR2(36),
    toNodeId VARCHAR2(36),
    derivePageId VARCHAR2(36),
    deriveTranId VARCHAR2(36),
    tempNodeId VARCHAR2(36),
    exeCls VARCHAR2(256),
    mapField CLOB,
    remark VARCHAR2(1024),
    orderNum NUMBER(10),
    isValid VARCHAR2(2),
    isMulTask VARCHAR2(2),
    operateRole VARCHAR2(36),
    deriveMode VARCHAR2(2),
    pageTo VARCHAR2(2),
    PRIMARY KEY(id)
);

/**流程操作与角色关联表**/
CREATE TABLE wf_authorizationRole_rlt (
    id VARCHAR2(36) NOT NULL,
    transitionId VARCHAR2(36),
    roleId VARCHAR2(36),
    conditions VARCHAR2(36),
    isValid VARCHAR2(2),
    PRIMARY KEY(id)
);

/**流程操作与操作关联表**/
CREATE TABLE wf_authorizationOperate_rlt (
    id VARCHAR2(36) NOT NULL,
    transitionId VARCHAR2(36),
    role VARCHAR2(36),
    operate VARCHAR2(36),
    isValid VARCHAR2(2),
    PRIMARY KEY(id)
);

/**流程决策关联表**/
CREATE TABLE wf_decisionCondition (
    id VARCHAR2(36) NOT NULL,
    transitionId VARCHAR2(36),
    nodeId VARCHAR2(36),
    conditionValue CLOB,
    isValid VARCHAR2(2),
    PRIMARY KEY(id)
);

/**流程角色表**/
CREATE TABLE wf_role (
    id VARCHAR2(36) NOT NULL,
    workflowType VARCHAR2(36),
    name VARCHAR2(256),
    val VARCHAR2(36),
    orderNum NUMBER,
    isSystem VARCHAR2(2),
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36), 
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);

/**流程角色与字段关联表**/
CREATE TABLE wf_RoleMatch_rlt (
    id VARCHAR2(36) NOT NULL,
    pageFieldId VARCHAR2(36),
    pageId VARCHAR2(36),
    roleId VARCHAR2(36),
    PRIMARY KEY(id)
);

/**流程与实体关联表**/
CREATE TABLE wf_workflowEntity_rlt(
    id VARCHAR2(36) NOT NULL,
    srcId VARCHAR2(36),
    srcType VARCHAR2(36),
    destId VARCHAR2(36),
    destType VARCHAR2(36),
    relateId VARCHAR2(36),
    type NUMBER(10,0),
    remark clob,
    parentId VARCHAR2(36),
    isAutoCreateTsk CHAR(1),
    orderNum NUMBER,
    srcName VARCHAR2(255),
    destName VARCHAR2(255),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_workflowEntity_00001 ON wf_workflowEntity_rlt(srcId);
CREATE INDEX Idx_workflowEntity_00002 ON wf_workflowEntity_rlt(srcType);
CREATE INDEX Idx_workflowEntity_00003 ON wf_workflowEntity_rlt(destId);
CREATE INDEX Idx_workflowEntity_00004 ON wf_workflowEntity_rlt(destType);
CREATE INDEX Idx_workflowEntity_00005 ON wf_workflowEntity_rlt(relateId);
CREATE INDEX Idx_workflowEntity_00006 ON wf_workflowEntity_rlt(type);
CREATE INDEX Idx_workflowEntity_00007 ON wf_workflowEntity_rlt(createdTime DESC);

/**流程与派生关联表**/
CREATE TABLE wf_workflowDerive_rlt(
    id VARCHAR2(36) NOT NULL,
    isTarget VARCHAR2(2),
    remark clob,
    objectId VARCHAR2(36),
    PRIMARY KEY(id)
);

/**流程代办表**/
CREATE TABLE wf_myReceive (
    id VARCHAR2(36) NOT NULL,
    type VARCHAR2(36),
    objectId VARCHAR2(36),
    name VARCHAR2(256),
    code VARCHAR2(36),
    userId VARCHAR2(36),
    agtUserId VARCHAR2(36),
    isNew VARCHAR2(2),
    productId VARCHAR2(36),
    projectId VARCHAR2(36),
    departmentId VARCHAR2(36),
    statusId VARCHAR2(36),
    light NUMBER,
    hasOperateFun VARCHAR2(2), 
    creatorId VARCHAR2(36), 
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_myReceive_00001 ON wf_myReceive(type ASC);
CREATE INDEX Idx_myReceive_00002 ON wf_myReceive(userId ASC);

/**流程评论表**/
CREATE TABLE wf_workflow_cmnt(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    remark VARCHAR2(2048),
    replyId VARCHAR2(36),
    parentId VARCHAR2(36),
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);

/**流程组合表**/
CREATE TABLE wf_workflowGroup(
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256),
    status VARCHAR2(2),
    remark VARCHAR2(2048),
    isValid VARCHAR2(2),
    orderNum NUMBER,
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);

/**流程组合关联表**/
CREATE TABLE wf_workflowGroup_rlt(
    id VARCHAR2(36) NOT NULL,
    groupId VARCHAR2(36),
    instanceId VARCHAR2(36),
    workflowType VARCHAR2(100),
    isValid VARCHAR2(2),
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);

/**流程缺陷主表**/
CREATE TABLE wf_bug(
    id VARCHAR2(36) NOT NULL,
    code VARCHAR2(36),
    name VARCHAR2(256),
    projectId VARCHAR2(36),
    productId VARCHAR2(36),
    departmentId VARCHAR2(36),
    typeId VARCHAR2(36),
    probabilityId VARCHAR2(36),
    severityId VARCHAR2(36),
    levelId VARCHAR2(36),
    statusId VARCHAR2(36),
    remark VARCHAR2(2048),
    hopeFinishDate TIMESTAMP,
    planFinishDate TIMESTAMP,
    realFinishDate TIMESTAMP,
    presenterId VARCHAR2(36),
    presentDate TIMESTAMP,
    locatorId VARCHAR2(36),
    locatDate TIMESTAMP,
    solverId VARCHAR2(36),
    solveDate TIMESTAMP,
    verifierId VARCHAR2(36),
    verifyDate TIMESTAMP,
    closeDate TIMESTAMP,
    age NUMBER(11),
    isDemo VARCHAR2(36),
    moduleId VARCHAR2(36),
    entityStatusId VARCHAR2(36),
    causeAnalysis VARCHAR2(2048),
    regressionRemark VARCHAR2(2048),
    signOpinionId VARCHAR2(36),
    signRemark VARCHAR2(2048),
    reOpenTimes NUMBER,
    testAuditorId VARCHAR2(1024),
    developAuditorId VARCHAR2(1024),
    auditorId VARCHAR2(1024),
    auditDate TIMESTAMP,
    auditRemark VARCHAR2(2048),
    lampSign NUMBER,
    ownerIds VARCHAR2(2048),
    nodeEnterTime TIMESTAMP,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
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
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    PRIMARY KEY(id)
);
CREATE INDEX Idx_bugExt_00001 ON wf_bug_Ext(objectId ASC);

/**流程缺陷角色用户关联表**/
CREATE TABLE wf_bugRoleUser_rlt(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    isGlobalRole VARCHAR2(2),
    fieldName VARCHAR2(36),
    isNew VARCHAR2(2),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_bugRoleUserRlt_00001 ON wf_bugRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_bugRoleUserRlt_00002 ON wf_bugRoleUser_rlt(userId ASC);

/**流程缺陷角色用户关联历史表**/
CREATE TABLE wf_bugRoleUserHis_rlt(
    id VARCHAR2(36) NOT NULL,
    nodeId VARCHAR2(36),
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    fieldName VARCHAR2(36),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_bugRoleUserHis_00001 ON wf_bugRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_bugRoleUserHis_00002 ON wf_bugRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_bugRoleUserHis_00003 ON wf_bugRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_bugRoleUserHis_00004 ON wf_bugRoleUserHis_rlt(roleId ASC);

/**缺陷流程操作记录关联表**/
CREATE TABLE wf_bug_opRec (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    nodeId VARCHAR2(36),
    transitionId VARCHAR2(36),
    remark VARCHAR2(4000),
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_bugOpRec_00001 ON wf_bug_opRec(objectId ASC);

/**缺陷流程操作历史关联表**/
CREATE TABLE wf_bug_OpHis (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    transitionId VARCHAR2(36),
    fromValue VARCHAR2(36),
    toValue VARCHAR2(36),
    type VARCHAR2(36),
    remark VARCHAR2(2048),
    recView CLOB,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_bugOpHis_00001 ON wf_bug_OpHis(objectId ASC);

CREATE TABLE wf_chg(
    id VARCHAR2(36) NOT NULL,
    code VARCHAR2(36),
    name VARCHAR2(256),
    projectId VARCHAR2(36),
    productId VARCHAR2(36),
    departmentId VARCHAR2(36),
    typeId VARCHAR2(36),
    levelId VARCHAR2(36),
    statusId VARCHAR2(36),
    remark VARCHAR2(2048),
    reason VARCHAR2(2048),
    effectAna VARCHAR2(2048),
    costEffectAna VARCHAR2(2048),
    scheEffectAna VARCHAR2(2048),
    changePlan VARCHAR2(2048),
    presenterId VARCHAR2(36),
    presentDate TIMESTAMP,
    projectMngId VARCHAR2(36),
    cbbControlIds VARCHAR2(1024),
    isEffectBasic VARCHAR2(36),
    entityStatusId VARCHAR2(36),
    signOpinionId VARCHAR2(36),
    signRemark VARCHAR2(2048),
    auditorId VARCHAR2(1024),
    auditDate TIMESTAMP,
    auditRemark VARCHAR2(2048),
    lampSign NUMBER,
    ownerId VARCHAR2(36),
    actorId VARCHAR2(1048),
    ownerIds VARCHAR2(1048),
    nodeEnterTime TIMESTAMP,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chg_00001 ON wf_chg(code ASC); 
CREATE INDEX Idx_chg_00002 ON wf_chg(typeId ASC); 
CREATE INDEX Idx_chg_00003 ON wf_chg(levelId ASC); 
CREATE INDEX Idx_chg_00004 ON wf_chg(statusId ASC);
CREATE INDEX Idx_chg_00005 ON wf_chg(modifyTime DESC);
CREATE INDEX Idx_chg_00006 ON wf_chg(name ASC);
CREATE INDEX Idx_chg_00007 ON wf_chg(projectId ASC);
CREATE INDEX Idx_chg_00008 ON wf_chg(creatorId ASC);

CREATE TABLE wf_chg_Ext(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chgExt_00001 ON wf_chg_Ext(objectId ASC);

CREATE TABLE wf_chgRoleUser_rlt(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    isGlobalRole VARCHAR2(2),
    fieldName VARCHAR2(36),
    isNew VARCHAR2(2),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chgRoleUserRlt_00001 ON wf_chgRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_chgRoleUserRlt_00002 ON wf_chgRoleUser_rlt(userId ASC);

CREATE TABLE wf_chgRoleUserHis_rlt(
    id VARCHAR2(36) NOT NULL,
    nodeId VARCHAR2(36),
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    fieldName VARCHAR2(36),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chgRoleUserHis_00001 ON wf_chgRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_chgRoleUserHis_00002 ON wf_chgRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_chgRoleUserHis_00003 ON wf_chgRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_chgRoleUserHis_00004 ON wf_chgRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_chg_opRec (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    nodeId VARCHAR2(36),
    transitionId VARCHAR2(36),
    remark CLOB,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chgOpRec_00001 ON wf_chg_opRec(objectId ASC);

CREATE TABLE wf_chg_OpHis (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    transitionId VARCHAR2(36),
    fromValue VARCHAR2(36),
    toValue VARCHAR2(36),
    type VARCHAR2(36),
    remark VARCHAR2(2048),
    recView CLOB,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_chgOpHis_00001 ON wf_chg_OpHis(objectId ASC);

CREATE TABLE wf_chg_milestone (
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    projectId VARCHAR2(36),
    planId VARCHAR2(36),
    isShowPhase VARCHAR2(2),
    mileInfo CLOB,
    PRIMARY KEY(id)
);

CREATE TABLE wf_isu(
    id VARCHAR2(36) NOT NULL,
    code VARCHAR2(36),
    name VARCHAR2(256),
    projectId VARCHAR2(36),
    productId VARCHAR2(36),
    departmentId VARCHAR2(36),
    typeId VARCHAR2(36),
    severityId VARCHAR2(36),
    levelId VARCHAR2(36),
    statusId VARCHAR2(36),
    remark VARCHAR2(2048),
    solution VARCHAR2(2048),
    questionRemark VARCHAR2(2048),
    hopeFinishDate TIMESTAMP,
    planFinishDate TIMESTAMP,
    realFinishDate TIMESTAMP,
    presenterId VARCHAR2(36),
    presentDate TIMESTAMP,
    isDemo VARCHAR2(36),
    entityStatusId VARCHAR2(36),
    signOpinionId VARCHAR2(36),
    signRemark VARCHAR2(2048),
    auditorId VARCHAR2(1024),
    auditDate TIMESTAMP,
    auditRemark VARCHAR2(2048),
    lampSign number,
    ownerId VARCHAR2(36),
    actorId VARCHAR2(2048),
    ownerIds VARCHAR2(2048),
    nodeEnterTime TIMESTAMP,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
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
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    PRIMARY KEY(id)
);
CREATE INDEX Idx_isuExt_00001 ON wf_isu_Ext(objectId ASC);

CREATE TABLE wf_isuRoleUser_rlt(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    isGlobalRole VARCHAR2(2),
    fieldName VARCHAR2(36),
    isNew VARCHAR2(2),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_isuRoleUserRlt_00001 ON wf_isuRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_isuRoleUserRlt_00002 ON wf_isuRoleUser_rlt(userId ASC);

CREATE TABLE wf_isuRoleUserHis_rlt(
    id VARCHAR2(36) NOT NULL,
    nodeId VARCHAR2(36),
    objectId VARCHAR2(36),
    userId VARCHAR2(36),
    roleId VARCHAR2(36),
    fieldName VARCHAR2(36),
    isValid VARCHAR2(2),
    agtUserId VARCHAR2(36),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_isuRoleUserHis_00001 ON wf_isuRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_isuRoleUserHis_00002 ON wf_isuRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_isuRoleUserHis_00003 ON wf_isuRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_isuRoleUserHis_00004 ON wf_isuRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_isu_opRec (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    nodeId VARCHAR2(36),
    transitionId VARCHAR2(36),
    remark CLOB,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_isuOpRec_00001 ON wf_isu_opRec(objectId ASC);

CREATE TABLE wf_isu_OpHis (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512),
    projectId VARCHAR2(36),
    objectId VARCHAR2(36),
    transitionId VARCHAR2(36),
    fromValue VARCHAR2(36),
    toValue VARCHAR2(36),
    type VARCHAR2(36),
    remark VARCHAR2(2048),
    recView CLOB,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36),
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_isuOpHis_00001 ON wf_isu_OpHis(objectId ASC);

CREATE TABLE wf_mrq(
	id VARCHAR2(36) NOT NULL,
	code VARCHAR2(36),
	name VARCHAR2(256),
	projectId VARCHAR2(36),
	productId VARCHAR2(36),
	departmentId VARCHAR2(36),
	statusId VARCHAR2(36),
	remark VARCHAR2(2048),
	presenterId VARCHAR2(36),
	presentDate TIMESTAMP,
	entityStatusId VARCHAR2(36),
	signOpinionId VARCHAR2(36),
	signRemark VARCHAR2(2048),
	auditorId VARCHAR2(1024),
	auditDate TIMESTAMP,
	auditRemark VARCHAR2(2048),
	reviewerId VARCHAR2(36),
	reviewRemark VARCHAR2(2048),
	trackRemark VARCHAR2(2048),
	projectMngId VARCHAR2(36),
	reqAnalystId VARCHAR2(36),
	analysisReq VARCHAR2(2048),
	hopeImplDate TIMESTAMP,
	planImplDate TIMESTAMP,
	realImplDate TIMESTAMP,
	acceptId VARCHAR2(36),
	acceptRemark VARCHAR2(1048),
	mrqSourceId VARCHAR2(36),
	secLevId VARCHAR2(36),
	gradeId VARCHAR2(36),
	stabilityId VARCHAR2(36),
	levelId VARCHAR2(36),
	typeId VARCHAR2(36),
	companyName VARCHAR2(128),
	customerName VARCHAR2(64),
	customerPosition VARCHAR2(64),
	telephone VARCHAR2(30),
	promiseRemark VARCHAR2(1048),
	lampSign NUMBER(1),
	ownerId VARCHAR2(36),
	actorId VARCHAR2(2048),
	ownerIds VARCHAR2(2048),
	nodeEnterTime TIMESTAMP,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
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
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36),
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqExt_00001 ON wf_mrq_Ext(objectId ASC);

CREATE TABLE wf_mrqRoleUser_rlt(
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36),
	userId VARCHAR2(36),
	roleId VARCHAR2(36),
	isGlobalRole VARCHAR2(2),
	fieldName VARCHAR2(36),
	isNew VARCHAR2(2),
	isValid VARCHAR2(2),
	agtUserId VARCHAR2(36),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqRoleUserRlt_00001 ON wf_mrqRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_mrqRoleUserRlt_00002 ON wf_mrqRoleUser_rlt(userId ASC);

CREATE TABLE wf_mrqRoleUserHis_rlt(
	id VARCHAR2(36) NOT NULL,
	nodeId VARCHAR2(36),
	objectId VARCHAR2(36),
	userId VARCHAR2(36),
	roleId VARCHAR2(36),
	fieldName VARCHAR2(36),
	isValid VARCHAR2(2),
	agtUserId VARCHAR2(36),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqRoleUserHis_00001 ON wf_mrqRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00002 ON wf_mrqRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00003 ON wf_mrqRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_mrqRoleUserHis_00004 ON wf_mrqRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_mrq_opRec (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512),
	projectId VARCHAR2(36),
	objectId VARCHAR2(36),
	nodeId VARCHAR2(36),
	transitionId VARCHAR2(36),
	remark CLOB,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqOpRec_00001 ON wf_mrq_opRec(objectId ASC);

CREATE TABLE wf_mrq_OpHis (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512),
	projectId VARCHAR2(36),
	objectId VARCHAR2(36),
	transitionId VARCHAR2(36),
	fromValue VARCHAR2(36),
	toValue VARCHAR2(36),
	type VARCHAR2(36),
	remark VARCHAR2(2048),
	recView CLOB,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_mrqOpHis_00001 ON wf_mrq_OpHis(objectId ASC);

CREATE TABLE wf_pmc (
	id VARCHAR2(36) NOT NULL,
	code VARCHAR2(36),
	name VARCHAR2(256),
	projectId VARCHAR2(36),
	productId VARCHAR2(36),
	departmentId VARCHAR2(36),
	statusId VARCHAR2(36),
	remark VARCHAR2(2048),
	projectMngId VARCHAR2(36),
	entityStatusId VARCHAR2(36),
	signOpinionId VARCHAR2(36),
	signRemark VARCHAR2(2048),
	auditorId VARCHAR2(1024),
	auditDate TIMESTAMP,
	auditRemark VARCHAR2(2048),
	lampSign NUMBER(1,0),
	ownerId VARCHAR2(36),
	actorId VARCHAR2(1048),
	ownerIds VARCHAR2(1048),
	highMngId VARCHAR2(1048),
	pjtData CLOB,
	pjtSummary CLOB,
	lessonLearned CLOB,
	nodeEnterTime TIMESTAMP,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmc_00001 ON wf_pmc (code ASC);
CREATE INDEX Idx_pmc_00002 ON wf_pmc (statusId ASC);
CREATE INDEX Idx_pmc_00003 ON wf_pmc (modifyTime DESC);
CREATE INDEX Idx_pmc_00004 ON wf_pmc (name ASC);
CREATE INDEX Idx_pmc_00005 ON wf_pmc (projectId ASC);
CREATE INDEX Idx_pmc_00006 ON wf_pmc (creatorId ASC);

CREATE TABLE wf_pmc_Ext (
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36),
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcExt_00001 ON wf_pmc_Ext (objectId ASC);

CREATE TABLE wf_pmcRoleUser_rlt (
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36),
	userId VARCHAR2(36),
	roleId VARCHAR2(36),
	isGlobalRole VARCHAR2(2),
	fieldName VARCHAR2(36),
	isNew VARCHAR2(2),
	isValid VARCHAR2(2),
	agtUserId VARCHAR2(36),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcRoleUserRlt_00001 ON wf_pmcRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_pmcRoleUserRlt_00002 ON wf_pmcRoleUser_rlt(userId ASC);

CREATE TABLE wf_pmcRoleUserHis_rlt (
	id VARCHAR2(36) NOT NULL,
	nodeId VARCHAR2(36),
	objectId VARCHAR2(36),
	userId VARCHAR2(36),
	roleId VARCHAR2(36),
	fieldName VARCHAR2(36),
	isValid VARCHAR2(2),
	agtUserId VARCHAR2(36),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcRoleUserHis_00001 ON wf_pmcRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00002 ON wf_pmcRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00003 ON wf_pmcRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_pmcRoleUserHis_00004 ON wf_pmcRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_pmc_opRec (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512),
	projectId VARCHAR2(36),
	objectId VARCHAR2(36),
	nodeId VARCHAR2(36),
	transitionId VARCHAR2(36),
	remark clob,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcOpRec_00001 ON wf_pmc_opRec(objectId ASC);

CREATE TABLE wf_pmc_OpHis (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512),
	projectId VARCHAR2(36),
	objectId VARCHAR2(36),
	transitionId VARCHAR2(36),
	fromValue VARCHAR2(36),
	toValue VARCHAR2(36),
	type VARCHAR2(36),
	remark VARCHAR2(2048),
	recView clob,
	isValid VARCHAR2(2),
	creatorId VARCHAR2(36),
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_pmcOpHis_00001 ON wf_pmc_OpHis(objectId ASC);

CREATE TABLE wf_pmi(
    id VARCHAR2(36) NOT NULL,
    code VARCHAR2(36) NULL,
    name VARCHAR2(256) NULL,
    projectId VARCHAR2(36) NULL,
    productId VARCHAR2(36) NULL,
    departmentId VARCHAR2(36) NULL,
    typeId VARCHAR2(36) NULL,
    levelId VARCHAR2(36) NULL,
    statusId VARCHAR2(36) NULL,
    remark CLOB NULL,
    projectMngId VARCHAR2(36) NULL,
    entityStatusId VARCHAR2(36) NULL,
    signOpinionId VARCHAR2(36) NULL,
    signRemark CLOB NULL,
    auditorId VARCHAR2(1024) NULL,
    auditDate TIMESTAMP,
    auditRemark CLOB NULL,
    lampSign NUMBER,
    ownerId VARCHAR2(36) NULL,
    actorId VARCHAR2(1048) NULL,
    ownerIds VARCHAR2(1048) NULL,
    customerName VARCHAR2(256) NULL,
    pjtBudget FLOAT,
    busAnalyzer VARCHAR2(1048) NULL, 
    highMngId VARCHAR2(1048) NULL, 
    pjtBackground CLOB, 
    pjtTarget CLOB, 
    pjtScope CLOB, 
    techAnalysis CLOB, 
    busAnalysis CLOB, 
    riskAnalysis CLOB, 
    planIds VARCHAR2(1048) NULL, 
    nodeEnterTime TIMESTAMP,
    isValid VARCHAR2(2) NULL,
    creatorId VARCHAR2(36) NULL,
    createdTime TIMESTAMP,
    modifyId VARCHAR2(36) NULL,
    modifyTime TIMESTAMP,
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
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36) NULL,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiExt_00001 ON wf_pmi_Ext(objectId ASC);

CREATE TABLE wf_pmiRoleUser_rlt(
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36) NULL,
    userId VARCHAR2(36) NULL,
    roleId VARCHAR2(36) NULL,
    isGlobalRole VARCHAR2(2) NULL,
    fieldName VARCHAR2(36) NULL,
    isNew VARCHAR2(2) NULL,
    isValid VARCHAR2(2) NULL,
    agtUserId VARCHAR2(36) NULL,
    creatorId VARCHAR2(36) NULL,
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiRoleUserRlt_00001 ON wf_pmiRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_pmiRoleUserRlt_00002 ON wf_pmiRoleUser_rlt(userId ASC);

CREATE TABLE wf_pmiRoleUserHis_rlt(
    id VARCHAR2(36) NOT NULL,
    nodeId VARCHAR2(36) NULL,
    objectId VARCHAR2(36) NULL,
    userId VARCHAR2(36) NULL,
    roleId VARCHAR2(36) NULL,
    fieldName VARCHAR2(36) NULL,
    isValid VARCHAR2(2) NULL,
    agtUserId VARCHAR2(36) NULL,
    creatorId VARCHAR2(36) NULL,
    createdTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiRoleUserHis_00001 ON wf_pmiRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00002 ON wf_pmiRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00003 ON wf_pmiRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_pmiRoleUserHis_00004 ON wf_pmiRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_pmi_opRec (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512) NULL,
    projectId VARCHAR2(36) NULL, 
    objectId VARCHAR2(36) NULL,
    nodeId VARCHAR2(36) NULL,
    transitionId VARCHAR2(36) NULL,
    remark CLOB NULL,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36), 
    createdTime TIMESTAMP, 
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiOpRec_00001 ON wf_pmi_opRec(objectId ASC);

CREATE TABLE wf_pmi_OpHis (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(512) NULL,
    projectId VARCHAR2(36) NULL, 
    objectId VARCHAR2(36) NULL,
    transitionId VARCHAR2(36) NULL,
    fromValue VARCHAR2(36) NULL,
    toValue VARCHAR2(36) NULL,
    type VARCHAR2(36) NULL,
    remark VARCHAR2(2048) NULL,
    recView CLOB NULL,
    isValid VARCHAR2(2),
    creatorId VARCHAR2(36), 
    createdTime TIMESTAMP, 
    modifyId VARCHAR2(36),
    modifyTime TIMESTAMP,
    PRIMARY KEY(id)
);
CREATE INDEX Idx_pmiOpHis_00001 ON wf_pmi_OpHis(objectId ASC);

CREATE TABLE wf_pmi_milestone (
    id VARCHAR2(36) NOT NULL,
    name VARCHAR2(256) NULL,
    objectId VARCHAR2(36) NULL,
    mileId VARCHAR2(36) NULL,
    phaseId VARCHAR2(36) NULL,
    isShowPhase VARCHAR2(2) NULL,
    status VARCHAR2(36) NULL,
    planEndDate TIMESTAMP NULL, 
    realEndDate TIMESTAMP NULL,
    isValid VARCHAR2(2) NULL,
    orderNum NUMBER,
    remark VARCHAR2(2048) NULL,
    canDelete VARCHAR2(2) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE wf_pmi_roleMember (
    id VARCHAR2(36) NOT NULL,
    objectId VARCHAR2(36) NULL,
    roleId VARCHAR2(36) NULL,
    userIds VARCHAR2(2048) NULL,
    isValid VARCHAR2(2) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE wf_rew(
	id VARCHAR2(36) NOT NULL,
	code VARCHAR2(36) NULL,
	name VARCHAR2(256) NULL,
	projectId VARCHAR2(36) NULL,
	productId VARCHAR2(36) NULL,
	departmentId VARCHAR2(36) NULL,
	statusId VARCHAR2(36) NULL,
	remark VARCHAR2(2048) NULL,
	pointId VARCHAR2(36) NULL,
	presenterId VARCHAR2(36) NULL,
	planRewDate TIMESTAMP,
	realRewDate TIMESTAMP,
	preRequest VARCHAR2(2048) NULL,
	formalRequest VARCHAR2(2048) NULL,
	rewResultId VARCHAR2(36) NULL,
	rewDocScoreId VARCHAR2(36) NULL,
	rewProcScoreId VARCHAR2(36) NULL,
	rewRemark VARCHAR2(2048) NULL,
	address VARCHAR2(500) NULL,
	rewTimes NUMBER(10,0),
	projectMngId VARCHAR2(36) NULL,
	functionMngId VARCHAR2(36) NULL,
	entityStatusId VARCHAR2(36) NULL,
	signOpinionId VARCHAR2(36) NULL,
	signRemark VARCHAR2(2048) NULL,
	auditorId VARCHAR2(1024) NULL,
	auditDate TIMESTAMP,
	auditRemark VARCHAR2(2048) NULL,
	lampSign NUMBER(1,0),
	ownerId VARCHAR2(36) NULL,
	actorId VARCHAR2(1024) NULL,
	ownerIds VARCHAR2(2048) NULL,
	nodeEnterTime TIMESTAMP,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
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
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewExt_00001 ON wf_rew_Ext(objectId ASC);

CREATE TABLE wf_rewRoleUser_rlt(
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36) NULL,
	userId VARCHAR2(36) NULL,
	roleId VARCHAR2(36) NULL,
	isGlobalRole VARCHAR2(2) NULL,
	fieldName VARCHAR2(36) NULL,
	isNew VARCHAR2(2) NULL,
	isValid VARCHAR2(2) NULL,
	agtUserId VARCHAR2(36) NULL, 
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewRoleUserRlt_00001 ON wf_rewRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_rewRoleUserRlt_00002 ON wf_rewRoleUser_rlt(userId ASC);

CREATE TABLE wf_rewRoleUserHis_rlt(
	id VARCHAR2(36) NOT NULL,
	nodeId VARCHAR2(36) NULL,
	objectId VARCHAR2(36) NULL,
	userId VARCHAR2(36) NULL,
	roleId VARCHAR2(36) NULL,
	fieldName VARCHAR2(36) NULL,
	isValid VARCHAR2(2) NULL,
	agtUserId VARCHAR2(36) NULL, 
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewRoleUserHis_00001 ON wf_rewRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_rewRoleUserHis_00002 ON wf_rewRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_rewRoleUserHis_00003 ON wf_rewRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_rewRoleUserHis_00004 ON wf_rewRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_rew_opRec (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512) NULL,
	projectId VARCHAR2(36) NULL, 
	objectId VARCHAR2(36) NULL,
	nodeId VARCHAR2(36) NULL,
	transitionId VARCHAR2(36) NULL,
	remark clob NULL,
	isValid VARCHAR2(2),
    creatorId VARCHAR2(36), 
	createdTime TIMESTAMP, 
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewOpRec_00001 ON wf_rew_opRec(objectId ASC);

CREATE TABLE wf_rew_OpHis (
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512) NULL,
	projectId VARCHAR2(36) NULL, 
	objectId VARCHAR2(36) NULL,
	transitionId VARCHAR2(36) NULL,
	fromValue VARCHAR2(36) NULL,
	toValue VARCHAR2(36) NULL,
	type VARCHAR2(36) NULL,
	remark VARCHAR2(2048) NULL,
	recView clob NULL,
	isValid VARCHAR2(2),
  	creatorId VARCHAR2(36), 
	createdTime TIMESTAMP, 
	modifyId VARCHAR2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewOpHis_00001 ON wf_rew_OpHis(objectId ASC);

CREATE TABLE wf_rew_element(
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(2048) NULL,
	pointId VARCHAR2(36) NULL,
	categoryId VARCHAR2(36) NULL,
	importanceId VARCHAR2(36) NULL,
	remark VARCHAR2(2048) NULL,
	orderNum NUMBER,
	status VARCHAR2(2) NULL,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rewElement_00001 ON wf_rew_element(pointId ASC);
CREATE INDEX Idx_rewElement_00002 ON wf_rew_element(categoryId ASC);
CREATE INDEX Idx_rewElement_00003 ON wf_rew_element(status ASC);

CREATE TABLE wf_rew_importance(
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512) NULL,
	remark VARCHAR2(2048) NULL,
	orderNum NUMBER,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
); 

CREATE TABLE wf_rew_checkResult(
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512) NULL,
	remark VARCHAR2(2048) NULL,
	orderNum NUMBER,
	status VARCHAR2(2) NULL,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
); 

CREATE TABLE wf_rew_point(
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(512) NULL,
	pjtRole VARCHAR2(512) NULL,
	remark VARCHAR2(2048) NULL,
	orderNum NUMBER,
	isValid VARCHAR2(2) NULL,
	isShowCategory VARCHAR2(2) NULL,
	status VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
); 

CREATE TABLE wf_rew_category(
	id VARCHAR2(36) NOT NULL,
	name VARCHAR2(2048) NULL,
	pjtRole VARCHAR2(521) NULL,
	remark VARCHAR2(2048) NULL,
	pointId VARCHAR2(36) NULL,
	orderNum NUMBER,
	status VARCHAR2(2) NULL,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
); 

CREATE TABLE wf_rew_elementResultRlt(
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36) NULL,
	pointId VARCHAR2(36) NULL,
	elementId VARCHAR2(36) NULL,
	resultId VARCHAR2(36) NULL,
	detail VARCHAR2(2048) NULL,
	orderNum NUMBER,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_elementResultRlt_00001 ON wf_rew_elementResultRlt(objectId ASC);
CREATE INDEX Idx_elementResultRlt_00002 ON wf_rew_elementResultRlt(pointId ASC);
CREATE INDEX Idx_elementResultRlt_00003 ON wf_rew_elementResultRlt(elementId ASC);
CREATE INDEX Idx_elementResultRlt_00004 ON wf_rew_elementResultRlt(resultId ASC);
CREATE INDEX Idx_elementResultRlt_00005 ON wf_rew_elementResultRlt(creatorId ASC);
CREATE INDEX Idx_elementResultRlt_00006 ON wf_rew_elementResultRlt(modifyTime DESC);

CREATE TABLE wf_rsk(
	id VARCHAR2(36) NOT NULL,
	code VARCHAR2(36) NULL,
	name VARCHAR2(256) NULL,
	projectId VARCHAR2(36) NULL,
	productId VARCHAR2(36) NULL,
	departmentId VARCHAR2(36) NULL,
	typeId VARCHAR2(36) NULL,
	probabilityId VARCHAR2(36) NULL,
	effectId VARCHAR2(36) NULL,
	gradeId VARCHAR2(36) NULL,
	isDemo VARCHAR2(36) NULL,
	statusId VARCHAR2(36) NULL,
	remark VARCHAR2(2048) NULL,
	hopeFinishDate TIMESTAMP, 
	planFinishDate TIMESTAMP, 
	realFinishDate TIMESTAMP, 
	presenterId VARCHAR2(36) NULL,
	presentDate TIMESTAMP,
	entityStatusId VARCHAR2(36) NULL,
	signOpinionId VARCHAR2(36) NULL,
	signRemark VARCHAR2(2048) NULL,
	auditorId VARCHAR2(1024) NULL,
	auditDate TIMESTAMP,
	auditRemark VARCHAR2(2048) NULL,
	effectRemark VARCHAR2(1024) NULL,
	respondPlan VARCHAR2(1024) NULL,
	riskAnalysis VARCHAR2(1024) NULL,
	acceptReason VARCHAR2(1024) NULL,
	riskRemark VARCHAR2(1024) NULL,
	trackRemark VARCHAR2(1024) NULL,
	lampSign number,
	ownerId VARCHAR2(36) NULL,
	actorId VARCHAR2(2048) NULL,
	ownerIds VARCHAR2(2048) NULL,
	nodeEnterTime TIMESTAMP,
	isValid VARCHAR2(2) NULL,
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	modifyId VARCHAR2(36) NULL,
	modifyTime TIMESTAMP,
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
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36) NULL,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskExt_00001 ON wf_rsk_Ext(objectId ASC);

CREATE TABLE wf_rskRoleUser_rlt(
	id VARCHAR2(36) NOT NULL,
	objectId VARCHAR2(36) NULL,
	userId VARCHAR2(36) NULL,
	roleId VARCHAR2(36) NULL,
	isGlobalRole VARCHAR2(2) NULL,
	fieldName VARCHAR2(36) NULL,
	isNew VARCHAR2(2) NULL,
	isValid VARCHAR2(2) NULL,
	agtUserId VARCHAR2(36) NULL, 
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskRoleUserRlt_00001 ON wf_rskRoleUser_rlt(objectId ASC);
CREATE INDEX Idx_rskRoleUserRlt_00002 ON wf_rskRoleUser_rlt(userId ASC);

CREATE TABLE wf_rskRoleUserHis_rlt(
	id VARCHAR2(36) NOT NULL,
	nodeId VARCHAR2(36) NULL,
	objectId VARCHAR2(36) NULL,
	userId VARCHAR2(36) NULL,
	roleId VARCHAR2(36) NULL,
	fieldName VARCHAR2(36) NULL,
	isValid VARCHAR2(2) NULL,
	agtUserId VARCHAR2(36) NULL, 
	creatorId VARCHAR2(36) NULL,
	createdTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskRoleUserHis_00001 ON wf_rskRoleUserHis_rlt(userId ASC);
CREATE INDEX Idx_rskRoleUserHis_00002 ON wf_rskRoleUserHis_rlt(objectId ASC);
CREATE INDEX Idx_rskRoleUserHis_00003 ON wf_rskRoleUserHis_rlt(nodeId ASC);
CREATE INDEX Idx_rskRoleUserHis_00004 ON wf_rskRoleUserHis_rlt(roleId ASC);

CREATE TABLE wf_rsk_opRec (
	id varchar2(36) NOT NULL,
	name varchar2(512) NULL,
	projectId varchar2(36) NULL, 
	objectId varchar2(36) NULL,
	nodeId varchar2(36) NULL,
	transitionId varchar2(36) NULL,
	remark BLOB NULL,
	isValid varchar2(2),
    creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskOpRec_00001 ON wf_rsk_opRec(objectId ASC);

CREATE TABLE wf_rsk_OpHis (
	id varchar2(36) NOT NULL,
	name varchar2(512) NULL,
	projectId varchar2(36) NULL, 
	objectId varchar2(36) NULL,
	transitionId varchar2(36) NULL,
	fromValue varchar2(36) NULL,
	toValue varchar2(36) NULL,
	type varchar2(36) NULL,
	remark varchar2(2048) NULL,
	recView BLOB NULL,
	isValid varchar2(2),
  	creatorId varchar2(36), 
	createdTime TIMESTAMP, 
	modifyId varchar2(36),
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);
CREATE INDEX Idx_rskOpHis_00001 ON wf_rsk_OpHis(objectId ASC);

CREATE TABLE wf_rskLibrary(
	id varchar2(36) NOT NULL,
	name varchar2(256) NULL,
	typeId varchar2(36) NULL,
	probabilityId varchar2(36) NULL,
	effectId varchar2(36) NULL,
	gradeId varchar2(36) NULL,
	remark varchar2(2048) NULL,
	effectRemark varchar2(1024) NULL,
	respondPlan varchar2(1024) NULL,
	riskAnalysis varchar2(1024) NULL,
	riskRemark varchar2(1024) NULL,
	status varchar2(36) NULL,
	useTimes NUMBER,
	isValid varchar2(2) NULL,
	creatorId varchar2(36) NULL,
	createdTime TIMESTAMP,
	modifyId varchar2(36) NULL,
	modifyTime TIMESTAMP,
	PRIMARY KEY(id)
);