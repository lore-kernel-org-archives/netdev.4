Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592272;
	b=huk+hZ+Ar8b6i3ZI0sc8pLuKfdF/Wfrd9PWjL2b7CV2eSCnQTJh0IWNyyxznqqVU6RA2
	 IrnaAVIsxaVJ/63GkNTMXJub55jYJGJP4uaEyVL/b+WSfsHXlwltcZARLd07yQV1svKr1
	 Awj3HwDKcxzlsqLRQbNdR5L5Qn2cgfIirihv+PFfpOBh7CaapjVUItfKHkLLsUdaawmmp
	 ggdvXFbmknArElTvIEGdYajP3miDcfE9CTx979Z3rE0zrWbpZ37ouA59rt1G//7tSkf2p
	 WEfz+YPKoZgCwBLuoTdoSfSQmvmOFqdxeBQUiUFCaeaZADRDdZ3YHEmKXQ+WUUUU3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592272;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ZOjLaYx4Dr5j2yndCCgY4NG6T+IceZsHeZCSmK+kO8U=;
	b=FVZl9VII9ARxrlUrYwDhg7tPWjvuIqWlNXdpev34SZ2tyx+/x2plvZi6aKZZEkv5apbC
	 8CxnzqWFrg4c3xSlgpG0/X81oyyMh+OX7ReUI1np5XKg2qa5K4+lTB1KB3JAvBviKwLac
	 Z2UxtxaER4ezkMCKtvXd2Xb0QcveHbsvBhZ4R02vvnGOJEafwfY3QQprMLCf3kifnihPD
	 GnmU12PsvmwNTwlNCkSo9yLfHsQVR6ERi9CL897WHEfOmExr1+q7Kt5sWV0xoTQAXumCq
	 NEahpVcyjWxBNjBk//SxH56veH5dNQYukIknSo28ZvBKTqDFuKVVQLQsAWx147dDi7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF412606A68E;
	Wed, 25 Nov 2026 07:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF412606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz6t1795592177tce07a167
X-QQ-Originating-IP: LdFUREjIl4gGNQIB0sNLmdnlMtTCXCJW8v+3qq6sx10=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 15:36:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10164209693582915750
EX-QQ-RecipientCnt: 10
Date: Wed, 25 Nov 2026 15:36:14 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v3 5/5] net: rnpgbe: Add hardware and queue
 statistics
Message-ID: <F283E54B74613F72+20261125073614.GC752553@nic-Precision-5820-Tower>
References: <DB48C65C5764A9FD+20261124060623.411536-1-dong100@mucse.com>
 <179558856602.3135.7505371780005583025@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179558856602.3135.7505371780005583025@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NAl3ryHMp563Ees00LuXbJ7t7Sx3IZJL8l78K7f1rpQIF8+w34YbrItw
	y8miC+IrmeoN6657dvGUv3a4GngVeAfYKZpfbOwcMo/O4oBt00ec2MJwNfXTfjusvXOqHea
	hUt3aWwbKrI2fQFtMzoswtqPcT9HK+dBtS/IexFyyW9sc5Jg/OupHYIFgP1+4eEoBPs6QyY
	S0hLdnzVem2mtvoXIMsCEb1H0gMDLUkWi4dpTXE6EtWautAkgQdGMnPqcVuKMD18K+PuML7
	e12ZwIiUSSAsnAcx4GuefdbtS/tDgPquF0BMBvo7ZIuW22F0m/ePRjvEJtlyN/4B4n2HVAI
	RC4DjLzag6Hpz3QiDHJ7BNKuIlhIKSyQWABA9SCGku8F74rTOE0AVa7G1pWCwwsi4e4kCpb
	24d1Cd8SQBPZpLhJYF0mGtHOB7ZN/qAQpskREyvVAJFpPGLrEU78RZwA9EohLpqXVU4OMjj
	TVvpRMuYfo/ij5nbV7sB8rXqGH/HBDAvrhpmFk1c9KMitN/50WcCC6l+DUrR/ipWMGY4+J1
	MTWL1Boo5yeV6eAXTK5bxgAk11pST1h2q5tZtJm4QDJz4h3qYCpOUX6yZ9QSVFxL22DdLSc
	xNGPAjsMbSDaS2CREigjHnTQfUI16u2a5pcgcO/76+OPlzniJe/TTvsB/6f4i8IXR956PXB
	nARJN4B3gSBs9UM035uR74rkDCMfscH3AKMprsNFF5bWFqy1WSc/WpWbzd3PsNYEFyybpe/
	ocX9r+zyYBemhECvGC4fe3pX7C32EigYMXZhXsCHL8aYaKUIMu9P2JF5VSxalsBXUFdH9Vi
	f1kL6EM8Rhyv2yzlluGuMqAZUvBAgA21EC0zoNyB75YyLx8ZFL1712V94d9BLlyROjGZPfX
	EmjQWX47ck3s8shMt/1kWLdOy8XjT02208jiiplqColWIPQ3se0nfcsWeCbnsYaH16lM+lK
	8BwYTPAMTBUCqMUpjMwhpUxD2X+Cs/kzUvqlYQS76GvJaHVsjxhc1G9Q5NmDI62PM5vowfY
	w5fjqrYvrTMHyZxRZxidzCEwhVDWq5zDVDIjFD11Tpf3+XP9zwNm2fdrGxIgm7j4XX5EWFU
	GDJ1w/vVwa7XnXby4pWX6gw6Rdlras84Xe8revSMz5947z+egm8/KG167ThEoVp/dKFn+wI
	w8fNCPKyFUTFJeE=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Wed, Nov 25, 2026 at 06:36:06AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 0 � Medium: 1 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] After this patch the driver reports two RX totals that
>   disagree.
> 
> --
> 
> net: rnpgbe: Add hardware and queue statistics
> 
> This commit adds hardware RX CRC-error and multicast counters to
> ndo_get_stats64, accumulated from the service task. It also reports
> per-queue RX/TX packet and byte counters through netdev queue stats, and
> exposes per-queue TX DMA mapping failures through ethtool statistics.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> > index b7b0c45a0f664..fe320c4f389ba 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_lib.c
> 
> [ ... ]
> 
> > @@ -615,6 +620,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
> >  
> >  		/* probably a little skewed due to removing CRC */
> >  		total_rx_bytes += skb->len;
> > +		delivered_bytes += skb->len;
> > +		delivered_packets++;
> >  		rnpgbe_process_skb_fields(rx_ring, skb);
> >  		rx_desc->wb.cmd = 0;
> >  		napi_gro_receive(&q_vector->napi, skb);
> > @@ -626,6 +633,8 @@ static int rnpgbe_clean_rx_irq(struct mucse_q_vector *q_vector,
> >  	u64_stats_update_begin(&rx_ring->stats->syncp);
> >  	rx_ring->stats->packets += total_rx_packets;
> >  	rx_ring->stats->bytes += total_rx_bytes;
> > +	rx_ring->stats->delivered_packets += delivered_packets;
> > +	rx_ring->stats->delivered_bytes += delivered_bytes;
> >  	rx_ring->stats->length_errors += total_rx_length_errors;
> >  	atomic64_add(total_rx_dropped, &rx_ring->stats->dropped);
> >  	u64_stats_update_end(&rx_ring->stats->syncp);
> 
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
> > new file mode 100644
> > index 0000000000000..efd2284fd93af
> > --- /dev/null
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_stats.c
> 
> [ ... ]
> 
> > +static void rnpgbe_get_queue_stats_rx(struct net_device *netdev, int idx,
> > +				      struct netdev_queue_stats_rx *stats)
> > +{
> > +	struct mucse *mucse = netdev_priv(netdev);
> > +	const struct mucse_queue_stats *queue;
> > +	unsigned int start;
> > +
> > +	queue = &mucse->rx_stats[idx];
> > +	do {
> > +		start = u64_stats_fetch_begin(&queue->syncp);
> > +		stats->packets = queue->delivered_packets;
> > +		stats->bytes = queue->delivered_bytes;
> > +	} while (u64_stats_fetch_retry(&queue->syncp, start));
> 
> [Severity: Medium]
> Can this leave the qstat RX totals permanently out of step with the rtnl
> RX totals?
> 
> rnpgbe_get_stats64() adds rx_stats[i].packets and rx_stats[i].bytes into
> rx_packets and rx_bytes. In rnpgbe_clean_rx_irq(), the driver-drop paths
> increase those counters but leave delivered_packets and delivered_bytes
> alone. One example is the skb == NULL path at EOP:
> 
> 	if (!skb) {
> 		atomic64_inc(&rx_ring->stats->skb_alloc_failures);
> 		...
> 			total_rx_bytes += size;
> 			total_rx_packets++;
> 			total_rx_dropped++;
> 
> The MUCSE_RX_DROP_RESOURCE EOP path and the rnpgbe_cleanup_headers()
> failure path with size >= ETH_HLEN behave the same way.
> 
> This callback reports only delivered_* as qstat rx-packets and rx-bytes.
> rnpgbe_get_base_stats() uses the same callback through
> netdev_stat_queue_sum() for the inactive queues. So after the first
> driver RX drop, the rtnl totals stay higher than the qstat totals. An
> skb allocation failure under memory pressure is enough to cause that
> drop. Nothing resets these counters, so the gap never closes.
> 
> The generic selftest expects the two sets of totals to match:
> 
> tools/testing/selftests/drivers/net/stats.py:pkt_byte_sum()
>     # Compare stats, rtnl stats and qstats must match,
>     ...
>         if stat_cmp(rtstat, qstat) > 0:
>             raise KsftFailEx("Qstats are lower, fetched later")
> 
> The commit message says the split is intentional. Even so, could both
> interfaces report the same packet and byte counters? One option is to
> use packets and bytes here. Another is to keep driver drops out of the
> rtnl rx_packets and rx_bytes totals.
> 
After checking the documented semantics, I think these counters can
legitimately differ when the driver drops a good received packet.

include/uapi/linux/if_link.h defines rx_packets as including good packets
received by the host but subsequently dropped, even within the driver.
In contrast, Documentation/netlink/specs/netdev.yaml defines qstats
rx-packets as packets successfully received and passed to the stack.
The corresponding byte counters follow the same distinction.

The pkt_byte_sum selftest can consequently fail after such a drop.
Changing either set of counters solely to satisfy that equality would
conflict with its documented semantics.
> > +	stats->alloc_fail = atomic64_read(&queue->page_alloc_failures) +
> > +			    atomic64_read(&queue->skb_alloc_failures);
> > +}
> 
> [ ... ]
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
> 
