package com.orakgarak.vo;

public class SimulationRank {
	
	private String userId;
	private long totalAsset;
	private long rank;
	
	public SimulationRank() {
		super();
	}

	public SimulationRank(String userId, long totalAsset, long rank) {
		super();
		this.userId = userId;
		this.totalAsset = totalAsset;
		this.rank = rank;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getTotalAsset() {
		return totalAsset;
	}

	public void setTotalAsset(long totalAsset) {
		this.totalAsset = totalAsset;
	}

	public long getRank() {
		return rank;
	}

	public void setRank(long rank) {
		this.rank = rank;
	}

}
