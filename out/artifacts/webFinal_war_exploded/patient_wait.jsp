<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="zh-CN">

<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     * @update 2025-5-29 01:03:25 修改默认时间选择保证有数据展示 数据库增加数据 mortyLee
     */
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>患者等待时间分析</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }

            .card-shadow {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            }

            .transition-custom {
                transition: all 0.3s ease;
            }
        }
    </style>
</head>
<body class="bg-neutral-100 font-inter text-neutral-800 min-h-screen">
<header class="bg-white shadow-md fixed top-0 left-0 right-0 z-10">
    <div class="container mx-auto px-4 py-3 flex justify-between items-center">
        <div class="flex items-center space-x-2">
            <i class="fa fa-clock text-primary text-2xl"></i>
            <h1 class="text-xl font-bold text-neutral-800">患者等待时间分析</h1>
        </div>
        <nav>
            <ul class="flex space-x-6">
                <li><a href="dept_analysis.jsp"
                       class="text-neutral-600 hover:text-primary transition-custom">科室统计</a></li>
                <li><a href="peak_analysis_page.jsp" class="text-neutral-600 hover:text-primary transition-custom">就诊高峰期分析</a>
                </li>
                <li><a href="patient_wait.jsp" class="text-primary font-medium hover:text-primary/80 transition-custom">等待时间分析</a>
                </li>
            </ul>
        </nav>
    </div>
</header>


<main class="container mx-auto px-4 pt-24 pb-12">
    <div class="mb-8 bg-white rounded-lg p-6 card-shadow">
        <h2 class="text-2xl font-bold text-neutral-800 mb-6">患者等待时间查询</h2>

        <form id="waitAnalysisForm" class="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div class="space-y-2">
                <label for="startDate" class="block text-sm font-medium text-neutral-700">开始日期</label>
                <input type="date" id="startDate" name="startDate" value="2025-04-01"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="endDate" class="block text-sm font-medium text-neutral-700">结束日期</label>
                <input type="date" id="endDate" name="endDate" value="2025-08-30"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="department" class="block text-sm font-medium text-neutral-700">科室选择</label>
                <select id="department" name="department"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="0">全部科室</option>
                </select>
            </div>
            <div class="space-y-2 md:col-span-4">
                <label for="timeUnit" class="block text-sm font-medium text-neutral-700">统计单位</label>
                <select id="timeUnit" name="timeUnit"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="day">按日</option>
                    <option value="hour">按小时</option>
                    <option value="week">按周</option>
                </select>
            </div>
            <div class="md:col-span-4 flex justify-end mt-2">
                <button type="button" onclick="analyzeWaitTime()"
                        class="px-6 py-2 bg-primary text-white rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:ring-offset-2 transition-custom shadow-md hover:shadow-lg">
                    <i class="fa fa-search mr-2"></i> 查询分析
                </button>
            </div>
        </form>
    </div>

    <div id="errorMessage" class="py-10 text-center text-neutral-500 hidden">
        <i class="fa fa-exclamation-triangle text-4xl mb-3 text-red-400"></i>
        <div id="errorText"></div>
    </div>

    <div id="loading" class="patient-wait-card p-6 hidden">
        <div class="flex items-center space-x-4">
            <div class="w-12 h-12 border-4 border-primary-200 border-t-primary animate-spin rounded-full"></div>
            <p class="text-neutral-600">正在加载数据，请稍候...</p>
        </div>
    </div>

    <div id="analysisResult" class="patient-wait-card p-6 hidden"> <!-- 结果区域 -->
        <div id="chartContainer" class="mb-8 bg-white rounded-lg p-6 card-shadow">
            <h3 class="text-xl font-bold text-neutral-800 mb-4">等待时间趋势</h3>
            <div class="relative h-80">
                <div id="chartLoading"
                     class="absolute inset-0 flex items-center justify-center bg-white/80 z-10 hidden">
                    <div class="flex flex-col items-center">
                        <div class="w-12 h-12 border-4 border-primary/30 border-t-primary rounded-md animate-spin mb-3"></div>
                        <p class="text-neutral-600">正在生成图表...</p>
                    </div>
                </div>
                <canvas id="waitTimeChart"></canvas>
            </div>
        </div>

        <div class="bg-white rounded-lg p-6 card-shadow">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-bold text-neutral-800">等待时间详情</h3>
                <div id="totalCount" class="text-sm text-neutral-600"></div>
            </div>

            <div id="noData" class="py-10 text-center text-neutral-500 hidden">
                <i class="fa fa-inbox text-4xl mb-3 text-neutral-400"></i>
                <p>暂无数据，请调整查询条件后重试</p>
            </div>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-neutral-200">
                    <thead class="bg-neutral-50">
                    <tr>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            时间段
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">科室
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-right text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            患者数
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-right text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            平均等待时间
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-right text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            最长等待时间
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-right text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            最短等待时间
                        </th>
                    </tr>
                    </thead>
                    <tbody id="waitTimeTable"></tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<footer class="bg-white border-t border-neutral-200 py-6">
    <div class="container mx-auto px-4 text-center text-neutral-500 text-sm">
        <p>© 2025 医院科室统计分析系统 | 技术支持: 信息科</p>
    </div>
</footer>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    primary: '#165DFF',
                },
            },
        },
    };
    console.log('当前上下文路径:', '<%= request.getContextPath() %>');

    // 确保 analyzeWaitTime 函数在全局作用域中定义
    function analyzeWaitTime() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        // 添加日期验证
        if (!startDate || !endDate) {
            showError('参数错误', '请选择开始日期和结束日期');
            return;
        }

        if (new Date(startDate) > new Date(endDate)) {
            showError('日期错误', '开始日期不能晚于结束日期');
            return;
        }

        const form = document.getElementById('waitAnalysisForm');
        if (!form) {
            showError('表单未找到', '请检查页面结构');
            return;
        }

        const contextPath = '<%= request.getContextPath() %>';
        showLoading();

        fetch(`${contextPath}/patient_wait_api.jsp`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams(new FormData(form)).toString(),
        })
            .then(response => {
                if (!response.ok) throw new Error(`HTTP错误：${response.status}`);
                return response.json();
            })
            .then(data => {
                hideLoading();

                // 打印接收到的数据结构用于调试
                console.log('接收到的数据:', data);

                // 更详细的错误检查
                if (data.error) {
                    throw new Error(data.error);
                }

                document.getElementById('analysisResult').classList.remove('hidden');
                renderTable(data.data);
                updateChart(data.data);
            })
            .catch(error => {
                hideLoading();
                showError('查询失败', error.message);
                console.error('请求失败:', error);
            });
    }

    let waitTimeChart = null;

    document.addEventListener('DOMContentLoaded', () => {
        initChart();
        loadDepartments();
    });

    function initChart() {
        const ctx = document.getElementById('waitTimeChart').getContext('2d');
        waitTimeChart = new Chart(ctx, {
            type: 'line',
            data: {labels: [], datasets: []},
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {display: true, text: '等待时间（分钟）'}
                    },
                    x: {
                        title: {display: true, text: '时间单位'}
                    },
                },
                plugins: {
                    legend: {position: 'top'},
                    tooltip: {mode: 'index', intersect: false},
                },
            },
        });
    }

    function loadDepartments() {
        const contextPath = '<%= request.getContextPath() %>';
        fetch(`${contextPath}/departments.jsp`)
            .then(response => response.json())
            .then(data => {
                const select = document.getElementById('department');
                select.innerHTML = '<option value="0">全部科室</option>';
                data.data.forEach(dept => {
                    select.innerHTML += `<option value="${dept.id}">${dept.name}</option>`;
                });
            })
            .catch(error => {
                console.error('加载科室失败:', error);
                select.innerHTML = `
                    <option value="0">全部科室</option>
                    <option value="1">内科</option>
                    <option value="2">外科</option>
                    <option value="3">儿科</option>
                `;
            });
    }

    // 修改后的renderTable函数，处理空数据
    function renderTable(data) {
        const tbody = document.getElementById('waitTimeTable');
        tbody.innerHTML = ''; // 清空表格内容

        // 检查数据是否为空
        if (!Array.isArray(data) || data.length === 0) {
            document.getElementById('noData').classList.remove('hidden');
            document.getElementById('totalCount').textContent = '0 条记录';
            return;
        }

        // 遍历数据并填充表格
        data.forEach(item => {
            const tr = document.createElement('tr');
            tr.className = 'hover:bg-gray-50';
            tr.innerHTML = `
                <td class="px-6 py-4">${item.timePeriod || '-'}</td>
                <td class="px-6 py-4">${item.deptName || '所有科室'}</td>
                <td class="px-6 py-4 text-right">${item.totalPatients || 0}</td>
                <td class="px-6 py-4 text-right">${item.averageWaitTime || '0分钟'}</td>
                <td class="px-6 py-4 text-right">${item.maxWaitTime || '0分钟'}</td>
                <td class="px-6 py-4 text-right">${item.minWaitTime || '0分钟'}</td>
            `;
            tbody.appendChild(tr);
        });

        document.getElementById('totalCount').textContent = `共 ${data.length} 条记录`;
        document.getElementById('noData').classList.add('hidden');
    }

    function updateChart(data) {
        if (waitTimeChart) waitTimeChart.destroy();

        const ctx = document.getElementById('waitTimeChart').getContext('2d');
        const timeUnit = document.getElementById('timeUnit').value;

        // 处理空数据情况
        if (!data || !Array.isArray(data) || data.length === 0) {
            waitTimeChart = new Chart(ctx, {
                type: 'line',
                data: {labels: [], datasets: []},
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {beginAtZero: true},
                        x: {title: {display: true, text: '时间单位'}}
                    },
                    plugins: {
                        legend: {position: 'top'},
                        tooltip: {mode: 'index', intersect: false}
                    }
                }
            });
            return;
        }

        // 过滤无效数据
        const validData = data.filter(function (item) {
            return item !== null && item.timePeriod !== null;
        });

        if (validData.length === 0) {
            waitTimeChart = new Chart(ctx, {
                type: 'line',
                data: {labels: [], datasets: []},
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {beginAtZero: true},
                        x: {title: {display: true, text: '时间单位'}}
                    },
                    plugins: {
                        legend: {position: 'top'},
                        tooltip: {mode: 'index', intersect: false}
                    }
                }
            });
            return;
        }

        // 提取时间段
        const labels = [...new Set(validData.map(function (item) {
            return item.timePeriod;
        }))].sort();

        // 按科室分组
        const deptGroups = validData.reduce(function (acc, item) {
            const deptName = item.deptName || '所有科室';
            if (!acc[deptName]) acc[deptName] = [];
            acc[deptName].push(item);
            return acc;
        }, {});

        const colors = ['#4A90E2', '#50E3C2', '#F5A623', '#7ED321', '#BD10E0'];
        const datasets = [];

        Object.keys(deptGroups).forEach(function (deptName, index) {
            const values = labels.map(function (label) {
                const item = deptGroups[deptName].find(function (d) {
                    return d.timePeriod === label;
                });
                // 解析平均等待时间（字符串格式如 "10 分钟"）
                if (item && item.averageWaitTime) {
                    const match = item.averageWaitTime.match(/(\d+(\.\d+)?)/);
                    return match ? parseFloat(match[0]) : 0;
                }
                return 0;
            });

            datasets.push({
                label: deptName,
                data: values,
                backgroundColor: `${colors[index % colors.length]}20`,
                borderColor: colors[index % colors.length],
                borderWidth: 1,
                tension: 0.4,
            });
        });

        waitTimeChart = new Chart(ctx, {
            type: 'line',
            data: {labels, datasets},
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: timeUnit === 'week' ? '周次' : (timeUnit === 'day' ? '日期' : '小时')
                        },
                        ticks: {autoSkip: true, maxRotation: 45}
                    },
                    y: {
                        title: {display: true, text: '平均等待时间（分钟）'},
                        beginAtZero: true,
                        ticks: {
                            callback: function (value) {
                                return value + ' 分钟';
                            }
                        }
                    }
                },
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                return context.dataset.label + ': ' + context.parsed.y + ' 分钟';
                            }
                        }
                    }
                }
            }
        });
    }

    // 辅助函数
    function showLoading() {
        document.getElementById('loading').classList.remove('hidden');
        document.getElementById('analysisResult').classList.add('hidden');
        document.getElementById('errorMessage').classList.add('hidden');
    }

    function hideLoading() {
        document.getElementById('loading').classList.add('hidden');
    }

    function showError(title, message) {
        const errorDiv = document.getElementById('errorMessage');
        const errorText = document.getElementById('errorText');
        errorText.innerHTML = `<strong>${title}</strong><br>${message}`;
        errorDiv.classList.remove('hidden');
        document.getElementById('analysisResult').classList.add('hidden');
    }
</script>
</body>
</html>