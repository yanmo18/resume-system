<!DOCTYPE html>
<html lang="zh-CN"> <!-- 改为中文更适配简历场景 -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人简历</title>
    <!-- 引入外部CSS，此处直接内嵌简化部署，也可单独拆分为styles.css -->
    <style>
        /* 全局样式重置与基础配置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", "PingFang SC", sans-serif; /* 适配中文显示 */
        }

        body {
            background-color: #f5f7fa; /* 柔和背景色 */
            color: #333; /* 主文本色 */
            line-height: 1.6; /* 行高提升可读性 */
            padding: 20px 0;
        }

        .container {
            max-width: 900px; /* 限制最大宽度，避免大屏拉伸 */
            margin: 0 auto; /* 居中显示 */
            background-color: #fff; /* 白色主体背景 */
            padding: 40px;
            border-radius: 12px; /* 圆角设计 */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08); /* 柔和阴影 */
        }

        /* 标题样式 */
        h1 {
            color: #2c3e50; /* 深灰蓝色主标题 */
            text-align: center; /* 居中 */
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #3498db; /* 下划线装饰 */
        }

        h2 {
            color: #3498db; /* 蓝色二级标题 */
            margin: 25px 0 15px;
            font-size: 1.25rem;
            position: relative;
            padding-left: 10px;
        }

        h2::before {
            content: ""; /* 左侧小竖线装饰 */
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 20px;
            background-color: #3498db;
            border-radius: 2px;
        }

        /* 基本信息模块 */
        .basic-info {
            display: flex; /* 头像与信息横向排列 */
            align-items: center;
            gap: 30px;
            margin-bottom: 20px;
            flex-wrap: wrap; /* 小屏自动换行 */
        }

        .avatar {
            flex-shrink: 0; /* 头像不收缩 */
        }

        .avatar img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid #eef2f7; /* 头像边框 */
            object-fit: cover; /* 图片自适应 */
            transition: transform 0.3s ease; /* hover动画 */
        }

        .avatar img:hover {
            transform: scale(1.05); /* 轻微放大 */
        }

        .info-content p {
            margin: 8px 0;
            font-size: 1rem;
        }

        .info-content strong {
            color: #2c3e50;
            width: 80px;
            display: inline-block; /* 标签宽度固定，对齐更整齐 */
        }

        /* 技能、项目列表样式 */
        ul {
            list-style: none; /* 去掉默认列表样式 */
            padding-left: 10px;
        }

        .skills-list li,
        .projects-list li {
            padding: 12px 15px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #3498db; /* 左侧彩色边框 */
            transition: box-shadow 0.3s ease;
        }

        .skills-list li:hover,
        .projects-list li:hover {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
        }

        .projects-list li {
            padding: 20px;
        }

        .projects-list li strong {
            font-size: 1.1rem;
            color: #2c3e50;
        }

        .projects-list li p {
            margin: 8px 0;
        }

        /* 链接与按钮样式 */
        a {
            color: #3498db;
            text-decoration: none; /* 去掉下划线 */
            transition: color 0.3s ease;
        }

        a:hover {
            color: #2980b9; /* 深色hover */
            text-decoration: underline;
        }

        .btn-edit {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff !important; /* 覆盖链接色 */
            border-radius: 6px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            text-decoration: none !important;
        }

        .btn-edit:hover {
            background-color: #2980b9;
            box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
        }

        /* 响应式适配（手机端） */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .basic-info {
                flex-direction: column; /* 头像与信息纵向排列 */
                align-items: center;
                text-align: center;
            }

            .info-content strong {
                display: block; /* 标签独占一行 */
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>个人简历</h1>

    <!-- 基本信息模块（重构布局，头像与信息横向排列） -->
    <h2>基本信息</h2>
    <div class="basic-info">
        <div class="avatar">
            <img src="<#if user?exists && user.avatar?has_content && user.avatar != 'null'>${user.avatar}<#else>/avatars/001.jpg</#if>"
                 alt="用户头像">
        </div>
        <div class="info-content">
            <p><strong>姓名:</strong> ${user.name}</p>
            <p><strong>学校:</strong> ${user.school}</p>
            <p><strong>专业:</strong> ${user.major}</p>
            <p><strong>电话:</strong> ${user.phone}</p>
            <p><strong>邮箱:</strong> ${user.email}</p>
            <p><strong>应聘岗位:</strong> ${user.position!}</p>
            <p><strong>自我介绍:</strong> ${user.introduction}</p>
        </div>
    </div>

    <!-- 技能模块 -->
    <h2>技能</h2>
    <ul class="skills-list">
        <#list skills as skill>
            <li>${skill.skillName} - ${skill.skillLevel}</li>
        </#list>
    </ul>

    <!-- 项目经历模块 -->
    <h2>项目经历</h2>
    <ul class="projects-list">
        <#list projects as project>
            <li>
                <strong>${project.projectName}</strong><br>
                <p>${project.projectDescription}</p>
                <p><strong>技术栈:</strong> ${project.techStack}</p>
                <p><strong>角色:</strong> ${project.role}</p>
                <a href="https://github.com/yanmo18" target="_blank">查看 GitHub 项目</a>
            </li>
        </#list>
    </ul>

    <!-- 编辑按钮 -->
    <p><a href="/resume/edit/${user.id}" class="btn-edit">编辑简历</a></p>
</div>
</body>
</html>