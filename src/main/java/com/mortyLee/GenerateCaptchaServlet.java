package com.mortyLee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;


/**
 * @author Morty Lee
 * @since 2025-5-14 21:11
 * 生成验证码图片 通过session返回计算结果 通过IO流返回图片
 */

@WebServlet("/generateCaptchaServlet")
public class GenerateCaptchaServlet extends HttpServlet {
    private static final int WIDTH = 120;
    private static final int HEIGHT = 40;
    private static final int FONT_SIZE = 20;

    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应类型为图片
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "No-cache");
        response.setDateHeader("Expires", 0);

        // 生成数学表达式验证码
        String[] captcha = generateMathCaptcha();  // [0]=表达式, [1]=正确结果
        HttpSession session = request.getSession();
        session.setAttribute("captcha", captcha[1]);  // 存储正确结果到 Session

        // 绘制验证码图片
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        drawBackground(g);
        drawCaptchaText(g, captcha[0]);
        drawDisturbLines(g);
        g.dispose();

        // 输出图片到响应流
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    // 生成数学表达式（如 ["3+5=?", "8"]）
    private String[] generateMathCaptcha () {
        Random random = new Random();
        int num1 = random.nextInt(10) + 1;
        int num2 = random.nextInt(10) + 1;
        char[] ops = {'+', '-', '*'};
        char op = ops[random.nextInt(ops.length)];

        int result;
        switch (op) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            default:
                result = 0;
        }
        return new String[]{num1 + " " + op + " " + num2 + " = ?", String.valueOf(result)};
    }

    // 绘制背景
    private void drawBackground (Graphics g) {
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, WIDTH, HEIGHT);
    }

    // 绘制验证码文本
    private void drawCaptchaText (Graphics g, String text) {
        g.setColor(Color.BLACK);
        g.setFont(new Font("微软雅黑", Font.BOLD, FONT_SIZE));
        g.drawString(text, 10, 25);  // 文本位置居中
    }

    // 绘制干扰线
    private void drawDisturbLines (Graphics g) {
        Random random = new Random();
        for (int i = 0 ; i < 5 ; i++) {
            g.setColor(new Color(
                    random.nextInt(256),
                    random.nextInt(256),
                    random.nextInt(256)
            ));
            int x1 = random.nextInt(WIDTH);
            int y1 = random.nextInt(HEIGHT);
            int x2 = random.nextInt(WIDTH);
            int y2 = random.nextInt(HEIGHT);
            g.drawLine(x1, y1, x2, y2);
        }
    }
}