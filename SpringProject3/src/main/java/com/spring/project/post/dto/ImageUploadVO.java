package com.spring.project.post.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageUploadVO {

	private String attach_path;
	private MultipartFile upload;
	private String filename;
	private String CKEditorFuncNum;
}
