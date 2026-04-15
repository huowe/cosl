package com.ruoyi.common.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

public class ImageToBase64 {

    /**
     * 将指定路径的图片文件编码为 RFC4648 标准的 Base64 字符串。
     *
     * @param imagePath 图片文件路径
     * @return Base64 编码的字符串
     * @throws IOException 如果文件读取失败
     */
    public static String encodeImageToBase64(String imagePath) throws IOException {
        Path path = Paths.get(imagePath);
        byte[] imageBytes = Files.readAllBytes(path);
        // 使用 RFC4648 标准 Base64 编码器（带填充）
        return Base64.getEncoder().encodeToString(imageBytes);
    }

    /**
     * 将 Base64 字符串解码并保存为图片文件（可选示例，用于验证）。
     *
     * @param base64Str Base64 字符串
     * @param outputPath 输出图片路径
     * @throws IOException 如果文件写入失败
     */
    public static void decodeBase64ToImage(String base64Str, String outputPath) throws IOException {
        byte[] imageBytes = Base64.getDecoder().decode(base64Str);
        Path path = Paths.get(outputPath);
        Files.write(path, imageBytes);
    }

    // 使用示例
    public static void main(String[] args) {
        String imagePath = "E:\\66666666\\ScreenShot_2026-04-15_175445_675.png";   // 输入图片路径
        String outputPath = "decoded.jpg";  // 解码后保存路径

        try {
            // 编码
            String base64String = encodeImageToBase64(imagePath);
            System.out.println("Base64 编码结果（前100个字符）: " + base64String.substring(0, Math.min(100, base64String.length())));
            System.out.println("完整长度: " + base64String.length());

            // 解码并保存（验证）
            decodeBase64ToImage(base64String, outputPath);
            System.out.println("解码后图片已保存至: " + outputPath);
        } catch (IOException e) {
            System.err.println("处理失败: " + e.getMessage());
        }
    }
}