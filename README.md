<p align="center">
  <h1 align="center" style="margin: 30px 0 20px; font-weight: bold;">Eywe 项目管理系统</h1>
  <h4 align="center">v4.3.2 · 基于 Spring Boot + Vue 3 前后端分离</h4>
  <p align="center">
    <a href="https://gitee.com/eywe-butler/eywe"><img src="https://gitee.com/eywe-butler/eywe/badge/star.svg?theme=dark" alt="Gitee Star"></a>
    <img src="https://img.shields.io/badge/version-4.3.1-brightgreen.svg" alt="Version">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
  </p>
</p>

## 关于 Eywe

**Eywe** 是一款免费的项目管理软件，由[易为软件](http://www.cseywe.com)提供。产品灵活落地 **IPD**、**SCRUM**、**PMBOK** 等业界主流研发管理理念，以市场需求为导向、以计划任务为驱动，打通研发全流程，满足各岗位的项目协作需求。

Eywe 不仅提供项目管理、计划管理、需求管理、任务管理、测试管理和缺陷管理等丰富的功能模块，还支持用户**零代码**配置各类模块、流程、表单、字段、报表和仪表盘，满足个性化需求，协助中小型企业数字化转型，让项目管理更高效。

| 资源 | 地址 |
| --- | --- |
| 官方网站 | [http://www.cseywe.com](http://www.cseywe.com) |
| 在线演示 | [http://www.cseywe.com:90](http://www.cseywe.com:90)（账号：`Eywe`，密码：`123456`） |
| 开源仓库 | [https://gitee.com/eywe-butler/eywe](https://gitee.com/eywe-butler/eywe) |
| 安装包下载 | [https://pan.baidu.com/s/1qdGPmofQsVBVQr8kMI2-4g?pwd=EY01](https://pan.baidu.com/s/1qdGPmofQsVBVQr8kMI2-4g?pwd=EY01) |
| QQ 交流群 | **960994897** |

> 本仓库为 Eywe 管理端完整工程（后端多模块 + `eywe-ui` 前端），与 Gitee 主仓产品同源，便于二次开发与私有化部署。

## 平台简介

Eywe 项目管理系统采用前后端分离架构，面向企业研发与项目协作场景，在系统管理能力之上叠加项目管理业务能力。

**技术栈**

| 层级 | 技术 |
| --- | --- |
| 前端 | Vue 3、Vite、Element Plus、Pinia、Vue Router、Axios、Sass |
| 后端 | Java 8、Spring Boot 2.5、Spring Security、MyBatis、JWT |
| 中间件 | Redis |
| 数据库 | MySQL |
| 其他 | Druid 连接池、Swagger 接口文档、Quartz 定时任务、代码生成器 |

**架构特点**

- 前后端分离，接口基于 JWT，支持多终端认证。
- 支持动态权限菜单与多维度数据权限控制。
- 内置代码生成器，可一键生成前后端 CRUD 代码。
- 支持零代码扩展业务模块、流程、表单与报表（详见产品演示环境）。

### Eywe核心功能模块：

   **项目管理**：

   - **项目创建与配置**：创建新项目并配置项目参数。
   - **项目进度跟踪**：实时跟踪项目进度，了解项目的当前状态。
   - **项目报告**：生成项目报告，帮助用户分析和总结项目成果。

   **计划管理**：

   - **计划制定**：制定详细的项目计划，包括任务、时间和资源分配。
   - **甘特图**：使用甘特图展示项目计划和进度，直观了解项目各阶段的时间安排。
   - **计划调整**：根据项目实际进展情况，灵活调整计划。

   **需求管理**：

   - **需求收集与整理**：收集和整理项目需求，确保所有需求被记录和理解。
   - **需求分析**：分析需求的优先级和可行性，制定相应的实施计划。
   - **需求变更管理**：跟踪和管理需求变更，确保变更对项目的影响最小化。

   **任务管理**：

   - **任务创建与分配**：创建任务并分配给团队成员。
   - **任务优先级**：设定任务优先级，确保关键任务优先处理。
   - **任务进度跟踪**：实时跟踪任务进度，及时发现和解决问题。

   **测试管理**：

   - **测试计划**：制定详细的测试计划，包括测试目标、测试范围和测试方法。
   - **测试执行**：执行测试用例，记录测试结果。
   - **测试报告**：生成测试报告，总结测试结果和发现的问题。

   **缺陷管理**：

   - **缺陷记录**：记录项目过程中发现的所有缺陷。
   - **缺陷跟踪**：跟踪缺陷的修复进度，确保所有缺陷得到及时解决。
   - **缺陷分析**：分析缺陷的原因和影响，提出改进建议。

   **团队协作**：

   - **沟通工具**：提供团队沟通工具，方便团队成员之间的交流与协作。
   - **文档共享**：支持团队成员共享项目文档和资料。
   - **协作任务板**：使用协作任务板（如看板）展示任务状态，促进团队协作。

   **进度跟踪**：

   - **实时进度更新**：实时更新项目进度，确保项目成员了解最新状态。
   - **里程碑跟踪**：跟踪项目里程碑，确保项目按计划推进。
   - **进度预警**：提供进度预警功能，及时提醒潜在的进度延误。

   **报告生成**：

   - **自动报告生成**：自动生成各种项目报告，如进度报告、任务报告和资源报告。

   - **自定义报告**：支持自定义报告内容和格式，满足不同项目的需求。

   - **数据导出**：支持将报告数据导出为多种格式，方便进一步分析和分享

     


   ### Eywe部分功能模块预览

个人空间-工作台
<img width="1621" height="910" alt="1-个人空间-工作台" src="https://github.com/user-attachments/assets/3cb31355-58e8-4b53-9b5e-39d89c524806" />

个人空间-驾驶舱
<img width="1621" height="1256" alt="2-个人空间-驾驶舱" src="https://github.com/user-attachments/assets/b905ed9c-c151-4676-ab72-ec2cfed8970e" />

个人空间-我的任务
<img width="1619" height="816" alt="3-个人空间-我的任务" src="https://github.com/user-attachments/assets/7327dfa7-57f1-4924-926f-004950f089f5" />

个人空间-我的任务-填写进展
<img width="1621" height="1187" alt="3-个人空间-我的任务-填写进展" src="https://github.com/user-attachments/assets/3d8eb98e-ae3f-4b40-8ed9-beb07bb0260d" />

个人空间-我的流程
<img width="1560" height="789" alt="4-1个人空间-我的流程" src="https://github.com/user-attachments/assets/0d4fc31c-a693-42f4-81b5-feedb3db7949" />

个人空间-我的流程-流程审批
<img width="1560" height="1213" alt="4-2个人空间-我的流程-流程审批" src="https://github.com/user-attachments/assets/28cc167f-2669-4de7-8973-8457c126640d" />

个人空间-我的消息
<img width="1560" height="707" alt="4-2个人空间-我的消息" src="https://github.com/user-attachments/assets/2c20e71b-44b4-4229-8d1d-f16828379b32" />

文件管理-文档管理
<img width="1620" height="749" alt="4-文件管理-文档管理" src="https://github.com/user-attachments/assets/4b48a3bd-9d3b-4162-9787-f621cd6143cf" />

文件管理-文档管理-在线预览
<img width="1621" height="910" alt="5-文件管理-文档管理-在线预览" src="https://github.com/user-attachments/assets/cb209d93-7d72-4e48-b64b-95c22f712d98" />

文件管理-附件管理
<img width="1621" height="648" alt="6-文件管理-附件管理" src="https://github.com/user-attachments/assets/9a9061e2-3370-462a-9d2b-43c4fe7d3fc6" />

项目管理-产品需求管理
<img width="1620" height="748" alt="7-项目管理-产品需求管理" src="https://github.com/user-attachments/assets/7c46f08e-a24c-40ff-b74b-eb8fd96f7874" />

项目管理-市场需求管理
<img width="1620" height="755" alt="8-项目管理-市场需求管理" src="https://github.com/user-attachments/assets/e3a5725e-9bec-4e0c-9d13-cbe6fc8fcf1f" />

项目管理-立项管理
<img width="1621" height="503" alt="9-项目管理-立项管理" src="https://github.com/user-attachments/assets/5e82b390-0853-4295-8d62-df3b7c03d9d7" />

项目管理-立项管理-新建立项
<img width="1621" height="910" alt="10-项目管理-立项管理-新建立项" src="https://github.com/user-attachments/assets/7db3c774-6a5b-488c-97d6-3ca75ea378a1" />

项目管理-立项管理-立项流程
<img width="1920" height="911" alt="11-项目管理-立项管理-立项流程" src="https://github.com/user-attachments/assets/f617a3db-6c9b-4d2e-85f5-944b25e494d9" />

项目管理-项目管理
<img width="1620" height="549" alt="12-项目管理-项目管理" src="https://github.com/user-attachments/assets/236e88c2-9818-49f4-bc5e-1ab97d36abac" />

项目管理-甘特图
![输入图片说明](images/13-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E7%94%98%E7%89%B9%E5%9B%BE.png)

项目管理-里程碑
![输入图片说明](images/14-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E9%87%8C%E7%A8%8B%E7%A2%91.png)

项目管理-项目概览
![输入图片说明](images/15-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E9%A1%B9%E7%9B%AE%E6%A6%82%E8%A7%88.png)

项目管理-风险管理
![输入图片说明](images/16-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E9%A3%8E%E9%99%A9%E7%AE%A1%E7%90%86.png)

项目管理-风险管理-风险管理流程
![输入图片说明](images/17-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E9%A3%8E%E9%99%A9%E7%AE%A1%E7%90%86-%E9%A3%8E%E9%99%A9%E7%AE%A1%E7%90%86%E6%B5%81%E7%A8%8B.png)

项目管理-变更管理-变更详情
![输入图片说明](images/18-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E5%8F%98%E6%9B%B4%E7%AE%A1%E7%90%86-%E5%8F%98%E6%9B%B4%E8%AF%A6%E6%83%85.png)

项目管理-变更管理-变更流程图
![输入图片说明](images/19-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E5%8F%98%E6%9B%B4%E7%AE%A1%E7%90%86-%E5%8F%98%E6%9B%B4%E6%B5%81%E7%A8%8B%E5%9B%BE.png)

项目管理-评审管理-新建评审
![输入图片说明](images/20-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E8%AF%84%E5%AE%A1%E7%AE%A1%E7%90%86-%E6%96%B0%E5%BB%BA%E8%AF%84%E5%AE%A1.png)

项目管理-评审管理-评审详情
![输入图片说明](images/21-%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86-%E8%AF%84%E5%AE%A1%E7%AE%A1%E7%90%86-%E8%AF%84%E5%AE%A1%E8%AF%A6%E6%83%85.png)

测试管理-测试计划-执行测试
![输入图片说明](images/22-%E6%B5%8B%E8%AF%95%E7%AE%A1%E7%90%86-%E6%B5%8B%E8%AF%95%E8%AE%A1%E5%88%92-%E6%89%A7%E8%A1%8C%E6%B5%8B%E8%AF%95.png)

测试管理-测试计划-测试报告
![输入图片说明](images/23-%E6%B5%8B%E8%AF%95%E7%AE%A1%E7%90%86-%E6%B5%8B%E8%AF%95%E8%AE%A1%E5%88%92-%E6%B5%8B%E8%AF%95%E6%8A%A5%E5%91%8A.png)

业务中台-业务实体-添加实体模块
![输入图片说明](images/24-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E5%AE%9E%E4%BD%93-%E6%B7%BB%E5%8A%A0%E5%AE%9E%E4%BD%93%E6%A8%A1%E5%9D%97.png)

业务中台-业务实体-业务实体配置
![输入图片说明](images/25-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E5%AE%9E%E4%BD%93-%E4%B8%9A%E5%8A%A1%E5%AE%9E%E4%BD%93%E9%85%8D%E7%BD%AE.png)

业务中台-业务实体-页面配置
![输入图片说明](images/26-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E5%AE%9E%E4%BD%93-%E9%A1%B5%E9%9D%A2%E9%85%8D%E7%BD%AE.png)

业务中台-业务流程-添加流程模块
![输入图片说明](images/27-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E6%B5%81%E7%A8%8B-%E6%B7%BB%E5%8A%A0%E6%B5%81%E7%A8%8B%E6%A8%A1%E5%9D%97.png)

业务中台-业务流程-流转图配置
![输入图片说明](images/28-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E6%B5%81%E7%A8%8B-%E6%B5%81%E8%BD%AC%E5%9B%BE%E9%85%8D%E7%BD%AE.png)

业务中台-业务流程-流转图检测
![输入图片说明](images/29-%E4%B8%9A%E5%8A%A1%E4%B8%AD%E5%8F%B0-%E4%B8%9A%E5%8A%A1%E6%B5%81%E7%A8%8B-%E6%B5%81%E8%BD%AC%E5%9B%BE%E6%A3%80%E6%B5%8B.png)

主题风格设置
![输入图片说明](images/31-%E4%B8%BB%E9%A2%98%E9%A3%8E%E6%A0%BC%E8%AE%BE%E7%BD%AE.png)

## 源码工程结构

```
eywe-admin-new/              # 本仓库（开发源码）
├── images/preview/          # README 界面预览演示图
├── bin/package.bat          # 后端一键打包
├── customer-extend/           # 前端二次开发扩展工程
│   └── bin/package.bat      # 扩展包一键打包
├── eywe-admin/                # 启动模块（Web 入口）
├── eywe-framework/            # 核心框架
├── eywe-system/               # 系统管理
├── eywe-business/             # 业务模块
├── eywe-entity/               # 实体模型
├── eywe-common/               # 通用工具
├── eywe-generator/            # 代码生成
├── eywe-quartz/               # 定时任务
├── eywe-ui/                   # 主前端（Vue 3 + Vite）
├── sql/                       # 数据库脚本
├── eywe-start.bat / .sh       # 运行包启动脚本
└── pom.xml
```

## 安装目录结构

安装包解压后的运行目录（与源码仓库分离，例如 `C:\Program Files\Eywe2\eywe` 或桌面 `eywe2\eywe`）大致如下：

```
eywe/                        # 安装根目录
├── bin/                     # 启停脚本（仅运行维护，无打包脚本）
│   ├── eywe-start.bat     # Windows 启动
│   ├── eywe-start.sh      # Linux 启动
│   ├── eywe-stop.bat      # Windows 停止
│   └── eywe-stop.sh       # Linux 停止
├── environment/             # 内置 JDK、Nginx、Redis 等
├── eyweApp/                 # 应用运行目录（后端 + 前端静态资源）
│   ├── eywe-admin.jar       # 后端瘦包入口
│   ├── lib/                 # 后端依赖库
│   ├── uploadPath/          # 上传文件目录
│   └── eywe-ui/             # 前端静态站点
│       ├── index.html       # 主程序入口
│       ├── assets/          # 主程序资源
│       ├── images/          # 静态图片
│       └── customer/        # 二次开发扩展包（独立子应用）
│           ├── index.html
│           ├── assets/
│           └── README.txt
├── logs/                    # 运行日志
└── resources/               # 外部配置（application.yml 等）
```

> **说明**  
> - `customer` 为扩展子目录，部署扩展包时只覆盖 `eywe-ui\customer`，不要替换整个 `eywe-ui` 根目录。  
> - **`package.bat` 等打包脚本仅在源码仓库**（`eywe-admin-new/bin`、`customer-extend/bin` 等），安装目录的 `bin/` 只有启停脚本。

## 快速开始

### 环境要求

- JDK 1.8+
- Maven 3.6+
- Node.js 18+（前端开发）
- MySQL 5.7+ / 8.0+
- Redis

### 数据库

按顺序执行 `sql/` 目录下脚本（具体以部署文档为准）：

1. `1-base-pre.sql`
2. `2-base-post.sql`
3. `3-base-to-entity-pre.sql`
4. `4-base-to-entity-post.sql`
5. `5-entity-to-workflow-pre.sql`

### 后端开发

```bash
# 在项目根目录
mvn clean install -DskipTests
cd eywe-admin
mvn spring-boot:run
```

### 前端开发

```bash
cd eywe-ui
npm install
npm run dev
```

### 打包与更新（安装包）

以下步骤在**已安装的 `eywe` 运行目录**上更新程序，源码在 `eywe-admin-new` 仓库中开发打包。

#### 1. 后端更新

1. 在源码仓库双击或执行 **`bin/package.bat`**（内部执行 `mvn clean package -Dmaven.test.skip=true`）。
2. 打包产物位于：
   ```
   eywe-admin/target/eywe-admin-distribution/eyweApp/
   ├── eywe-admin.jar
   └── lib/
   ```
3. 将上述 **`lib` 文件夹** 与 **`eywe-admin.jar`** 复制到安装目录，**替换**：
   ```
   eywe/eyweApp/lib/
   eywe/eyweApp/eywe-admin.jar
   ```
4. 若 `resources` 有配置变更，可同时对比并更新 `eywe/resources/`（按需）。
5. 在 `eywe/bin/` 下先执行 `eywe-stop`，再执行 `eywe-start` 重启服务。

#### 2. 前端二次开发扩展包更新

扩展工程在 **`customer-extend/`**，与主程序 `eywe-ui` 分离部署。

1. 执行 **`customer-extend/bin/package.bat`**（需 Node.js；首次会自动 `npm install`）。
2. 打包产物位于 **`customer-extend/dist/`**（含 `index.html`、`assets/`、`README.txt`）。
3. 将 `dist` 内**全部文件**复制到安装目录：
   ```
   eywe/eyweApp/eywe-ui/customer/
   ```
   覆盖该目录下原有文件即可，**勿**替换 `eywe-ui` 根目录下的主程序文件。

可选：设置环境变量 `EYWE_WEB_ROOT` 指向 `eywe/eyweApp/eywe-ui`，打包脚本会自动复制到 `customer` 子目录。

#### 3. 主前端更新（可选）

主界面在 **`eywe-ui/`** 工程：

1. 执行 **`eywe-ui/bin/package.bat`** 或 `cd eywe-ui && npm run build`。
2. 将 `eywe-ui/dist/` 内文件复制到 **`eywe/eyweApp/eywe-ui/`** 根目录（同样不要动 `customer` 子目录，除非同时更新了扩展包）。

   > 向码云上传时，请同时包含仓库根目录的 **`README.md`** 与 **`images/preview/`**，以便仓库首页预览图正常显示。

#### 4. 启动服务

在安装目录的 **`eywe/bin/`** 下执行启停脚本（会按需启动 Nginx、Redis 与后端 `eywe-admin.jar`）：

```bash
# Windows（安装目录 eywe/bin/）
eywe-start.bat
eywe-stop.bat

# Linux
chmod +x eywe-start.sh eywe-stop.sh
./eywe-start.sh
./eywe-stop.sh
```

## 在线体验

- 演示地址：[http://www.cseywe.com:90](http://www.cseywe.com:90)  
- 演示账号：`Eywe` / `123456`  
- QQ 交流群：**960994897**（问题反馈、使用交流）

本地开发环境账号密码以实际 `sql` 初始化数据为准。

## 参与贡献

欢迎提交 Issue、Pull Request，或向 [Gitee 主仓](https://gitee.com/eywe-butler/eywe) 贡献代码：

1. Fork 本仓库或从主仓拉取最新代码。  
2. 基于 `main` / `master` 新建功能分支进行开发（建议遵循现有代码风格与提交规范）。  
3. 本地验证通过后提交 Pull Request，并简要说明改动内容与测试情况。  

### 致谢

Eywe 在架构与界面实现上受益于以下优秀开源项目，特此感谢：

| 项目 | 说明 |
| --- | --- |
| [若依（RuoYi）](https://gitee.com/y_project/RuoYi) | 提供了成熟的后台管理框架与前后端分离实践，为本项目基础能力带来重要参考。 |
| [Element UI](https://element.eleme.io/) | 优秀的 Vue 组件库；本项目前端基于 [Element Plus](https://element-plus.org/)（Element UI 的 Vue 3 继任版本）构建界面。 |

## 开源协议

本项目采用 [MIT License](LICENSE) 开源协议，个人与企业均可免费使用、修改与二次分发。使用或分发时，请保留原版权声明及许可文件。

---

<p align="center">Copyright © 易为软件 · <a href="http://www.cseywe.com">www.cseywe.com</a></p>
