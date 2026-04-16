package com.ruoyi.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

/**
 * 图片转Base64工具类
 * 
 * @author ruoyi
 * @date 2026-04-13
 */
public class ImageBase64Utils
{
    private static final Logger log = LoggerFactory.getLogger(ImageBase64Utils.class);

    /**
     * 将图片URL转换为Base64字符串
     * 
     * @param imageUrl 图片URL地址
     * @return Base64字符串，失败返回null
     */
    public static String imageUrlToBase64(String imageUrl)
    {
        if (StringUtils.isEmpty(imageUrl))
        {
            return null;
        }

        // 如果已经是base64格式，直接返回
        if (imageUrl.startsWith("data:image") || imageUrl.startsWith("iVBOR"))
        {
            return imageUrl;
        }

        HttpURLConnection connection = null;
        InputStream inputStream = null;
        ByteArrayOutputStream outputStream = null;

        try
        {
            URL url = new URL(imageUrl);
            connection = (HttpURLConnection) url.openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(10000);
            connection.setRequestMethod("GET");
            connection.connect();

            int responseCode = connection.getResponseCode();
            if (responseCode != HttpURLConnection.HTTP_OK)
            {
                log.warn("获取图片失败，URL: {}, 响应码: {}", imageUrl, responseCode);
                return null;
            }

            inputStream = connection.getInputStream();
            outputStream = new ByteArrayOutputStream();

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1)
            {
                outputStream.write(buffer, 0, bytesRead);
            }

            byte[] imageBytes = outputStream.toByteArray();
            
            // 转换为Base64
            String base64String = Base64.getEncoder().encodeToString(imageBytes);
            
            // 添加Base64前缀（根据Content-Type）
            String contentType = connection.getContentType();
            if (contentType != null)
            {
                if (contentType.contains("png"))
                {
                    base64String = "data:image/png;base64," + base64String;
                }
                else if (contentType.contains("jpeg") || contentType.contains("jpg"))
                {
                    base64String = "data:image/jpeg;base64," + base64String;
                }
                else if (contentType.contains("gif"))
                {
                    base64String = "data:image/gif;base64," + base64String;
                }
                else
                {
                    base64String = "data:image;base64," + base64String;
                }
            }

            log.debug("图片转换成功，URL: {}, Base64长度: {}", imageUrl, base64String.length());
            return base64String;
        }
        catch (Exception e)
        {
            log.error("图片转Base64失败，URL: {}", imageUrl, e);
            return null;
        }
        finally
        {
            try
            {
                if (outputStream != null)
                {
                    outputStream.close();
                }
                if (inputStream != null)
                {
                    inputStream.close();
                }
                if (connection != null)
                {
                    connection.disconnect();
                }
            }
            catch (Exception e)
            {
                log.error("关闭资源失败", e);
            }
        }
    }

    /**
     * 批量转换图片URL为Base64
     * 
     * @param imageUrls 图片URL数组
     * @return Base64字符串数组
     */
    public static String[] batchImageUrlToBase64(String... imageUrls)
    {
        if (imageUrls == null || imageUrls.length == 0)
        {
            return new String[0];
        }

        String[] base64Array = new String[imageUrls.length];
        for (int i = 0; i < imageUrls.length; i++)
        {
            base64Array[i] = imageUrlToBase64(imageUrls[i]);
        }
        return base64Array;
    }
}
