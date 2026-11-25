Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603134;
	b=iWqzwHn+e9JG9hPYRVRwTmnrR66qSnccnQ0Ftd8TV5/QwmFtxn0oeb5q8Xbpx83FWenA
	 jJeOHhNtYLr+6MIAZsWqSipwhjn4oP7IcGjKxrOI/rpFQQkTVoKcvLNaqDcQHBIF/W5LY
	 hkWdS4NRcvDhxRSHymxNYAXttzkYs1Un3sTOCKopcLPBhbswGP/L9uzbS32wi93LxhaH3
	 3Xt5vzStBYjAcPeWOaZJmCaQmZvhc2skW9gIbhzHSs3W/E8gAHiYTdpCj7gNPufVxI+X4
	 RK1I8X8zKa7WvNXt21cPIkEcI03bzUzjBuGiDzSHDq9ZinBQhOb76VVaFzDXfYTP1xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603134;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9y7XH+PLern6auh6Gbq/rf63+INrrfk86Hf/UHK5e4U=;
	b=vzAsqwRu3zEF0Op8wZMH/T2FKQW7EIhWqskERPga7xVHFH0ZN0WSaR5zzvq1W33Y2vnn
	 SoaCdilfee0wSLchH642E6lKmYDELDvN4GcdIRm1rMwmPSBqtskH+ptfrw0V9es+tad7j
	 rXUKxptOLmkpcth4duJz2h/I3MQrOZ5k71GG2qYRqH/lpMhMfQI1kDobSncBmePesGobl
	 ArLSq6cYmu/sNv0JsCQ0FtCAiyKPGtLR/OtUX+sIHkOwMPVeJwhZboA4Wiczbc8CHGbrY
	 JbM+6HSvMyrgRLze3lf6A38lS0c/c9gttFOgBeVh6YiwPjiGf9RQaPmSb4/+4kKpKoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfZDXLZx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081F606A323;
	Wed, 25 Nov 2026 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lfZDXLZx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A281F000D1;
	Wed, 25 Nov 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795603133;
	bh=9y7XH+PLern6auh6Gbq/rf63+INrrfk86Hf/UHK5e4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lfZDXLZx/EchyFSyjJiLa54bfLNyLXwJ+6PHF0mZ0g3aOTh65AJ8bmVwThTr6s005
	 w2iV8ERkYVL0OcXStlrpSUNotdo4HWZ4RVu1WGV1Ebsv3sLZBfZOey5MQySFoNiLqP
	 ziTLy8G2u7+z8ptMXG+JRNGCgXCRjVMU4sCoVJfKu3Ay5xniYFgyEF0JGtTGiXtIJe
	 c9YG7Ax1/eE6abmaRLr+uMBO8hxuvdaI7W5OYl+CuMqBKjv1k7dYhaIdac6vfa4oWf
	 YAOuZGy7nkZxf38rz69VAmxFVL6UGhRqY2IX6UrEqjhop9JSjWGpmlxwAD5HGlcAxK
	 tBtcICA4sGIqA==
Date: Wed, 25 Nov 2026 10:38:49 +0000
From: Simon Horman <horms@kernel.org>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
	liuyonglong@huawei.com, chenhao418@huawei.com,
	yangshuaisong@h-partners.com, ningwei15@huawei.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
Message-ID: <20261125103849.GQ31322@horms.kernel.org>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
 <20261118130330.3026625-4-shaojijie@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118130330.3026625-4-shaojijie@huawei.com>

On Wed, Nov 18, 2026 at 09:03:29PM +0800, Jijie Shao wrote:
> NAPI polling on hns3 is driven by hardware RX interrupts. Under
> memory pressure, RX skb and frag allocations fail, packets are no
> longer reaped from the hardware rx ring. Once the ring fills, the
> hardware stops generating RX interrupts and NAPI is never scheduled
> again -- even after memory becomes available, leaving the interface
> deadlocked.
> 
> Break the deadlock by adding a software recovery path that re-arms
> NAPI via a 250ms delayed_work, independent of hardware interrupts.
> A per-ring bitmap tracks which RX rings are in OOM state; the work
> function schedules NAPI for the vector backing each affected ring.
> OOM state is marked when an RX allocation failure is detected in the
> poll path and cleared when the delayed_work fires.
> 
> This supersedes the busy-poll recovery from commit 68752b24f51a
> ("net: hns3: schedule the polling again when allocation fails"),
> which returned budget on allocation failure to keep NAPI polling
> and caused CPU spinning under prolonged memory pressure. Now
> hns3_clean_rx_ring() returns recv_pkts instead of budget on
> allocation failure, letting NAPI exit and the delayed_work take
> over. The exit refill is still attempted for the descriptors
> accumulated since the last refill, so the head pointer is written as
> before; descriptors from earlier iterations are not re-armed when an
> allocation failure short-circuits the in-loop refill.
> 
> Add a per-ring rx_oom_cnt ethtool counter, incremented for each NAPI
> poll that hits an RX allocation failure. It is a diagnostic counter
> for this recovery path, not the standard rx-alloc-fail qstat.
> 
> The bitmap is allocated in hns3_init_all_ring() and freed in
> hns3_uninit_all_ring(). It is allocated after every ring is set up,
> so a failure inside hns3_init_all_ring() leaves nothing behind, and
> it is reused because hns3_set_ringparam() calls hns3_init_all_ring()
> without hns3_uninit_all_ring(). The delayed_work is cancelled in
> hns3_uninit_all_ring() before the rings and the bitmap are released,
> and also in hns3_nic_uninit_vector_data() before the NAPI instances
> are torn down.
> 
> hns3_nic_net_down() does not cancel the work, so a pending work may
> still run after the interface goes down. If it runs while DOWN is
> set, it clears the per-ring bits without scheduling NAPI. If the
> interface is brought back up within the 250ms window, it sees the
> stale bits with DOWN cleared and schedules NAPI for those rings once,
> ending in a single extra poll round with no packet to clean. Both
> outcomes are harmless.
> 
> Fixes: 68752b24f51a ("net: hns3: schedule the polling again when allocation fails")
> Signed-off-by: Jijie Shao <shaojijie@huawei.com>

Reviewed-by: Simon Horman <horms@kernel.org>

