package cn.gdpu.service;

import org.junit.Test;



public class DateAddingTest{

	@Test
	public void dateAdd() {
		
		AdminServiceTest ast1 = new AdminServiceTest();
		try {
			ast1.setUpBeforeClass();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ast1.add();
		System.out.println("---------------------管理和助理数据添加完成------------------");
		InstituteServiceTest ist = new InstituteServiceTest();
		try {
			ist.setUpBeforeClass();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ist.add();
		System.out.println("---------------------学院和班级数据添加完成------------------");
		StudentServiceTest sst = new StudentServiceTest();
		try {
			sst.setUpBeforeClass();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sst.add();
		System.out.println("---------------------学生数据添加完成------------------");
		GroupServiceTest gst = new GroupServiceTest();
		try {
			gst.setUpBeforeClass();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		gst.add();
		System.out.println("---------------------学习小组数据添加完成------------------");
		ActivityServiceTest ast = new ActivityServiceTest();
		try {
			ast.setUpBeforeClass();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ast.addType();
		System.out.println("---------------------学术活动类型与学术活动数据添加完成------------------");
		ast.apply();
		System.out.println("---------------------学习申请加入学术活动数据添加完成------------------");
	}
}
