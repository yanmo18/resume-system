<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑简历</title>
    <!-- 优先加载外部CSS，缺失时使用内联样式兜底 -->
    <link rel="stylesheet" href="/static/css/styles.css">
    <style>
        /* 全局样式重置与基础配置 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            transition: all 0.3s ease; /* 全局过渡动画 */
        }

        body {
            font-family: "Microsoft Yahei", "PingFang SC", sans-serif;
            background-color: #f5f7fa; /* 更柔和的背景色 */
            color: #333;
            line-height: 1.6;
            padding: 20px 0;
        }

        /* 容器样式 */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 40px;
            background: white;
            border-radius: 12px; /* 更大的圆角，更现代 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); /* 柔和的阴影 */
        }

        /* 标题样式 */
        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: #2d3748; /* 深中性色 */
            font-size: 1.8rem;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: #4299e1; /* 主色调：柔和蓝 */
            border-radius: 3px;
        }

        /* 表单基础样式 */
        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #4a5568; /* 中中性色 */
            font-size: 0.95rem;
        }

        input, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e2e8f0; /* 更浅的边框色 */
            border-radius: 8px; /* 圆角优化 */
            font-size: 14px;
            font-family: inherit;
            background-color: #ffffff;
            outline: none;
        }

        input:focus, textarea:focus {
            border-color: #4299e1; /* 焦点时边框变主色调 */
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.1); /* 焦点阴影，提升层次感 */
        }

        textarea {
            min-height: 120px;
            resize: vertical;
            line-height: 1.5;
        }

        /* 头像上传样式（升级） */
        .avatar-upload {
            padding: 25px;
            border: 2px dashed #e2e8f0; /* 更粗的虚线 */
            border-radius: 12px;
            margin-bottom: 30px;
            text-align: center; /* 内容居中 */
            background-color: #fafafa;
        }

        .avatar-upload:hover {
            border-color: #4299e1; /* hover时边框变主色调 */
            background-color: #f8fafc;
        }

        .avatar-preview {
            margin: 15px 0;
        }

        .avatar-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #ffffff; /* 白色边框，更立体 */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 头像阴影 */
        }

        .avatar-input {
            margin-top: 15px;
            /* 自定义文件输入框样式 */
        }

        /* 隐藏原生文件输入框，用按钮替代（优化交互） */
        .avatar-input {
            position: relative;
            display: inline-block;
            padding: 8px 16px;
            cursor: pointer;
            background-color: #e2e8f0;
            border-radius: 6px;
            color: #4a5568;
            font-size: 14px;
        }

        .avatar-input input {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .avatar-input:hover {
            background-color: #cbd5e1;
            color: #2d3748;
        }

        /* 按钮样式（升级） */
        .button-group {
            margin-top: 35px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap; /* 小屏自动换行 */
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex: 1; /* 按钮平分宽度 */
            min-width: 120px; /* 最小宽度，避免过窄 */
        }

        .btn-primary {
            background-color: #4299e1; /* 主色调：柔和蓝 */
            color: white;
        }

        .btn-primary:hover {
            background-color: #3182ce; /* 加深的主色调 */
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.2); /* hover阴影 */
        }

        /* 加载状态的按钮样式 */
        .btn-primary.loading {
            background-color: #90cdf4;
            cursor: not-allowed;
        }

        .btn-back {
            background-color: #718096; /* 中性灰 */
            color: white;
        }

        .btn-back:hover {
            background-color: #4a5568; /* 加深的中性灰 */
            box-shadow: 0 4px 12px rgba(113, 128, 150, 0.2);
        }

        /* 提示信息样式（升级） */
        .upload-msg {
            margin-top: 12px;
            color: #e53e3e; /* 错误色：红色 */
            font-size: 13px;
            height: 16px; /* 固定高度，避免布局跳动 */
        }

        /* 成功/错误提示的通用样式 */
        .msg-success {
            color: #48bb78 !important; /* 成功色：绿色 */
        }

        /* 响应式适配（手机端） */
        @media (max-width: 768px) {
            .container {
                max-width: 95%;
                margin: 20px auto;
                padding: 25px;
            }

            h1 {
                font-size: 1.5rem;
                margin-bottom: 30px;
            }

            .avatar-img {
                width: 120px;
                height: 120px;
            }

            .button-group {
                flex-direction: column; /* 按钮纵向排列 */
            }

            .btn {
                width: 100%; /* 按钮占满宽度 */
            }
        }

        /* 加载动画样式 */
        .loader {
            width: 16px;
            height: 16px;
            border: 2px solid #ffffff;
            border-bottom-color: transparent;
            border-radius: 50%;
            animation: loader-rotate 1s linear infinite;
            margin-right: 8px;
        }

        @keyframes loader-rotate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>编辑简历</h1>

    <!-- 合并表单：包含所有字段 + 头像上传，支持文件提交 -->
    <form id="resumeForm" enctype="multipart/form-data">
        <!-- 隐藏域：用户ID/简历ID（FreeMarker空值保护） -->
        <input type="hidden" id="userId" value="${user.id!}" />
        <input type="hidden" name="id" value="${user.id!}" />

        <!-- 头像上传区域 -->
        <div class="form-group avatar-upload">
            <label style="display: block; margin-bottom: 15px; font-size: 1rem;">头像设置</label>
            <div class="avatar-preview">
                <!-- FreeMarker空值保护：确保路径正确 -->
                <img id="avatarImg" class="avatar-img"
                     src="<#if user?exists && user.avatar?has_content && user.avatar != 'null'>${user.avatar}<#else>/avatars/001.jpg</#if>"
                     alt="用户头像">
                <!-- 存储原始头像地址，用于取消选择时恢复 -->
                <input type="hidden" id="originalAvatarSrc"
                       value="<#if user?exists && user.avatar?has_content && user.avatar != 'null'>${user.avatar}<#else>/avatars/001.jpg</#if>">
            </div>
            <!-- 自定义文件上传按钮 -->
            <div class="avatar-input">
                <span>选择头像图片</span>
                <input type="file" id="avatarFile" name="avatarFile" accept="image/*">
            </div>
            <div id="uploadMsg" class="upload-msg"></div>
        </div>

        <!-- 完整基本信息字段 -->
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" id="name" name="name" value="${user.name!}" required>
        </div>

        <div class="form-group">
            <label for="school">学校</label>
            <input type="text" id="school" name="school" value="${user.school!}" required>
        </div>

        <div class="form-group">
            <label for="major">专业</label>
            <input type="text" id="major" name="major" value="${user.major!}" required>
        </div>

        <div class="form-group">
            <label for="phone">电话</label>
            <input type="text" id="phone" name="phone" value="${user.phone!}" required>
        </div>

        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" id="email" name="email" value="${user.email!}" required>
        </div>

        <div class="form-group">
            <label for="position">应聘职位</label>
            <input type="text" id="position" name="position" value="${user.position!}" required>
        </div>

        <div class="form-group">
            <label for="introduction">自我介绍</label>
            <textarea id="introduction" name="introduction" required>${user.introduction!}</textarea>
        </div>

        <!-- 功能按钮组 -->
        <div class="button-group">
            <button type="submit" class="btn btn-primary" id="submitBtn">
                <span>保存简历</span>
            </button>
            <a href="/resume/${user.id!}" class="btn btn-back">返回简历</a>
        </div>
    </form>
</div>

<script>
    // 获取页面中的用户ID（解决JS中FreeMarker变量解析问题）
    const userId = document.getElementById('userId').value;
    const submitBtn = document.getElementById('submitBtn');
    const uploadMsg = document.getElementById('uploadMsg');

    // 表单提交：同步提交所有字段 + 头像文件
    document.getElementById('resumeForm').addEventListener('submit', function(e) {
        e.preventDefault(); // 阻止默认表单提交
        const formData = new FormData(this);

        // 清空历史提示
        uploadMsg.textContent = '';
        uploadMsg.classList.remove('msg-success');

        // 设置按钮加载状态
        submitBtn.classList.add('loading');
        submitBtn.innerHTML = '<div class="loader"></div><span>保存中...</span>';
        submitBtn.disabled = true;

        // 提交表单
        fetch('/resume/update/' + userId, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest' // 标识AJAX请求
            }
        })
            .then(response => {
                if (response.redirected) {
                    window.location.href = response.url;
                    return;
                }
                if (!response.ok) throw new Error('请求失败（状态码：' + response.status + '）');
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    uploadMsg.textContent = '保存成功！';
                    uploadMsg.classList.add('msg-success');
                    setTimeout(() => {
                        window.location.href = '/resume/' + userId;
                    }, 1000); // 延迟1秒跳转，让用户看到成功提示
                } else {
                    uploadMsg.textContent = data.msg || '保存失败，请重试';
                }
            })
            .catch(error => {
                console.error('提交失败：', error);
                uploadMsg.textContent = '保存失败，网络错误';
            })
            .finally(() => {
                // 恢复按钮状态
                submitBtn.classList.remove('loading');
                submitBtn.innerHTML = '<span>保存简历</span>';
                submitBtn.disabled = false;
            });
    });

    // 头像预览：选择文件后即时显示（优化版）
    document.getElementById('avatarFile').addEventListener('change', function(e) {
        const file = e.target.files[0];
        const avatarImg = document.getElementById('avatarImg');
        const originalAvatarSrc = document.getElementById('originalAvatarSrc').value;

        if (!file) {
            // 未选择文件，恢复原始头像
            avatarImg.src = originalAvatarSrc;
            return;
        }

        // 校验文件类型（仅允许图片）
        if (!file.type.startsWith('image/')) {
            uploadMsg.textContent = '请选择图片格式的文件（JPG/PNG等）！';
            e.target.value = ''; // 清空错误选择
            avatarImg.src = originalAvatarSrc;
            return;
        }

        // 校验文件大小（限制5MB以内）
        const maxSize = 5 * 1024 * 1024; // 5MB
        if (file.size > maxSize) {
            uploadMsg.textContent = '图片大小不能超过5MB！';
            e.target.value = '';
            avatarImg.src = originalAvatarSrc;
            return;
        }

        // 清空错误提示
        uploadMsg.textContent = '';

        // 预览新图片（强制替换，确保即时显示）
        const reader = new FileReader();
        reader.onload = function(event) {
            // 添加淡入动画效果
            avatarImg.style.opacity = '0';
            setTimeout(() => {
                avatarImg.src = event.target.result;
                avatarImg.style.opacity = '1';
            }, 100);
        };
        reader.readAsDataURL(file);
    });
</script>
</body>
</html>