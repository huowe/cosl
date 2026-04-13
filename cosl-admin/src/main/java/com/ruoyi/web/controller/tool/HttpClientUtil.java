package com.ruoyi.web.controller.tool;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.ServiceUnavailableRetryStrategy;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.imageio.ImageIO;
import javax.net.ssl.SSLContext;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;
import java.util.Map.Entry;

//import net.sf.json.JSONObject;

/**
 * Apache Httpclient 工具包装类 <br/>
 * required httpclient-4.3
 *
 * @author jiucai
 */
@Component
public class HttpClientUtil {
    public static final String CHARSET_UTF8 = "UTF-8";
    // public static final String CHARSET_GBK = "GBK";
    // public static final String SSL_DEFAULT_SCHEME = "https";
    // public static final int SSL_DEFAULT_PORT = 443;

    protected static Log logger = LogFactory.getLog(HttpClientUtil.class);

    // 使用ResponseHandler接口处理响应，HttpClient使用ResponseHandler会自动管理连接的释放，解决了对连接的释放管理
    private static ResponseHandler<String> responseHandler = new ResponseHandler<String>() {
        // 自定义响应处理
        public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
            HttpEntity entity = response.getEntity();
            try {
                if (entity != null) {
                    Charset charset = ContentType.getOrDefault(entity).getCharset();
                    if (null != charset) {
                        return new String(EntityUtils.toByteArray(entity), charset);
                    } else {
                        return new String(EntityUtils.toByteArray(entity));
                    }

                } else {
                    return null;
                }
            } finally {
                EntityUtils.consumeQuietly(entity);
            }
        }
    };

    /**
     * Get方式提交,URL中包含查询参数, 格式：http://www.g.cn?search=p&name=s.....
     *
     * @param url 提交地址
     * @return 响应消息
     */
    public static String get(String url) {
        return get(url, null, null);
    }

    /**
     * Get方式提交,URL中包含查询参数, 格式：http://www.g.cn?search=p&name=s.....
     *
     * @param url 提交地址
     * @return 响应消息
     */
    public static String get_Data(String url, Map<String, String> params, Map<String, String> header) {
        return getData(url, params, header, null);
    }

    /**
     * Get方式提交,URL中不包含查询参数, 格式：http://www.g.cn
     *
     * @param url     提交地址
     * @param params  查询参数集, 键/值对
     * @param charset 参数提交编码集
     * @return 响应消息
     */
    public static String getData(String url, Map<String, String> params, Map<String, String> header, String charset) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        List<NameValuePair> qparams = getParamsList(params);
        if (qparams != null && qparams.size() > 0) {
            charset = (charset == null ? CHARSET_UTF8 : charset);
            String formatParams = URLEncodedUtils.format(qparams, charset);
            url = (url.indexOf("?")) < 0 ? (url + "?" + formatParams)
                    : (url.substring(0, url.indexOf("?") + 1) + formatParams);
        }
        CloseableHttpClient httpclient = getHttpClient(charset);
        logger.info("url:" + url);
        HttpGet hg = new HttpGet(url);
        Set<Entry<String, String>> entrySet = header.entrySet();
        for (Entry<String, String> entry : entrySet) {
            hg.addHeader(entry.getKey(), entry.getValue());
        }
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(hg, responseHandler);
        } catch (ClientProtocolException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(hg, httpclient);
        }
        return responseStr;
    }

    /**
     * Get方式提交,URL中不包含查询参数, 格式：http://www.g.cn
     *
     * @param url    提交地址
     * @param params 查询参数集, 键/值对
     * @return 响应消息
     */
    public static String get(String url, Map<String, String> params) {
        return get(url, params, null);
    }

    /**
     * Get方式提交,URL中不包含查询参数, 格式：http://www.g.cn
     *
     * @param url     提交地址
     * @param params  查询参数集, 键/值对
     * @param charset 参数提交编码集
     * @return 响应消息
     */
    public static String get(String url, Map<String, String> params, String charset) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        List<NameValuePair> qparams = getParamsList(params);
        if (qparams != null && qparams.size() > 0) {
            charset = (charset == null ? CHARSET_UTF8 : charset);
            String formatParams = URLEncodedUtils.format(qparams, charset);
            url = (url.indexOf("?")) < 0 ? (url + "?" + formatParams)
                    : (url.substring(0, url.indexOf("?") + 1) + formatParams);
        }
        CloseableHttpClient httpclient = getHttpClient(charset);
        logger.info("url:" + url);
        System.out.println(url);
        HttpGet hg = new HttpGet(url);
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(hg, responseHandler);
        } catch (ClientProtocolException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(hg, httpclient);
        }
        return responseStr;
    }

    /**
     * 获取请求头
     *
     * @param url
     * @return
     */
    public static String getHeadInfo(String url, String charset) {
        CloseableHttpClient httpclient = getHttpClient(charset);
        HttpGet hg = new HttpGet(url);
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(hg, responseHandler);
        } catch (ClientProtocolException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(hg, httpclient);
        }
        return responseStr;
    }

    /**
     * Post方式提交,URL中不包含提交参数, 格式：http://www.g.cn
     *
     * @param url    提交地址
     * @param params 提交参数集, 键/值对
     * @return 响应消息
     */
    public static String post(String url, Map<String, String> params) {
        return post(url, params, HttpClientUtil.CHARSET_UTF8);
    }

    public static String postJson(String url, JSONObject params) {
        return post(url, params, HttpClientUtil.CHARSET_UTF8, "application/json");
    }

    public static String post(String url, JSONObject json, String charset, String requestType) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        // 创建HttpClient实例
        CloseableHttpClient httpclient = getHttpClient(charset);
        StringEntity entity = null;
        try {
            entity = new StringEntity(json.toString());
            entity.setContentType("application/json");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(entity);
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(httpPost, responseHandler);
        } catch (ClientProtocolException e) {
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(httpPost, httpclient);
        }
        return responseStr;
    }

    /**
     * Post方式提交,URL中不包含提交参数, 格式：http://www.g.cn
     *
     * @param url     提交地址
     * @param params  提交参数集, 键/值对
     * @param charset 参数提交编码集
     * @return 响应消息
     */
    public static String post(String url, Map<String, String> params, String charset) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        // 创建HttpClient实例
        CloseableHttpClient httpclient = getHttpClient(charset);
        UrlEncodedFormEntity formEntity = null;
        try {
            if (charset == null || StringUtils.isEmpty(charset)) {
                formEntity = new UrlEncodedFormEntity(getParamsList(params));
            } else {
                formEntity = new UrlEncodedFormEntity(getParamsList(params), charset);
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("不支持的编码集", e);
        }
        HttpPost hp = new HttpPost(url);
        hp.setEntity(formEntity);
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(hp, responseHandler);
        } catch (ClientProtocolException e) {
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(hp, httpclient);
        }
        return responseStr;
    }

    /**
     * post方式，URL中不包含提交参数，设置header，
     *
     * @param url
     * @param params
     * @param header
     * @param charset
     * @return
     */
    public static String post(String url, Map<String, String> params, Map<String, String> header, String charset) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        // 创建HttpClient实例
        CloseableHttpClient httpclient = getHttpClient(charset);
        UrlEncodedFormEntity formEntity = null;
        try {
            if (charset == null || StringUtils.isEmpty(charset)) {
                formEntity = new UrlEncodedFormEntity(getParamsList(params));
            } else {
                formEntity = new UrlEncodedFormEntity(getParamsList(params), charset);
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("不支持的编码集", e);
        }
        HttpPost hp = new HttpPost(url);
        hp.setEntity(formEntity);
        Set<Entry<String, String>> entrySet = header.entrySet();
        for (Entry<String, String> entry : entrySet) {
            hp.addHeader(entry.getKey(), entry.getValue());
        }
        // 发送请求，得到响应
        String responseStr = null;
        try {
            responseStr = httpclient.execute(hp, responseHandler);
        } catch (ClientProtocolException e) {
            throw new RuntimeException("客户端连接协议错误", e);
        } catch (IOException e) {
            throw new RuntimeException("IO操作异常", e);
        } finally {
            abortConnection(hp, httpclient);
        }
        return responseStr;
    }

    /**
     * Post方式提交,忽略URL中包含的参数,解决SSL双向数字证书认证
     *
     * @param url              提交地址
     * @param params           提交参数集, 键/值对
     * @param charset          参数编码集
     * @param keystoreUrl      密钥存储库路径
     * @param keystorePassword 密钥存储库访问密码
     * @return 响应消息
     * @throws RuntimeException
     */
    public static String post(String url, Map<String, String> params, String charset, final URL keystoreUrl,
                              final String keystorePassword) {
        if (url == null || StringUtils.isEmpty(url)) {
            return null;
        }
        UrlEncodedFormEntity formEntity = null;
        try {
            if (charset == null || StringUtils.isEmpty(charset)) {
                formEntity = new UrlEncodedFormEntity(getParamsList(params));
            } else {
                formEntity = new UrlEncodedFormEntity(getParamsList(params), charset);
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("不支持的编码集", e);
        }

        CloseableHttpClient httpclient = null;
        HttpPost hp = null;
        String responseStr = null;
        try {
            KeyStore keyStore = createKeyStore(keystoreUrl, keystorePassword);
            // KeyStore trustStore = createKeyStore(truststoreUrl,
            // keystorePassword);

            HttpClientBuilder builder = getHttpClientBuilder(charset);
            TrustStrategy trustStrategy = new TrustStrategy() {

                @Override
                public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                    return true;
                }
            };

            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(keyStore, trustStrategy).build();
            LayeredConnectionSocketFactory sslSocketFactory = new SSLConnectionSocketFactory(sslContext);

            builder.setSSLSocketFactory(sslSocketFactory);

            httpclient = builder.build();

            // SSLSocketFactory socketFactory = new SSLSocketFactory(keyStore,
            // keystorePassword, trustStore);
            // Scheme scheme = new Scheme(SSL_DEFAULT_SCHEME, socketFactory,
            // SSL_DEFAULT_PORT);
            // httpclient.getConnectionManager().getSchemeRegistry().register(scheme);

            hp = new HttpPost(url);
            hp.setEntity(formEntity);
            responseStr = httpclient.execute(hp, responseHandler);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("指定的加密算法不可用", e);
        } catch (KeyStoreException e) {
            throw new RuntimeException("keytore解析异常", e);
        } catch (CertificateException e) {
            throw new RuntimeException("信任证书过期或解析异常", e);
        } catch (FileNotFoundException e) {
            throw new RuntimeException("keystore文件不存在", e);
        } catch (IOException e) {
            throw new RuntimeException("I/O操作失败或中断 ", e);
        } catch (KeyManagementException e) {
            throw new RuntimeException("处理密钥管理的操作异常", e);
        } finally {
            abortConnection(hp, httpclient);
        }
        return responseStr;
    }

    public static HttpClientConnectionManager getConnectionManager() {

        PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager();
        connManager.setMaxTotal(100);// 连接池最大并发连接数
        connManager.setDefaultMaxPerRoute(100);// 单路由最大并发数

        return connManager;

    }

    public static HttpClientBuilder getHttpClientBuilder(final String charset) {

        HttpClientBuilder builder = HttpClients.custom();

        Charset chartset = charset == null ? Charset.forName(CHARSET_UTF8) : Charset.forName(charset);
        ConnectionConfig.Builder connBuilder = ConnectionConfig.custom().setCharset(chartset);

        RequestConfig.Builder reqBuilder = RequestConfig.custom();
        reqBuilder.setExpectContinueEnabled(false);
        reqBuilder.setSocketTimeout(3 * 60 * 1000);
        reqBuilder.setConnectTimeout(30 * 1000);

        ServiceUnavailableRetryStrategy serviceUnavailableRetryStrategy = new DefaultServiceUnavailableRetryStrategy(3,
                3000);
        builder.setServiceUnavailableRetryStrategy(serviceUnavailableRetryStrategy);
        // 模拟浏览器，解决一些服务器程序只允许浏览器访问的问题
        builder.setUserAgent("Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1)");
        builder.setDefaultRequestConfig(reqBuilder.build());
        builder.setDefaultConnectionConfig(connBuilder.build());
        builder.setConnectionManager(getConnectionManager());

        return builder;

    }

    /**
     * 获取HttpClient实例
     *
     * @param charset 参数编码集, 可空
     * @return HttpClient 对象
     */
    public static CloseableHttpClient getHttpClient(final String charset) {
        HttpClientBuilder builder = getHttpClientBuilder(charset);
        CloseableHttpClient httpclient = builder.build();

        return httpclient;
    }

    /**
     * 释放HttpClient连接
     *
     * @param hrb        请求对象
     * @param httpclient 对象
     */
    private static void abortConnection(final HttpUriRequest hrb, final CloseableHttpClient httpclient) {
        if (hrb != null) {
            if (hrb instanceof HttpGet) {
                ((HttpGet) hrb).releaseConnection();
            } else if (hrb instanceof HttpPost) {
                ((HttpPost) hrb).releaseConnection();
            } else {
                hrb.abort();
            }
        }
        if (httpclient != null) {
            // httpclient.getConnectionManager().shutdown();
            try {
                logger.debug("closing httpclient ...");
                httpclient.close();
            } catch (IOException e) {
                logger.error("failed to close httpclient", e);
            }

        }
    }

    /**
     * 从给定的路径中加载此 KeyStore
     *
     * @param url      keystore URL路径
     * @param password keystore访问密钥
     * @return keystore 对象
     */
    private static KeyStore createKeyStore(final URL url, final String password)
            throws KeyStoreException, NoSuchAlgorithmException, CertificateException, IOException {
        if (url == null) {
            throw new IllegalArgumentException("Keystore url may not be null");
        }
        KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
        InputStream is = null;
        try {
            is = url.openStream();
            keystore.load(is, password != null ? password.toCharArray() : null);
        } finally {
            if (is != null) {
                is.close();
                is = null;
            }
        }
        return keystore;
    }

    /**
     * 将传入的键/值对参数转换为NameValuePair参数集
     *
     * @param paramsMap 参数集, 键/值对
     * @return NameValuePair参数集
     */
    private static List<NameValuePair> getParamsList(Map<String, String> paramsMap) {
        if (paramsMap == null || paramsMap.size() == 0) {
            return null;
        }
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        for (Entry<String, String> map : paramsMap.entrySet()) {
            params.add(new BasicNameValuePair(map.getKey(), map.getValue()));
        }
        return params;
    }

    public static String post(String URL, String json) {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(URL);

        post.setHeader("Content-Type", "application/json");
        String result = "";
        try {
            StringEntity s = new StringEntity(json.toString(), "utf-8");
            s.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
            post.setEntity(s);

            // 发送请求
            HttpResponse httpResponse = client.execute(post);

            // 获取响应输入流
            InputStream inStream = httpResponse.getEntity().getContent();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inStream, "utf-8"));
            StringBuilder strber = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null)
                strber.append(line + "\n");
            inStream.close();

            result = strber.toString();
            logger.info(result);

            if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                logger.info("请求服务器成功，做相应处理");
            } else {
                logger.info("请求服务端失败");
            }
        } catch (Exception e) {
            logger.info("请求异常");
            throw new RuntimeException(e);
        }
        return result;
    }


    public static String downloadFile(String url,String savePath,boolean useSysTime) {
        String responseMap = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();// 创建默认的httpClient实例.
        HttpGet httpget = new HttpGet(url);// 创建httpget
        // 设置请求和传输超时时间
        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(50000).setConnectTimeout(50000).build();

        //设置请求头
        httpget.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1");

        httpget.setConfig(requestConfig);
        Random r = new Random();
        try (CloseableHttpResponse clientResponse = httpclient.execute(httpget)) {
            if (HttpStatus.SC_OK == clientResponse.getStatusLine().getStatusCode()) {
                HttpEntity entity = clientResponse.getEntity();

                InputStream in = entity.getContent();
                String saveImagePath = System.currentTimeMillis() + ".png";

                //将图片下载到本地
                FileUtils.copyInputStreamToFile(in, new File(savePath + saveImagePath));
                responseMap = savePath + saveImagePath;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpget.releaseConnection();
                httpclient.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
        }

        return responseMap;
    }
    public static String downloadFileIfNotExist(String url,String savePath) {
        String responseMap = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();// 创建默认的httpClient实例.
        HttpGet httpget = new HttpGet(url);// 创建httpget
        // 设置请求和传输超时时间
        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(50000*6).setConnectTimeout(50000*6).build();

        //设置请求头
        httpget.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1");

        httpget.setConfig(requestConfig);
        Random r = new Random();
        try (CloseableHttpResponse clientResponse = httpclient.execute(httpget)) {
            if (HttpStatus.SC_OK == clientResponse.getStatusLine().getStatusCode()) {
                HttpEntity entity = clientResponse.getEntity();

                InputStream in = entity.getContent();

                //将图片下载到本地
                FileUtils.copyInputStreamToFile(in, new File(savePath));
                responseMap = savePath;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpget.releaseConnection();
                httpclient.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return responseMap;
    }
    public static String inpaintImage(String URL, String json,String taskFilePath) {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(URL);

        post.setHeader("Content-Type", "application/json");
        String resultPath = "";
        try {
            StringEntity s = new StringEntity(json.toString(), "utf-8");
            s.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
            post.setEntity(s);

            // 发送请求
            HttpResponse httpResponse = client.execute(post);

            // 获取响应输入流
            InputStream inStream = httpResponse.getEntity().getContent();
            // 读取图片
            BufferedImage image = ImageIO.read(inStream);

            // 确保inputStream被正确关闭

            // 将BufferedImage保存为文件
            resultPath = taskFilePath+System.currentTimeMillis()+".jpg";
            File outputFile = new File(resultPath);
            ImageIO.write(image, "jpg", outputFile);
        } catch (Exception e) {
            logger.info("请求异常");
            throw new RuntimeException(e);
        }
        return resultPath;
    }

    public static String downloaDyFile(String url,String savePath,boolean useSysTime) {
        String responseMap = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();// 创建默认的httpClient实例.
        HttpGet httpget = new HttpGet(url);// 创建httpget
        // 设置请求和传输超时时间
        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(50000*6).setConnectTimeout(50000*6).build();

        //设置请求头
        httpget.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.79 Safari/537.1");

        httpget.setConfig(requestConfig);
        Random r = new Random();
        try (CloseableHttpResponse clientResponse = httpclient.execute(httpget)) {
            if (HttpStatus.SC_OK == clientResponse.getStatusLine().getStatusCode()) {
                HttpEntity entity = clientResponse.getEntity();

                InputStream in = entity.getContent();
                String suffix = url.substring(url.lastIndexOf(".")).split("\\?")[0];
                String saveImagePath = System.currentTimeMillis() + suffix;

                //将图片下载到本地
                FileUtils.copyInputStreamToFile(in, new File(savePath + saveImagePath));
                responseMap = savePath + saveImagePath;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                httpget.releaseConnection();
                httpclient.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return responseMap;
    }

    public static void main(String[] args) {
        String url = "https://img.alicdn.com/imgextra/i3/O1CN01KXZ6Z21QZ2Z6Z2Z2Z2_!!6000000000000-2-tps-200-200.png";
        System.out.println(url.substring(url.lastIndexOf(".")));
    }

}