Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407953;
	b=gv+ncVAiUKcLadWX12Jm3ZpT3VCKybQoPDzzWnA6nykesrSj5GzIPdxyjCsj27F+y+WD
	 Nm/bY28B3JJicWMplirXrDQkPDHi/oT8sx/6Il3NNfga4YwPHPEIxx4RpVyh64ctsjtyu
	 YIcRi7BQWxAhWooBZYEoFb9BkmaeP/iWSM8b5GXidw+F7DKchA7tKsTwgKMrs6DyuC6+l
	 jhsJsFKY/5Nh5O3nXPVBU+6fTCRy2Kaf+TkmmXAQHLrhmpPQyI0coO6sWCNZgAj6Z1y/7
	 rh1shXd3/iWp/YXqIS7TFsEXYN0ip56NPIw6l4E2LAtdCv4M/Pkii9/+GuxgNteERdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407953;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mIrCdA0qGbmqLh668sryfvpvDhm4dRnadj/wyFO9Zms=;
	b=CWPGiRUlMxbxwdPuH03iNfLb+caCr/Bj0sm8cjyVkg/Vd2hfnpr+7KS3cHNTIXRLZd8r
	 Nr4MiFqZr1+4Mt+LWIr5iO5et5oggeDCXTs8tSh5gOLderwu6tKzjmz8leTPwbaA9N05b
	 F+3ACtSCFI1N+cqb0jl8uzWeCty2ogi6yAaKnq6BOiLJNFRnyOge9rVNbnzP/bqFOJtoO
	 PnUwxQm25PI+Ze6KOwB5mY9Ttm5kSHnDLHCqdpJJL4xjPkBXjjRQEkvYoM8xDZ4ooTe4e
	 QbhmOzyf8gc6gOjo+RX3ttUGSAwS35Od3XYq0e6t7MjdM2AqNO6u/NXFOu1aaiRZy5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibYwFnmF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88B9606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibYwFnmF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55E61F000CF;
	Mon, 23 Nov 2026 04:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795407953;
	bh=mIrCdA0qGbmqLh668sryfvpvDhm4dRnadj/wyFO9Zms=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ibYwFnmFo2GjvVbfU7GQDtGMX5CwzKpgYR9lxog9E6u8dqaDkBK0TWXFWOUsewo86
	 MZkZTiNV7ULYhO91pb0qRJX8IBbjyVJ9BIoc2j1hrd6ghBUZ/hNLEybF8+B8PvHgsZ
	 EmKuuPooy9tpxJNDkUvP+O4qkTFjJLHi7SQFO1An5mJOCHhXyNzDmuhqBLr1XQo9ig
	 9yGjC9sIpiAgpoLG7d44+DYmfQirm2xCGW1YOuWYUAbGVoWDpclMqHOepZzVr1/Q4I
	 3qoarJcSxmAID8sZElowWKbMdrmrVp0M6wDRlCaQt1OKcbzUJor6gFgE9oYoQ2CQ1X
	 F4oNH7trlZrOg==
Subject: Re: [PATCH net-next v5 1/6] ionic: write the extra_stats invalid
 markers one counter at a time
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Mon, 23 Nov 2026 04:25:52 +0000
Message-ID: <179540795235.3135.479285551896184785@kernel.org>
In-Reply-To: <20261118-ionic-get-fec-stats-v5-1-c9c0ee63df4c@amd.com>
References: <20261118-ionic-get-fec-stats-v5-1-c9c0ee63df4c@amd.com>
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

- [Medium] The patch makes only the writer side single-copy atomic.

--

ionic: write the extra_stats invalid markers one counter at a time

ionic_port_init() used to mark the extra_stats block invalid with a
memset(). It now writes IONIC_STAT_INVALID to each __le64 counter with
WRITE_ONCE(). The goal is that a counter read on its own is either a
complete value or the marker.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
> index 9955ab77d86d0..b8d0ce5971769 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c

[ ... ]

> @@ -745,8 +748,9 @@ int ionic_port_init(struct ionic *ionic)
>  	/* If the driver knows about more "extra stats" than the firmware,
>  	 * make sure these stats are marked as invalid.
>  	 */
> -	memset(&idev->port_info->extra_stats, 0xff,
> -	       sizeof(idev->port_info->extra_stats));
> +	stat = (__le64 *)&idev->port_info->extra_stats;
> +	for (i = 0; i < sizeof(idev->port_info->extra_stats) / sizeof(*stat); i++)
> +		WRITE_ONCE(stat[i], IONIC_STAT_INVALID);

[Severity: Medium]
This change only covers the store side. Is the existing ethtool -S
reader of these same markers still exposed to the torn read that the
commit message describes?

The .get_fec_stats handler added later in the series reads each counter
with READ_ONCE(), so it gets the intended guarantee. But
ionic_extra_port_stats_get_count() in ionic_stats.c still takes its
snapshot with a plain aggregate struct copy:

drivers/net/ethernet/pensando/ionic/ionic_stats.c:ionic_extra_port_stats_get_count() {
    ...
	*pes_cache = idev->port_info->extra_stats;

	if (pes_cache->rx_bits_phy != IONIC_STAT_INVALID)
		count++;
    ...
}

The compiler can lower that struct copy to memcpy() or to inline copies
of any width. That is the same objection the commit message makes
against memset(). The series leaves this line unchanged.

Here is the race. Firmware reset recovery runs from deferred work
without rtnl:

ionic_lif_deferred_work()->ionic_lif_handle_fw_up()->ionic_port_init()

It can overlap this rtnl-held ethtool path:

ionic_get_stats_count()->ionic_sw_stats_get_count()->
    ionic_extra_port_stats_get_count()

The netif_device_present() checks in the ethtool ioctl and netlink paths
don't close this window. ionic_lif_handle_fw_down() calls
netif_device_detach() without synchronizing against rtnl holders, so a
caller that passed the check before the detach can still overlap the
later marker writes.

In that case, a torn rx_bits_phy (some 0xff bytes, some old-value bytes)
could pass the IONIC_STAT_INVALID test and get cached. Then
ionic_extra_port_stats_get_strings() and
ionic_extra_port_stats_get_values() would report a bogus rx_bits_phy to
userspace. The plain read racing the WRITE_ONCE() stores is also an
unmarked data race, which KCSAN could flag.

Should the ethtool -S snapshot use per-counter READ_ONCE() loads, at
least for rx_bits_phy? Otherwise, could the commit message say that the
"complete value or the marker" guarantee only applies to readers that
use READ_ONCE() on each counter?

>  
>  	WRITE_ONCE(idev->link_down_count_init, false);
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c%40amd.com
