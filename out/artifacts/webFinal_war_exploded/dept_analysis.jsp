<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="zh-CN">


<%
    /**
     * @author zyh
     * @since 2025-5-29 00:31:12
     */
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>科室统计分析</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>

    <style type="text/tailwindcss">
        @layer utilities {
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
            <i class="fa fa-hospital text-primary text-2xl"></i>
            <h1 class="text-xl font-bold text-neutral-800">医院科室统计分析系统</h1>
        </div>
        <nav>
            <ul class="flex space-x-6">
                <li><a href="#" class="text-primary font-medium hover:text-primary/80 transition-custom">科室统计</a>
                </li>
                <li><a href="peak_analysis_page.jsp" class="text-neutral-600 hover:text-primary transition-custom">就诊高峰期分析</a>
                </li>
                <li><a href="patient_wait.jsp"
                       class="text-neutral-600 hover:text-primary transition-custom">患者等待时间分析</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="container mx-auto px-4 pt-24 pb-12">
    <div class="mb-8 bg-white rounded-lg p-6 card-shadow">
        <h2 class="text-2xl font-bold text-neutral-800 mb-6">科室统计查询</h2>

        <form id="searchForm" class="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div class="space-y-2">
                <label for="startDate" class="block text-sm font-medium text-neutral-700">开始日期</label>
                <input type="date" id="startDate" name="startDate" value="2025-05-30"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="endDate" class="block text-sm font-medium text-neutral-700">结束日期</label>
                <input type="date" id="endDate" name="endDate" value="2025-06-30"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="timeUnit" class="block text-sm font-medium text-neutral-700">统计单位</label>
                <select id="timeUnit" name="timeUnit"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="day">按日统计</option>
                    <option value="week">按周统计</option>
                    <option value="hour">按小时统计</option>
                </select>
            </div>
            <div class="space-y-2">
                <label for="department" class="block text-sm font-medium text-neutral-700">科室选择</label>
                <select id="department" name="department"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="0">全部科室</option>
                    <!-- 动态加载科室选项，需配合departments.jsp接口 -->
                </select>
            </div>
            <div class="md:col-span-4 flex justify-end mt-2">
                <button type="button" onclick="searchData()"
                        class="px-6 py-2 bg-primary text-white rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:ring-offset-2 transition-custom shadow-md hover:shadow-lg">
                    <i class="fa fa-search mr-2"></i>查询统计
                </button>
            </div>
        </form>
    </div>

    <div id="errorMessage" class="py-10 text-center text-neutral-500 hidden">
        <i class="fa fa-exclamation-triangle text-4xl mb-3 text-red-400"></i>
        <div id="errorText"></div>
    </div>

    <div id="chartContainer" class="mb-8 bg-white rounded-lg p-6 card-shadow">
        <h3 class="text-xl font-bold text-neutral-800 mb-4">科室统计图表</h3>
        <div class="relative h-80">
            <div id="chartLoading" class="absolute inset-0 flex items-center justify-center bg-white/80 z-10 hidden">
                <div class="flex flex-col items-center">
                    <div class="w-12 h-12 border-4 border-primary/30 border-t-primary rounded-full animate-spin mb-3"></div>
                    <p class="text-neutral-600">正在加载数据...</p>
                </div>
            </div>
            <canvas id="statsChart"></canvas>
        </div>
    </div>

    <div class="bg-white rounded-lg p-6 card-shadow">
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-xl font-bold text-neutral-800">科室统计详情</h3>
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
                        class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">科室名称
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">时间单位
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">接诊患者数
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">平均等待时间
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">资源利用率
                    </th>
                </tr>
                </thead>
                <tbody id="tableBody" class="bg-white divide-y divide-neutral-200"></tbody>
            </table>
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
                    primary: '#165DFF', // 定义主色调
                },
            }
        }
    };
    console.log('当前上下文路径:', '<%= request.getContextPath() %>');

    let statsChart = null;

    document.addEventListener('DOMContentLoaded', () => {
        initChart();
        loadDepartments();
    });

    function initChart() {
        const ctx = document.getElementById('statsChart').getContext('2d');
        statsChart = new Chart(ctx, {
            type: 'bar',
            data: {labels: [], datasets: []},
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {display: true, text: '患者数量'}
                    },
                    x: {
                        title: {display: true, text: '时间单位'}
                    }
                },
                plugins: {
                    legend: {position: 'top'},
                    tooltip: {mode: 'index', intersect: false}
                }
            }
        });
    }

    function loadDepartments() {
        fetch('departments.jsp')
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
                // 设置默认科室选项
                document.getElementById('department').innerHTML = `
                    <option value="0">全部科室</option>
                    <option value="1">内科</option>
                    <option value="2">外科</option>
                    <option value="3">儿科</option>
                `;
            });
    }

    function searchData() {
        const form = document.getElementById('searchForm');
        const formData = new FormData(form);
        const params = new URLSearchParams(formData).toString();

        showLoading();
        fetch('data.jsp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Accept': 'application/json'
            },
            body: params
        })
            .then(response => response.json())
            .then(data => {
                hideLoading();
                if (data.error) throw new Error(data.error);
                if (!data.data || data.data.length === 0) {
                    showNoData();
                    return;
                }
                clearError();
                renderTable(data.data);
                updateChart(data.data);
            })
            .catch(error => {
                hideLoading();
                showError('查询失败', error.message);
            });
    }

    function renderTable(data) {
        const tbody = document.getElementById('tableBody');
        tbody.innerHTML = data.map(item => `
            <tr class="hover:bg-gray-50">
                <td class="px-6 py-4">${item.deptName || '所有科室'}</td>
                <td class="px-6 py-4">${item.timeUnit || '-'}</td>
                <td class="px-6 py-4">${item.patientCount || 0}</td>
                <td class="px-6 py-4">${item.avgWaitTime || '-'}</td>
                <td class="px-6 py-4">${item.resourceUtilization || '-'}</td>
            </tr>
        `).join('');

        document.getElementById('totalCount').textContent = `共 ${data.length} 条记录`;
        document.getElementById('noData').classList.add('hidden');
    }

    function updateChart(data) {
        if (statsChart) statsChart.destroy();

        const ctx = document.getElementById('statsChart').getContext('2d');
        const timeUnit = document.getElementById('timeUnit').value;
        const labels = [...new Set(data.map(item => item.timeUnit))].sort();
        const deptGroups = data.reduce((acc, item) => {
            const key = item.deptName || '所有科室';
            if (!acc[key]) acc[key] = [];
            acc[key].push(item);
            return acc;
        }, {});

        const colors = ['#4A90E2', '#50E3C2', '#F5A623', '#7ED321', '#BD10E0'];
        const datasets = [];

        Object.keys(deptGroups).forEach((deptName, index) => {
            datasets.push({
                label: deptName,
                data: labels.map(label =>
                    deptGroups[deptName].find(d => d.timeUnit === label)?.patientCount || 0
                ),
                backgroundColor: `${colors[index % colors.length]}80`,
                borderColor: colors[index % colors.length],
                borderWidth: 1
            });
        });

        statsChart = new Chart(ctx, {
            type: 'bar',
            data: {labels, datasets},
            options: {
                responsive: true,
                scales: {
                    x: {title: {text: timeUnit === 'week' ? '周次' : '时间'}},
                    y: {title: {text: '患者数量'}, beginAtZero: true}
                }
            }
        });
    }

    // 辅助函数
    function showLoading() {
        document.getElementById('chartLoading').classList.remove('hidden');
    }

    function hideLoading() {
        document.getElementById('chartLoading').classList.add('hidden');
    }

    function showError(title, message) {
        const errorDiv = document.getElementById('errorMessage');
        errorDiv.querySelector('#errorText').textContent = message;
        errorDiv.classList.remove('hidden');
    }

    function clearError() {
        document.getElementById('errorMessage').classList.add('hidden');
    }

    function showNoData() {
        document.getElementById('noData').classList.remove('hidden');
        document.getElementById('tableBody').innerHTML = '';
    }
</script>
</body>
</html>