package oracle.java.bmw.service;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.bmw.model.SaveFiles;

public interface SaveFileService {

	int uploadFileWithServer(SaveFiles saveFiles, String filePath, String formName, MultipartHttpServletRequest multipartRequest);
	int uploadFileWithLocal(SaveFiles saveFiles, String formName, MultipartHttpServletRequest multipartRequest);

}
