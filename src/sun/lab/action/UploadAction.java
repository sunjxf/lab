package sun.lab.action;

/**
 * Created by sun on 2017/2/25.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class UploadAction {
    @RequestMapping("/upload"  )
    public String upload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
        String uploadPath = request.getSession().getServletContext().getRealPath("./")+File.separator+"upload";
        ArrayList fileList=new ArrayList();
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //判断 request 是否有文件上传,即多部分请求
        if(multipartResolver.isMultipart(request)){
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
            //取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while(iter.hasNext()){
                //取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if(file != null){
                    //取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if(myFileName.trim() !=""){
                        //重命名上传后的文件名
                        String ext=myFileName.substring(myFileName.lastIndexOf(".")+1);
                        String fileName = UUID.randomUUID()+"."+ext;
                        fileList.add(fileName);
                        System.out.println(fileName);
                        //定义上传路径
                        String path =uploadPath +File.separator+ fileName;
                        File localFile = new File(path);
                        file.transferTo(localFile);
                    }
                }

            }

        }
        request.setAttribute("msg",fileList);
        return "forward:/common/message.jsp";
    }


}