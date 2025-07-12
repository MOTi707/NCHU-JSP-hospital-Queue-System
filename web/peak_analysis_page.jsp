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
    <title>就诊高峰期分析</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
    <style>
        @layer utilities {
            .card-shadow {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            }

            .transition-custom {
                transition: all 0.3s ease;
            }

            .peak-period {
                background-color: rgba(245, 166, 35, 0.2);
                border-left: 3px solid #F5A623;
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
                <li><a href="dept_analysis.jsp"
                       class="text-neutral-600 font-medium hover:text-primary/80 transition-custom">科室统计</a></li>
                <li><a href="peak_analysis_page.jsp"
                       class="text-primary hover:text-primary transition-custom">就诊高峰期分析</a></li>
                <li><a href="patient_wait.jsp"
                       class="text-neutral-600 hover:text-primary transition-custom">患者等待时间分析</a></li>
            </ul>
        </nav>
    </div>
</header>

<main class="container mx-auto px-4 pt-24 pb-12">
    <div class="mb-8 bg-white rounded-lg p-6 card-shadow">
        <h2 class="text-2xl font-bold text-neutral-800 mb-6">就诊高峰期分析</h2>

        <form id="peakAnalysisForm" class="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div class="space-y-2">
                <label for="startDate" class="block text-sm font-medium text-neutral-700">开始日期</label>
                <input type="date" id="startDate" name="startDate" value="2025-06-01"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="endDate" class="block text-sm font-medium text-neutral-700">结束日期</label>
                <input type="date" id="endDate" name="endDate" value="2025-06-15"
                       class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
            </div>
            <div class="space-y-2">
                <label for="department" class="block text-sm font-medium text-neutral-700">科室选择</label>
                <select id="department" name="department"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="0">全部科室</option>
                </select>
            </div>
            <div class="space-y-2">
                <label for="analysisType" class="block text-sm font-medium text-neutral-700">分析类型</label>
                <select id="analysisType" name="analysisType"
                        class="w-full px-4 py-2 border border-neutral-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-custom">
                    <option value="hourly">按小时分析</option>
                    <option value="daily">按日分析</option>
                    <option value="weekly">按周分析</option>
                </select>
            </div>
            <div class="md:col-span-4 flex justify-end mt-2">
                <button type="button" onclick="analyzePeakPeriods()"
                        class="px-6 py-2 bg-primary text-white rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:ring-offset-2 transition-custom shadow-md hover:shadow-lg">
                    <i class="fa fa-bar-chart mr-2"></i>分析高峰期
                </button>
            </div>
        </form>
    </div>

    <div id="errorMessage" class="py-10 text-center text-neutral-500 hidden">
        <i class="fa fa-exclamation-triangle text-4xl mb-3 text-red-400"></i>
        <div id="errorText"></div>
    </div>

    <div id="loadingIndicator" class="py-10 text-center text-neutral-500 hidden">
        <div class="flex flex-col items-center">
            <div class="w-12 h-12 border-4 border-primary/30 border-t-primary rounded-full animate-spin mb-3"></div>
            <p class="text-neutral-600">正在分析数据...</p>
        </div>
    </div>

    <div id="analysisResults" class="space-y-8 hidden">
        <div class="bg-white rounded-lg p-6 card-shadow">
            <h3 class="text-xl font-bold text-neutral-800 mb-4">患者流量趋势</h3>
            <div class="relative h-80">
                <canvas id="flowTrendChart"></canvas>
            </div>
        </div>

        <div class="bg-white rounded-lg p-6 card-shadow">
            <h3 class="text-xl font-bold text-neutral-800 mb-4">高峰期统计</h3>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-neutral-200">
                    <thead class="bg-neutral-50">
                    <tr>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            时间段
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            患者数量
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            占全天比例
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            平均等待时间
                        </th>
                        <th scope="col"
                            class="px-6 py-3 text-left text-xs font-medium text-neutral-500 uppercase tracking-wider">
                            资源利用率
                        </th>
                    </tr>
                    </thead>
                    <tbody id="peakPeriodsTable" class="bg-white divide-y divide-neutral-200"></tbody>
                </table>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-white rounded-lg p-6 card-shadow">
                <h3 class="text-xl font-bold text-neutral-800 mb-4">每日高峰时段分布</h3>
                <div class="relative h-80">
                    <canvas id="dailyPeakDistributionChart"></canvas>
                </div>
            </div>

            <div class="bg-white rounded-lg p-6 card-shadow">
                <h3 class="text-xl font-bold text-neutral-800 mb-4">高峰期建议</h3>
                <div id="peakRecommendations" class="space-y-4">
                    <div class="p-4 peak-period rounded-lg">
                        <h4 class="font-semibold text-lg mb-2"><i class="fa fa-lightbulb text-yellow-500 mr-2"></i>人员配置建议
                        </h4>
                        <p id="staffRecommendation" class="text-neutral-700"></p>
                    </div>

                    <div class="p-4 peak-period rounded-lg">
                        <h4 class="font-semibold text-lg mb-2"><i class="fa fa-calendar-check text-blue-500 mr-2"></i>预约管理建议
                        </h4>
                        <p id="appointmentRecommendation" class="text-neutral-700"></p>
                    </div>

                    <div class="p-4 peak-period rounded-lg">
                        <h4 class="font-semibold text-lg mb-2"><i class="fa fa-users text-green-500 mr-2"></i>资源优化建议
                        </h4>
                        <p id="resourceRecommendation" class="text-neutral-700"></p>
                    </div>
                </div>
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
    tailwind.config = {theme: {extend: {colors: {primary: '#165DFF'}}}};
    let flowTrendChart = null, dailyPeakDistributionChart = null;

    // 定义函数在按钮点击之前
    function analyzePeakPeriods() {
        const form = document.getElementById('peakAnalysisForm');
        const params = new URLSearchParams(new FormData(form)).toString();
        showLoading();
        hideError();

        fetch('peak_analysis_api.jsp', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: params
        })
            .then(res => {
                if (!res.ok) throw new Error(`HTTP错误 ${res.status}`);
                return res.json();
            })
            .then(data => {
                hideLoading();
                if (data.error) throw new Error(data.error);
                if (!data.data || Object.keys(data.data).length === 0) {
                    throw new Error('未找到有效数据');
                }
                renderResults(data.data);
            })
            .catch(err => {
                hideLoading();
                showError('分析失败', err.message || '请检查参数或联系管理员');
            });
    }


    document.addEventListener('DOMContentLoaded', () => {
        fetch('departments.jsp')
            .then(res => res.json())
            .then(data => {
                const select = document.getElementById('department');
                select.innerHTML = '<option value="0">全部科室</option>' +
                    data.data.map(dept => `<option value="${dept.id}">${dept.name}</option>`).join('');
            })
            .catch(err => console.error('加载科室失败:', err));
    });

    function renderResults(data) {
        document.getElementById('analysisResults').classList.remove('hidden');
        renderFlowTrendChart(data.flowTrend);
        renderPeakPeriodsTable(data.peakPeriods);
        renderDailyPeakDistributionChart(data.dailyDistribution);
        generateRecommendations(data.peakPeriods);
    }

    function renderFlowTrendChart(data) {
        if (flowTrendChart) flowTrendChart.destroy();
        const ctx = document.getElementById('flowTrendChart').getContext('2d');
        const labels = data.map(item => item.timeUnit);
        const counts = data.map(item => item.patientCount);
        const waits = data.map(item => item.avgWaitTime);

        flowTrendChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels,
                datasets: [
                    {
                        label: '患者数量',
                        data: counts,
                        backgroundColor: '#165DFF80',
                        borderColor: '#165DFF',
                        borderWidth: 1
                    },
                    {
                        label: '平均等待时间(分钟)',
                        data: waits,
                        type: 'line',
                        yAxisID: 'y1',
                        borderColor: '#F5A623',
                        backgroundColor: 'transparent',
                        borderWidth: 2,
                        pointRadius: 3
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: '患者数量',
                            font: {size: 14}
                        }
                    },
                    y1: {
                        position: 'right',
                        title: {
                            display: true,
                            text: '平均等待时间(分钟)',
                            font: {size: 14}
                        },
                        grid: {drawOnChartArea: false}
                    }
                }
            }
        });
    }

    function renderPeakPeriodsTable(peaks) {
        const tbody = document.getElementById('peakPeriodsTable');
        tbody.innerHTML = peaks.map((peak, i) => `
            <tr class="${i < 3 ? 'peak-period' : ''}">
                <td class="px-6 py-4 whitespace-nowrap">${peak.timeUnit || 'N/A'}</td>
                <td class="px-6 py-4 whitespace-nowrap">${peak.patientCount || 0}</td>
                <td class="px-6 py-4 whitespace-nowrap">${peak.percentage || 0}%</td>
                <td class="px-6 py-4 whitespace-nowrap">${Math.round(peak.avgWaitTime) || 0} 分钟</td>
                <td class="px-6 py-4 whitespace-nowrap">${peak.resourceUtilization || 0}%</td>
            </tr>
        `).join('');
    }

    function renderDailyPeakDistributionChart(data) {
        if (dailyPeakDistributionChart) dailyPeakDistributionChart.destroy();
        const ctx = document.getElementById('dailyPeakDistributionChart').getContext('2d');
        const hours = data.map(item => item.hour);
        const counts = data.map(item => item.patientCount);

        dailyPeakDistributionChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: hours,
                datasets: [{
                    label: '患者数量',
                    data: counts,
                    backgroundColor: '#F5A62320',
                    borderColor: '#F5A623',
                    borderWidth: 2,
                    pointBackgroundColor: '#F5A623',
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: '患者数量',
                            font: {size: 14}
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: '小时',
                            font: {size: 14}
                        }
                    }
                }
            }
        });
    }

    function generateRecommendations(peaks) {
        if (!peaks || peaks.length === 0) {
            document.getElementById('staffRecommendation').textContent = '未检测到明显高峰期';
            document.getElementById('appointmentRecommendation').textContent = '患者流量分布均衡';
            document.getElementById('resourceRecommendation').textContent = '当前资源配置合理';
            return;
        }

        const top3 = peaks.slice(0, 3);
        const timeUnits = top3.map(p => p.timeUnit).join('、');

        document.getElementById('staffRecommendation').textContent =
            '建议在' + timeUnits + '时段增加20%-30%医护人员';

        document.getElementById('appointmentRecommendation').textContent =
            '在高峰前1小时开放额外预约时段，引导患者分流';

        document.getElementById('resourceRecommendation').textContent =
            '高峰时段诊室开放率提升至80%以上';
    }

    function showLoading() {
        document.getElementById('loadingIndicator').classList.remove('hidden');
        document.getElementById('errorMessage').classList.add('hidden');
        document.getElementById('analysisResults').classList.add('hidden');
    }

    function hideLoading() {
        document.getElementById('loadingIndicator').classList.add('hidden');
    }

    function showError(title, msg) {
        document.getElementById('errorText').textContent = title + ': ' + msg;
        document.getElementById('errorMessage').classList.remove('hidden');
    }

    function hideError() {
        document.getElementById('errorMessage').classList.add('hidden');
    }
</script>
</body>
</html>