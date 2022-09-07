package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int movieUpdate(MovieVO v) throws SQLException { // 영화 정보 업데이트 메소드

		conn = DBcon.getConnection();
		String sql = "insert into movie values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, v.getMoviename());
		pstmt.setString(2, v.getPoster());
		pstmt.setString(3, v.getMovietime());
		pstmt.setString(4, v.getAge());
		pstmt.setString(5, v.getTheater());
		pstmt.setString(6, v.getShowtime1());
		pstmt.setString(7, v.getShowtime2());
		pstmt.setString(8, v.getShowtime3());
		pstmt.setString(9, v.getShowtime4());
		pstmt.setString(10, v.getShowtime5());

		int result1 = pstmt.executeUpdate();

		int result = 0;

		if (result1 == 1) {
			result = 1;
		}

		return result;
	}

	public int ticket(TicketVO v) throws SQLException { // 입력받은 값들을 ticket vo 에 담아서 dao를통해 테이블에 등록하는 메소드
		Connection conn = DBcon.getConnection();
		String sql = "insert into ticket values(i_num.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, v.getMovie());

		pstmt.setString(2, v.getAge());

		pstmt.setString(3, v.getPeople());

		pstmt.setString(4, v.getTheater());

		pstmt.setString(5, v.getSeat1());
		pstmt.setString(6, v.getSeat2());
		pstmt.setString(7, v.getSeat3());
		pstmt.setString(8, v.getSeat4());
		pstmt.setString(9, v.getSeat5());

		pstmt.setString(10, v.getShowtime());

		pstmt.setString(11, v.getPaymunt());

		pstmt.setString(12, v.getPrice());

		pstmt.setString(13, v.getTel());

		int result = pstmt.executeUpdate();

		return result;
	}

	public int refund(String ticketnum) throws SQLException { // 티켓 환불처리 메소드
		Connection conn = DBcon.getConnection();
		String sql = "delete from ticket where i_num=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ticketnum);
		int result = pstmt.executeUpdate();

		return result;
	}

	public int ticketLookup(String ticket, String tel) throws SQLException { // 티켓번호 또는 전화번호로 조회 후 티켓출력 및 조회 메소드

		Connection conn = DBcon.getConnection();

		String sql = "select * from ticket where i_num = ? or tel=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ticket);
		pstmt.setString(2, tel);
		int result = 0;
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}

	public int parkingPaymunt(String carnum) throws SQLException { // 주차정산 결제 메소드

		Connection conn = DBcon.getConnection();

		String sql = "delete from parking where carnum = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, carnum);

		int result = pstmt.executeUpdate();

		return result;
	}

	public int movieDelete(String theater, String moviename) throws SQLException { // 영화 삭제 메소드
		Connection conn = DBcon.getConnection();
		String sql = "delete from movie where moviename = ? and theater = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, moviename);
		pstmt.setString(2, theater);
		int result = pstmt.executeUpdate();

		return result;

	}

	public int parkingInsert(String carnum, String enttime) throws SQLException { // 주차정산 테스트 샘플 등록
		Connection conn = DBcon.getConnection();
		String sql = "insert into parking values(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, carnum);
		pstmt.setString(2, enttime);

		int result = pstmt.executeUpdate();
		return result;
	}

}
