"use strict";var KISBPM=KISBPM||{};KISBPM.TOOLBAR_CONFIG={items:[{type:"button",title:"TOOLBAR.ACTION.BENDPOINT.ADD",cssClass:"editor-icon editor-icon-bendpoint-add square-btn",action:"KISBPM.TOOLBAR.ACTIONS.addBendPoint",id:"add-bendpoint-button",imgSrc:"editor-app/images/end.png",nTitle:"增加断点"},{type:"button",title:"TOOLBAR.ACTION.BENDPOINT.REMOVE",cssClass:"editor-icon editor-icon-bendpoint-remove square-btn",action:"KISBPM.TOOLBAR.ACTIONS.removeBendPoint",id:"remove-bendpoint-button",imgSrc:"editor-app/images/del-point.png",nTitle:"删除断点"},{id:"verticalBtn",type:"button",title:"TOOLBAR.ACTION.ALIGNVERTICAL",cssClass:"editor-icon editor-icon-align-vertical square-btn",action:"KISBPM.TOOLBAR.ACTIONS.alignVertical",enabled:!1,enabledAction:"element",minSelectionCount:2,imgSrc:"editor-app/images/horizontal-align.png",nTitle:"水平居中对齐"},{id:"horizontalBtn",type:"button",title:"TOOLBAR.ACTION.ALIGNHORIZONTAL",cssClass:"editor-icon editor-icon-align-horizontal square-btn",action:"KISBPM.TOOLBAR.ACTIONS.alignHorizontal",enabledAction:"element",enabled:!1,minSelectionCount:2,imgSrc:"editor-app/images/vertical-align.png",nTitle:"垂直居中对齐"},{type:"separator",title:"line",cssClass:"line"},{id:"redoBtn",type:"button",title:"TOOLBAR.ACTION.REDO",cssClass:"editor-icon editor-icon-redo square-btn",action:"KISBPM.TOOLBAR.ACTIONS.redo",enabled:!1,imgSrc:"editor-app/images/recovery.png",nTitle:"恢复"},{id:"undoBtn",type:"button",title:"TOOLBAR.ACTION.UNDO",cssClass:"editor-icon editor-icon-undo square-btn",action:"KISBPM.TOOLBAR.ACTIONS.undo",enabled:!1,imgSrc:"editor-app/images/cancel.png",nTitle:"撤销"},{id:"delBtn",type:"button",title:"TOOLBAR.ACTION.DELETE",cssClass:"editor-icon editor-icon-delete square-btn",action:"KISBPM.TOOLBAR.ACTIONS.deleteItem",enabled:!1,enabledAction:"element",imgSrc:"editor-app/images/delete-btn.png",nTitle:"删除"},{id:"saveBtn",type:"button",title:"TOOLBAR.ACTION.SAVE",cssClass:"editor-icon editor-icon-save square-btn",action:"KISBPM.TOOLBAR.ACTIONS.saveModel",enabled:!1,imgSrc:"editor-app/images/save.png",nTitle:"保存"}],secondaryItems:[{type:"button",title:"Close",cssClass:"editor-icon editor-icon-close",action:"KISBPM.TOOLBAR.ACTIONS.closeEditor"}]};