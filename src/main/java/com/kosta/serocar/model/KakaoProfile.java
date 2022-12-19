package com.kosta.serocar.model;

import lombok.Data;

@Data
public class KakaoProfile {
	public Long id;
	public String connected_at;
	public Properties properties;
	public Kakao_Account kakao_account;

	@Data
	public class Properties {
		public String nickname;
	}

	@Data
	public class Kakao_Account {
		public Boolean profile_nickname_needs_agreement;
		public Profile profile;
		public Boolean has_email;
		public Boolean email_needs_agreement;
		public Boolean is_email_valid;
		public Boolean is_email_verified;
		public String email;
		public Boolean has_gender;
		public Boolean gender_needs_agreement;

		@Data
		public class Profile {
			public String nickname;
		}
	}
}
