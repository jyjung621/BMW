package oracle.java.bmw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import oracle.java.bmw.dao.SaveFileDao;
import oracle.java.bmw.model.FileManager;
import oracle.java.bmw.model.SaveFiles;

@Service
public class SaveFileServiceImpl implements SaveFileService{

	@Autowired
	private SaveFileDao sfd;

	@Override
	public int uploadFileWithServer(SaveFiles saveFiles, String filePath, String formName, MultipartHttpServletRequest multipartRequest) {
		FileManager files = new FileManager(filePath, formName, multipartRequest);
		System.out.println("ServerRealPath --> " + files.getFilePath());
		
		List<SaveFiles> saveFileList = files.fileUpload(saveFiles, multipartRequest);
		System.out.println("uploadFileNames -> " + files.getFileNames().toString());
		int result = 0;
		for(SaveFiles saveFile : saveFileList) {
			System.out.println("\n----------확인용-------------");
			System.out.println(saveFile.toString());
			result = sfd.uploadFileInsertDB(saveFile);
		}

		return result;
	}
	
	@Override
	public int uploadFileWithLocal(SaveFiles saveFiles, String formName, MultipartHttpServletRequest multipartRequest) {
		FileManager files = new FileManager(formName, multipartRequest);
		System.out.println("LocalRealPath --> " + files.getFilePath());
		
		List<SaveFiles> saveFileList = files.fileUpload(saveFiles, multipartRequest);
		System.out.println("uploadFileNames -> " + files.getFileNames().toString());
		int result = 0;
		for(SaveFiles saveFile : saveFileList) {
			System.out.println("\n----------확인용-------------");
			System.out.println(saveFile.toString());
			result = sfd.uploadFileInsertDB(saveFile);
		}

		return result;
	}

//	@Override
//	public List<SaveFiles> fileUpload(SaveFiles saveFiles, FileManager files, MultipartHttpServletRequest multipartRequest) {
//		List<MultipartFile> mf = multipartRequest.getFiles(files.getFormName());
//		Map<String, List<String>> fileNames = new HashMap<String, List<String>>();
//		List<String> originNames = new ArrayList<String>();
//		List<String> savedNames = new ArrayList<String>();
//		List<SaveFiles> saveFileList = new ArrayList<SaveFiles>();
//		StringBuffer sb = null;
//		
//		for(int i=0; i<mf.size(); i++) {
//			System.out.println("=======================반복실행 " + i + "=====================================");
//			if(mf.get(i).getOriginalFilename().equals("")) {
//				
//			} else {
//				sb = new StringBuffer();
//				String originFileName = mf.get(i).getOriginalFilename();
//				String fileExtend = originFileName.substring(originFileName.lastIndexOf("."));
////				originFileName = originFileName.substring(0, originFileName.lastIndexOf("."));
//				String savedFileName = sb.append(UUID.randomUUID().toString())
//									     .append("_")
//									     .append(originFileName).toString();
//				
//				String fileFullPath = savedFileName;
//				
//				try {
//					// 경로에 디렉토리 없으면 생성
//					File targetDir = new File(files.getFilePath());
//					if(!targetDir.exists()) {
//						targetDir.mkdirs();
//						System.out.println("업로드용 디렉토리 생성 : " + targetDir.getPath());
//					}
//					// 파일 저장
//					File fileFull = new File(files.getFilePath(), savedFileName);
////					mf.get(i).transferTo(targetDir);
//					FileCopyUtils.copy(mf.get(i).getBytes(), fileFull);
//					originNames.add(originFileName);
//					savedNames.add(savedFileName);
//					
//					// DB로 넘길 값 저장
//					saveFiles.setOriginFileName(originFileName);
//					saveFiles.setSavedFileName(savedFileName);
//					saveFiles.setFileExtend(fileExtend);
//					saveFiles.setFilePath(files.getFilePath());
//					
//					System.out.println("saveFiles 0" + ++i + " .toString() -------\n" + saveFiles.toString());
//					saveFileList.add(saveFiles);
//					
//				} catch (Exception e) {
//					System.out.println("fileUpload error -> " + e.getMessage());
//				}
//			}
//		}
//		fileNames.put("originNames", originNames);
//		fileNames.put("savedNames", savedNames);
//		files.setFileNames(fileNames);
//		
//		return saveFileList;
//	}
//	
	
}
