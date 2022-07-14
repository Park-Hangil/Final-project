package kh.spring.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.DTO.ClassDTO;
import kh.spring.DTO.CommunityDTO;
import kh.spring.DTO.ImgDTO;
import kh.spring.DTO.MemberDTO;
import kh.spring.DTO.RegStdsDTO;
import kh.spring.DTO.ReplyDTO;
import kh.spring.DTO.ReviewDTO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSession mybatis;

	// id로 회원정보 불러오기
	public MemberDTO select(String email) {
		return mybatis.selectOne("Mypage.select", email);
	}

	// 회원탈퇴
	public int delete(String email) {
		return mybatis.delete("Mypage.delete", email);
	}

	// 연락처, 닉네임만 수정
	public int updateInfo(MemberDTO dto) {
		return mybatis.update("Mypage.updateInfo", dto);
	}

	// 프로필 이미지 수정
	public int updateImage(String email, String sysName) {
		Map<String, String> param = new HashMap<>();
		param.put("profile_img", sysName);
		param.put("email", email);

		return mybatis.update("Mypage.updateImage", param);
	}

	// 프로필 이미지 삭제
	public int deleteImage(String email) {
		return mybatis.delete("Mypage.deleteImage", email);
	}

	// 내가 구매한 클래스 정보
	public List<ClassDTO> buyClass(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.buyClass", map);
	}

	// 내가 좋아요한 클래스
	public List<ClassDTO> likeClass(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.likeClass", map);
	}

	// 내가 등록한 클래스 정보
	public List<ClassDTO> regClass(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.regClass", map);
	}

	// 내가 작성한 리뷰
	public List<ReviewDTO> classReview(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.classReview", map);
	}

	// 내가 작성한 커뮤니티 글 보기
	public List<CommunityDTO> viewPost(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.viewPost", map);
	}

	// 내가 작성한 댓글 보기
	public List<ReplyDTO> viewReply(String email) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", "");
		map.put("end", "");
		return mybatis.selectList("Mypage.viewReply", map);
	}

	public List<Object> selectByPage(String email, int start, int end, String category) {
		if (category.equals("t1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.buyClass", map);
			return list;
		} else if (category.equals("t2")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.likeClass", map);
			return list;
		} else if (category.equals("t3")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.regClass", map);
			return list;
		} else if (category.equals("t4")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.classReview", map);
			return list;
		} else if (category.equals("c1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.viewPost", map);
			return list;
		} else if (category.equals("c2")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<Object> list = mybatis.selectList("Mypage.viewReply", map);
			return list;
		}
		return null;
	}

	public List<ImgDTO> picList(String email, int start, int end, String category) {
		if (category.equals("t1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<ImgDTO> list = mybatis.selectList("Mypage.buyPic", map);
			return list;
		} else if (category.equals("t2")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<ImgDTO> list = mybatis.selectList("Mypage.likePic", map);
			return list;
		} else if (category.equals("t3")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<ImgDTO> list = mybatis.selectList("Mypage.regPic", map);
			return list;
		} else if (category.equals("t4")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			List<ImgDTO> list = mybatis.selectList("Mypage.reviewPic", map);
			return list;
		} else if (category.equals("c1")) {
			Map<String, String> map = new HashMap<>();
			map.put("email", email);
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));

			System.out.println(email + start + end);

			List<CommunityDTO> list = mybatis.selectList("Mypage.getPost", map);
			System.out.println("리스트 사이즈는용 : " + list.size());
			List<ImgDTO> list2 = new ArrayList<>();

			for (CommunityDTO dto : list) {
				String board_seq = dto.getBoard_seq();
				System.out.println("나는 보드 시퀀스 : " + dto.getBoard_seq());
				if (mybatis.selectList("Mypage.postPic", board_seq).size() == 0) {
					System.out.println("사진이 없어요");
					list2.add(new ImgDTO("e" + board_seq, " ", " ", " ", board_seq));
				} else {
					System.out.println("사진이 있어요");
					list2.addAll(mybatis.selectList("Mypage.postPic", board_seq));
				}
			}
			return list2;
		}
		return null;
	}

	// 내가 등록한 클래스의 수강신청인원
	public List<Object> getStdCount(String email, int start, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));

		List<Object> list = mybatis.selectList("Mypage.getStdCount", map);
		return list;
	}

	// 클래스 상세보기 - class_seq로 찾기
	public List<ClassDTO> getClassDetail(String class_seq) {
		return mybatis.selectList("Mypage.getClassInfo", class_seq);
	}

	// 클래스 상세보기 - 클래스 등록현황
	public List<RegStdsDTO> getRegiDetail(String class_seq) {
		return mybatis.selectList("Mypage.getRegiDetail", class_seq);
	}

	// 클래스 상세보기 - 내가 등록한 클래스의 리뷰
	public List<ReviewDTO> allClassReview(String parent_seq) {
		return mybatis.selectList("Mypage.allClassReview", parent_seq);
	}

	// 마이페이지 메인 화면 사용 - 구매한 클래스
	public List<ClassDTO> buyClassList(String email) {
		List<String> list = mybatis.selectList("Mypage.getBuyClass", email);
		List<ClassDTO> list1 = new ArrayList<>();

		for (String str : list) {
			String class_seq = str;
			list1.addAll(mybatis.selectList("Mypage.getClassInfo", class_seq));
		}
		return list1;
	}

	// 마이페이지 메인 화면 사용 - 구매한 클래스의 사진
	public List<ImgDTO> mainPicList(String email) {
		List<String> list = mybatis.selectList("Mypage.getBuyClass", email);
		List<ImgDTO> list1 = new ArrayList<>();

		for (String str : list) {
			String parent_seq = str;
			list1.addAll(mybatis.selectList("Mypage.mainPicList", parent_seq));
		}
		return list1;
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 커뮤니티 글
	public List<CommunityDTO> getPostList(String email) {
		return mybatis.selectList("Mypage.getPostList", email);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 커뮤니티 글의 댓글수
	public List<Integer> getReplyCount(String email) {
		List<CommunityDTO> list = mybatis.selectList("Mypage.getPostList", email);
		List<Integer> list1 = new ArrayList<>();

		for (CommunityDTO dto : list) {
			list1.addAll(mybatis.selectList("Mypage.getReplyCount", dto.getBoard_seq()));
		}
		return list1;
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 댓글
	public List<ReplyDTO> getReplyList(String email) {
		return mybatis.selectList("Mypage.getReplyList", email);
	}

	// 마이페이지 메인 화면 사용 - 내가 작성한 댓글의 본문
	public List<CommunityDTO> replyPostList(String email) {

		List<ReplyDTO> list = mybatis.selectList("Mypage.getReplyList", email);
		List<CommunityDTO> list1 = new ArrayList<>();

		for (ReplyDTO dto : list) {
			list1.addAll(mybatis.selectList("Mypage.replyPostList", dto.getBoard_seq()));
		}
		return list1;
	}
}
