package com.baiyaotech.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.baiyaotech.bean.Employee;
import com.baiyaotech.bean.Employer;
import com.baiyaotech.bean.JobInfo;
import com.baiyaotech.bean.JobRecord;
import com.baiyaotech.connection.OracleConnection;

public class Dao {

	private OracleConnection oc = new OracleConnection();

	public Dao() {

	}

	// ʵ����ͨ�û�ע��
	public boolean signup(Employee employee) {
		try {
			Connection conn = oc.getCon();
			String sql = "insert into employee(employeeId,university,position,password,contact) "
					+ " values(?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, employee.getEmployeeId());
			ps.setString(2, employee.getUniversity());
			ps.setString(3, employee.getPosition());
			ps.setString(4, employee.getPassword());
			ps.setString(5, employee.getContact());
			ps.execute();
			System.out.println("��ͨ�û�ע��ɹ���");
			return true;
		} catch (SQLException e) {
			System.out.println("��ͨ�û�ע��ʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// ʵ�ֹ���ע��
	public boolean signup2(Employer employer) {
		try {
			Connection conn = oc.getCon();
			String sql = "insert into employer(employerId,company,description,position,password,contact)"
					+ " values(?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, employer.getEmployerId());
			ps.setString(2, employer.getCompany());
			ps.setString(3, employer.getDescription());
			ps.setString(4, employer.getPosition());
			ps.setString(5, employer.getPassword());
			ps.setString(6, employer.getContact());
			ps.execute();
			System.out.println("����ע��ɹ���");
			return true;
		} catch (SQLException e) {
			System.out.println("����ע��ʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// ʵ����ͨ�û���¼
	public Employee login(String employeeId) {
		try {
			Connection conn = oc.getCon();
			String sql = "select * from employee " + " where employeeId=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, employeeId);
			ResultSet rs = ps.executeQuery();
			Employee employee = null;
			while (rs.next()) {
				employee = new Employee();
				employee.setEmployeeId(rs.getString("employeeId"));
				employee.setPassword(rs.getString("password"));
				employee.setUniversity(rs.getString("university"));
				employee.setPosition(rs.getString("position"));
				employee.setContact(rs.getString("contact"));
			}
			System.out.println("��¼�ɹ���");
			return employee;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��¼ʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ��ȡ�û��ͼ�ְ��Ϣ
	public ArrayList<JobRecord> getInformation() {
		try {
			Connection conn = oc.getCon();
			String sql = "select e.employeeId,e.university,e.contact,j.jobTitle,j.position,er.company from employee e,JobInfo j,JobRecord r,employer er "
					+ " where e.employeeId=r.employeeId and j.jobId = r.jobId and er.employerId = j.employerId order by e.employeeId";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Employee employee = null;
			JobInfo jobInfo = null;
			JobRecord jobRecord = null;
			ArrayList<JobRecord> information = new ArrayList<JobRecord>();
			while (rs.next()) {
				employee = new Employee();
				jobInfo = new JobInfo();
				jobRecord = new JobRecord();
				employee.setEmployeeId(rs.getString("employeeId"));
				employee.setUniversity(rs.getString("university"));
				employee.setContact(rs.getString("contact"));
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setCompany(rs.getString("company"));
				jobRecord.setEmployee(employee);
				jobRecord.setJobInfo(jobInfo);
				information.add(jobRecord);
			}
			System.out.println("��ȡ�û��ͼ�ְ��Ϣ�ɹ���");
			return information;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ�û��ͼ�ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ʵ�ֹ�����¼
	public Employer login2(String employerId) {
		try {
			Connection conn = oc.getCon();
			String sql = "select * from employer " + " where employerId=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, employerId);
			ResultSet rs = ps.executeQuery();
			Employer employer = null;
			while (rs.next()) {
				employer = new Employer();
				employer.setEmployerId(rs.getString("employerId"));
				employer.setPassword(rs.getString("password"));
				employer.setCompany(rs.getString("company"));
				employer.setDescription(rs.getString("description"));
				employer.setPosition(rs.getString("position"));
				employer.setContact(rs.getString("contact"));
			}
			System.out.println("��¼�ɹ���");
			return employer;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��¼ʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ������ְ��Ϣ
	public boolean publishJob(JobInfo jobInfo) {
		String sql = "insert into jobInfo(employerId,jobTitle,description,surplus,position,price,time,total,duration,category,location,contact,bond) "
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			Connection conn = oc.getCon();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobInfo.getEmployerId());
			ps.setString(2, jobInfo.getJobTitle());
			ps.setString(3, jobInfo.getDescription());
			ps.setInt(4, jobInfo.getSurplus());
			ps.setString(5, jobInfo.getPosition());
			ps.setString(6, jobInfo.getPrice());
			ps.setString(7, jobInfo.getTime());
			ps.setInt(8, jobInfo.getTotal());
			ps.setString(9, jobInfo.getDuration());
			ps.setString(10, jobInfo.getCategory());
			ps.setString(11, jobInfo.getLocation());
			ps.setString(12, jobInfo.getContact());
			ps.setString(13, jobInfo.getBond());
			ps.execute();
			System.out.println("������ְ�ɹ�");
			return true;
		} catch (Exception ex) {
			System.out.println("������ְʧ��");
			return false;
		}
	}

	// ��ȡĳ����˾�������ļ�ְ
	public ArrayList<JobInfo> getJob(String employerId) {
		ArrayList<JobInfo> jobList = new ArrayList<JobInfo>();
		try {
			Connection conn = oc.getCon();
			String sql = "select * from jobInfo " + " where employerId=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, employerId);
			ResultSet rs = ps.executeQuery();
			JobInfo jobInfo;
			;
			while (rs.next()) {
				jobInfo = new JobInfo();
				jobInfo.setJobId(rs.getString("jobId"));
				jobInfo.setEmployerId(employerId);
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setDescription(rs.getString("description"));
				jobInfo.setSurplus(rs.getInt("surplus"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setPrice(rs.getString("price"));
				jobInfo.setTime(rs.getString("time"));
				jobInfo.setTotal(rs.getInt("total"));
				jobInfo.setDuration(rs.getString("duration"));
				jobInfo.setCategory(rs.getString("category"));
				jobInfo.setLocation(rs.getString("location"));
				jobInfo.setContact(rs.getString("contact"));
				jobInfo.setChecked(rs.getString("checked"));
				jobInfo.setBond(rs.getString("bond"));
				jobList.add(jobInfo);
			}
			System.out.println("��ȡ�ѷ�����ְ��Ϣ�ɹ���");
			return jobList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ�ѷ�����ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ���չ������������ְ��Ϣ
	public ArrayList<JobInfo> searchJob(String category) {
		ArrayList<JobInfo> jobList = new ArrayList<JobInfo>();
		try {
			Connection conn = oc.getCon();
			String sql = "select j.jobId,j.employerId,j.jobTitle,j.description,j.surplus,j.position,j.price,j.time,j.total,j.duration,j.category,j.location,j.contact,j.bond,e.company"
					+ " from jobInfo j,employer e where j.employerId=e.employerId and category = ? and checked='��ͨ��'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			JobInfo jobInfo;
			;
			while (rs.next()) {
				jobInfo = new JobInfo();
				jobInfo.setJobId(rs.getString("jobId"));
				jobInfo.setEmployerId(rs.getString("employerId"));
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setDescription(rs.getString("description"));
				jobInfo.setSurplus(rs.getInt("surplus"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setPrice(rs.getString("price"));
				jobInfo.setTime(rs.getString("time"));
				jobInfo.setTotal(rs.getInt("total"));
				jobInfo.setDuration(rs.getString("duration"));
				jobInfo.setCategory(category);
				jobInfo.setLocation(rs.getString("location"));
				jobInfo.setContact(rs.getString("contact"));
				jobInfo.setCompany(rs.getString("company"));
				jobInfo.setBond(rs.getString("bond"));
				jobList.add(jobInfo);
			}
			System.out.println("������ְ��Ϣ�ɹ���");
			return jobList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("������ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ��ȡ����ͨ����˵ļ�ְ��Ϣ
	public ArrayList<JobInfo> getJobs() {
		ArrayList<JobInfo> jobList = new ArrayList<JobInfo>();
		try {
			Connection conn = oc.getCon();
			String sql = "select j.jobId,j.employerId,j.jobTitle,j.description,j.surplus,j.position,j.price,j.time,j.total,j.duration,j.category,j.location,j.contact,j.bond,e.company"
					+ " from jobInfo j,employer e where j.employerId=e.employerId and checked='��ͨ��'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			JobInfo jobInfo;
			;
			while (rs.next()) {
				jobInfo = new JobInfo();
				jobInfo.setJobId(rs.getString("jobId"));
				jobInfo.setEmployerId(rs.getString("employerId"));
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setDescription(rs.getString("description"));
				jobInfo.setSurplus(rs.getInt("surplus"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setPrice(rs.getString("price"));
				jobInfo.setTime(rs.getString("time"));
				jobInfo.setTotal(rs.getInt("total"));
				jobInfo.setDuration(rs.getString("duration"));
				jobInfo.setCategory(rs.getString("category"));
				jobInfo.setLocation(rs.getString("location"));
				jobInfo.setContact(rs.getString("contact"));
				jobInfo.setCompany(rs.getString("company"));
				jobInfo.setBond(rs.getString("bond"));
				jobList.add(jobInfo);
			}
			System.out.println("��ȡ����ͨ����˼�ְ��Ϣ�ɹ���");
			return jobList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ����ͨ����˼�ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ��ȡ���еļ�ְ��Ϣ
	public ArrayList<JobInfo> getAllJobs() {
		ArrayList<JobInfo> jobList = new ArrayList<JobInfo>();
		try {
			Connection conn = oc.getCon();
			String sql = "select j.jobId,j.employerId,j.jobTitle,j.description,j.surplus,j.position,j.price,j.time,j.total,j.duration,j.category,j.location,j.contact,j.checked,j.bond,e.company"
					+ " from jobInfo j,employer e where j.employerId=e.employerId ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			JobInfo jobInfo;
			;
			while (rs.next()) {
				jobInfo = new JobInfo();
				jobInfo.setJobId(rs.getString("jobId"));
				jobInfo.setEmployerId(rs.getString("employerId"));
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setDescription(rs.getString("description"));
				jobInfo.setSurplus(rs.getInt("surplus"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setPrice(rs.getString("price"));
				jobInfo.setTime(rs.getString("time"));
				jobInfo.setTotal(rs.getInt("total"));
				jobInfo.setDuration(rs.getString("duration"));
				jobInfo.setCategory(rs.getString("category"));
				jobInfo.setLocation(rs.getString("location"));
				jobInfo.setContact(rs.getString("contact"));
				jobInfo.setChecked(rs.getString("checked"));
				jobInfo.setCompany(rs.getString("company"));
				jobInfo.setBond(rs.getString("bond"));
				jobList.add(jobInfo);
			}
			System.out.println("��ȡ���м�ְ��Ϣ�ɹ���");
			return jobList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ���м�ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ��Ӽ�ְ
	public boolean addJob(String jobId, String number) {
		String sql = "insert into jobRecord(employeeId,jobId) "
				+ " values(?,?) ";
		try {
			Connection conn = oc.getCon();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, number);
			ps.setString(2, jobId);
			ps.execute();
			System.out.println("��Ӽ�ְ�ɹ�");
			return true;
		} catch (Exception ex) {
			System.out.println("��Ӽ�ְʧ��");
			return false;
		}
	}

	// �����ְ
	public boolean checkJob(String jobId, String result) {
		try {
			Connection conn = oc.getCon();
			String sql = "update jobInfo " + " set checked=? where jobId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, result);
			ps.setString(2, jobId);
			ps.execute();
			System.out.println("�����ְ�ɹ���");
			ps.close();
			return true;
		} catch (SQLException e) {
			System.out.println("�����ְʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// �ж��Ƿ��Ѿ�������ĳ����ְ
	public boolean hasJoined(String number, String jobId) {
		try {
			Connection conn = oc.getCon();
			String sql = "select id from jobRecord "
					+ " where employeeId=? and jobId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, number);
			ps.setString(2, jobId);
			ResultSet rs = ps.executeQuery();
			String id = null;
			while (rs.next()) {
				id = rs.getString("id");
			}
			if (id != null) {
				System.out.println("���û�����Ӵ˼�ְ");
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("���û���δ��Ӵ˼�ְ��");
			e.printStackTrace();
			return false;
		}
	}

	// ���¼�ְʣ������
	public boolean updateSurplus(String jobId) {
		try {
			Connection conn = oc.getCon();
			String sql = "update jobInfo "
					+ " set surplus=surplus-1 where jobId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobId);
			ps.execute();
			System.out.println("���¼�ְ�����ɹ���");
			ps.close();
			return true;
		} catch (SQLException e) {
			System.out.println("���¼�ְ����ʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// ȡ����ְ�����ʣ������
	public boolean addSurplus(String jobId) {
		try {
			Connection conn = oc.getCon();
			String sql = "update jobInfo "
					+ " set surplus=surplus+1 where jobId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobId);
			ps.execute();
			System.out.println("ȡ������¼�ְ�����ɹ���");
			ps.close();
			return true;
		} catch (SQLException e) {
			System.out.println("ȡ������¼�ְ����ʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// ʵ���û���ְ��¼
	public ArrayList<JobInfo> getRecord(String number) {
		try {
			Connection conn = oc.getCon();
			String sql = "select j.jobId,j.employerId,j.jobTitle,j.description,j.surplus,j.position,j.price,j.time,j.total,j.duration,j.category,j.location,j.contact,j.checked,e.company"
					+ " from jobInfo j,employer e where j.employerId=e.employerId and jobId in ( select jobId from jobRecord"
					+ " where employeeId=? )";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, number);
			ResultSet rs = ps.executeQuery();
			ArrayList<JobInfo> records = new ArrayList<JobInfo>();
			JobInfo jobInfo = null;
			while (rs.next()) {
				jobInfo = new JobInfo();
				jobInfo.setJobId(rs.getString("jobId"));
				jobInfo.setEmployerId(rs.getString("employerId"));
				jobInfo.setJobTitle(rs.getString("jobTitle"));
				jobInfo.setDescription(rs.getString("description"));
				jobInfo.setSurplus(rs.getInt("surplus"));
				jobInfo.setPosition(rs.getString("position"));
				jobInfo.setPrice(rs.getString("price"));
				jobInfo.setTime(rs.getString("time"));
				jobInfo.setTotal(rs.getInt("total"));
				jobInfo.setDuration(rs.getString("duration"));
				jobInfo.setCategory(rs.getString("category"));
				jobInfo.setLocation(rs.getString("location"));
				jobInfo.setContact(rs.getString("contact"));
				jobInfo.setCompany(rs.getString("company"));
				records.add(jobInfo);
			}
			System.out.println("��ȡ���û���ְ��¼�ɹ���");
			return records;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ���û���ְ��¼ʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ȡ����ְ
	public boolean cancelRecord(String number, String jobId) {
		try {
			Connection conn = oc.getCon();
			String sql = "delete from jobRecord where employeeId = ? and jobId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, number);
			ps.setString(2, jobId);
			ps.execute();
			System.out.println("��ȡ���û���ְ��¼�ɹ���");
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ���û���ְ��¼ʧ�ܣ�");
			e.printStackTrace();
			return false;
		}
	}

	// ��ȡ����ĳ����ְ���û���Ϣ
	public ArrayList<Employee> getEmployees(String jobId) {
		ArrayList<Employee> employees = new ArrayList<Employee>();
		try {
			Connection conn = oc.getCon();
			String sql = "select e.employeeId,e.contact "
					+ " from jobRecord j,employee e where j.employeeId = e.employeeId and j.jobId = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobId);
			ResultSet rs = ps.executeQuery();
			Employee employee;
			while (rs.next()) {
				employee = new Employee();
				employee.setEmployeeId(rs.getString("employeeId"));
				employee.setContact(rs.getString("contact"));
				employees.add(employee);
			}
			System.out.println("��ȡ����ĳ����ְ���û��ɹ���");
			return employees;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ���м�ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}

	// ��ȡ����ĳ����ְ���û���Ϣ
	public ArrayList<Employee> getJobEmployees(String jobId) {
		ArrayList<Employee> employees = new ArrayList<Employee>();
		try {
			Connection conn = oc.getCon();
			String sql = "select e.employeeId,e.university,e.position,e.contact "
					+ " from jobRecord j,employee e where j.employeeId = e.employeeId and j.jobId = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, jobId);
			ResultSet rs = ps.executeQuery();
			Employee employee;
			while (rs.next()) {
				employee = new Employee();
				employee.setEmployeeId(rs.getString("employeeId"));
				employee.setContact(rs.getString("contact"));
				employees.add(employee);
			}
			System.out.println("��ȡ����ĳ����ְ���û��ɹ���");
			return employees;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("��ȡ���м�ְ��Ϣʧ�ܣ�");
			e.printStackTrace();
			return null;
		}
	}
}
