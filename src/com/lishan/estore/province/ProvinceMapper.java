package com.lishan.estore.province;



import java.util.List;

public interface ProvinceMapper {

	public List<Province> getProvince(Integer parentid)throws Exception;
}
