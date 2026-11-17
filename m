Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950062;
	b=cw2/oR7SHj0+ADRlxaivjR0dEzMuqOARPRlhSgd8bxVz4EgIrTMIS6xiUOHQ7EnZUVYS
	 pcCrwlTyt1RVaRCqEEpooQgRWj/aY8V5syNc+7nf9xZi66P31msf3O/Ji15AXWz0Gb5cY
	 /kW0dgmQmk3QyFvRLLV23PVqnmYZ2lW9AJ47MhFAh66K0TISPftyjlOaR4anSO8jSdUat
	 T6iZZqYryXKzAA9MDXxttjae2ELkU8n7nfNtq3ZysnVSyobUSMCWxjqz6ORVS/vmig8XT
	 hbLA4Hd69lcdRJ13GKtGjWZUmXkAT6AsDI3J/hfIA2AjOdDR0GLizRyWYEJuL01nEnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950062;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SdPRRe+HXuGNV3z6Rw6BrKjM2bO4XfhywsJ6yCYXhJw=;
	b=qbjeRXrKbkTnhzIPJp2ZRQi7RTL7zlhQjQOeb8Y2Qbo7dS1SRS7XwqGm2qSqx81o3xqe
	 RH1+AduMezVIpXAnnxQ2HYbxvXWimQrWYPQO85RKou7KXlEfchS8MOcE0979UrEmgsL1t
	 q8KE8t261ycoHReX5zwZS81nhSW109jbYJHxX8jbQFUtj0Fr65dI3nL7IZnFzDGaqgTSv
	 gR+LL2fe9ZD+Kz8EJn94QZVmUsdMouxz9pWLmD/PyHQXQ7cQppHi4L9ZES3IdxpmjPxgY
	 JpO8MnlrUKFrw0ps5oCWphlMiK7AZDJqIDBTiRwZVuifyrUMk242wtVvik0SybrG8NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrOU4LAu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A7A606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrOU4LAu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5551F000C4;
	Tue, 17 Nov 2026 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950062;
	bh=SdPRRe+HXuGNV3z6Rw6BrKjM2bO4XfhywsJ6yCYXhJw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IrOU4LAu3uOhwDADT/RlwMKStCrvK59zzrEn1Ju74GtJK79wyV+ZdECXjT6GGlQoC
	 DXfYg/2qu2Juuy6DTRooi5FZvgDN61AKx17rJVFpxMcD9a7oii9yjJ4FGKSucMHvXN
	 sxbRyKGuUp47mIlxsFhPNQz2v0ygjYY4g1JIx1t+ozIYqhZeDgi711XXgQ7BG2G5XB
	 QI9pI+e2GCV7sodfihiX2JinamFG/TkCzAlybv/D1bIW0ee8HavSLKi0LQjgz69Dm3
	 krIZvfdnPrGf9RBCDUuSXf7Sd43nFdeSE5az8Ld3NnGCqjh7EcOp9Ehy6QqSpRFbbQ
	 SYC/bxeO0cOwQ==
Subject:
 Re: [net PATCH 3/6] fbnic: Cover all of the HW stats with the stats lock
From: netdev-bot+sashiko@kernel.org
To: alexander.duyck@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com
Date: Tue, 17 Nov 2026 21:14:21 +0000
Message-ID: <179495006109.3136.9222422977894063290@kernel.org>
In-Reply-To: <179460250360.8819.2203630667210523871.stgit@ahduyck-xeon-server.home.arpa>
References: <179460250360.8819.2203630667210523871.stgit@ahduyck-xeon-server.home.arpa>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message and Fixes: tag describe a race that cannot
  happen at this commit.

--

fbnic: Cover all of the HW stats with the stats lock

This patch puts the fbnic MAC stats under hw_stats.lock. The lock is now
taken in the ethtool pause, eth-mac, eth-ctrl and rmon getters and in
fbnic_reset_hw_stats(), and the ASSERT_RTNL() is gone. It also drops
rtnl_lock() from the PCIe stats debugfs read.

> That is no
> longer the case. ethtool only takes RTNL on the Netlink path for the
> operations a driver lists in op_needs_rtnl, and fbnic lists only the
> pause getter among the stats ones, so the eth-mac, eth-ctrl and rmon
> getters update the MAC stats with only the netdev instance lock held,
> racing each other and the reset.

[ ... ]

> Fixes: 45079e00133e ("net: ethtool: optionally skip rtnl_lock on Netlink path for GET ops")

[Severity: Medium]
Can the race described here actually happen at this commit?

fbnic is ops-locked. fbnic_netdev_alloc() sets queue_mgmt_ops
unconditionally:

    netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;

That makes netdev_need_ops_lock() true, so netdev_lock_ops() really takes
netdev->lock for this device.

ethnl_default_doit() takes that lock around prepare_data() whether or not
RTNL is needed:

    if (need_rtnl)
        rtnl_lock();
    netdev_lock_ops(req_info->dev);
    }
    ret = ops->prepare_data(req_info, reply_data, info);

The dump path does the same, and the notify path asserts the same lock.
The only core callers of the fbnic get_eth_mac_stats, get_eth_ctrl_stats,
get_rmon_stats and get_pause_stats callbacks are stats_prepare_data() and
pause_prepare_data(). So the getters are already serialized against each
other by the instance lock.

fbnic_reset_hw_stats() has two callers. fbnic_init_hw_stats() runs from
fbnic_probe() before the netdev is allocated or registered, so no ethtool
request can reach the device yet. __fbnic_pm_attach() holds the same
instance lock around the reset:

    rtnl_lock();
    netdev_lock(netdev);

    fbnic_reset_hw_stats(fbd);

Nothing else touches fbd->hw_stats.mac or calls the fbd->mac->get_*_stats
callbacks.

After 45079e00133e, the old comment and ASSERT_RTNL() in
fbnic_reset_hw_stats() were out of date. But netdev->lock still seems to
serialize every path that touches the MAC stats.

The locking change itself looks fine as a consistency cleanup. Later in
this series the reset moves into __fbnic_pm_resume() and runs under
hw_stats.lock only, without netdev_lock. That later change is what makes
the lock added here necessary.

Could the commit message say that the instance lock already serializes
these paths, and that this patch makes hw_stats.lock the single
protection to prepare for the later reset move? Could the Fixes: tag
also be dropped, or could the message name a path that actually reaches
the race? As written, the tag may lead to this being backported to
stable as a fix for a race that does not exist there.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179460241885.8819.7179935130629202331.stgit%40ahduyck-xeon-server.home.arpa
