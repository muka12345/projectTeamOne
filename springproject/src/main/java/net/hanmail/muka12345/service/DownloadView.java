package net.hanmail.muka12345.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	public void Download() {

		setContentType("application/download; utf-8");

	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		File file = (File) model.get("downloadFile");
		

		// User-Agent : 어떤 운영체제로 어떤 브라우저를 서버( 홈페이지 )에 접근하는지 확인함
		String header = request.getHeader("User-Agent");
		String fileName;

		if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
			// 인터넷 익스플로러 10이하 버전, 11버전, 엣지에서 인코딩
			fileName = URLEncoder.encode(file.getName(), "UTF-8");
		} else {
			// 나머지 브라우저에서 인코딩
			fileName = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");
		}
	
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		// 형식을 모르는 파일첨부용 contentType
		response.setContentType("application/octet-stream");
		// 다운로드와 다운로드될 파일이름
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 파일복사
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}

//출처: https://jdkblog.tistory.com/133 [JDK's blog]
