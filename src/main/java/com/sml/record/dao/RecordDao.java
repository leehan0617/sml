package com.sml.record.dao;

import java.util.HashMap;
import java.util.List;

public interface RecordDao {
	public List<HashMap<String, Object>> getAllRecordList(String sport);
}
