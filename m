Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345438;
	b=dftQ2Rr8Thyk0RaCUFkNp1ONWimwYSb3ZVlsTbxghkhc9pKZYA0iK+7r7+IJaCUFutnU
	 O/CHAnRTkTa36HSL0mY19eftrL+rBZ4B+sJq8QiHchBULsabdVXri02cxZ81yfNYC1RIO
	 NVniw2aT0sgY4iGwV5vx0WrIwGG+73bAnsNUTSYie74Pk1yOfe/H3RAHejqICB5PHySBP
	 Jii15ihpBsgmmQLI1m7AbRs1Q736HPjxwlhaxfyAyiNDCrVMWj/eAZTNjJSmpvwrBjub/
	 LEHzzThNes0HD5nYmz/rcbIsjDIqdI8GmNnRbG0zqfr0cWoWraoWxzypxMTW1dWeW4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345438;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zlL5tiXLL4jgQNgfM7bff8pxYMFjionRbtAB8mOGuHc=;
	b=wMS60rzG0yfeuP/wZty1esdxurIBIpLEx485Qf5G/HiHOru/mgoLa/jeejPRnfAZ7Ve2
	 HwsBCgXs9kUIUKOTWJlDsrSfmPLgsGPEdKbGZJmkxJ+1Z78HnYtT5LugFh3AuWVQLJqdx
	 yH7nUC+6shHqOrl5f9q5nx0LMInwahYbG6as+/OdB09BxQodZsOKAKZyWkL4fj14AR4s2
	 NBGZi/YPwmWnZiAHafzYs+PENj0G8FO5SJQqRNu8kHhaQRfF5wLDUu1TnVCOR569Qd9vs
	 uwz2Z9Y3LtSVMjrjBr/y36aMiXpAxIdRCJh71vcEVhmVIQ2Nnn8Uz68oRVZaz6wU1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR7MnOVp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A9606A320;
	Sun, 22 Nov 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR7MnOVp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1906E1F000C0;
	Sun, 22 Nov 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345437;
	bh=zlL5tiXLL4jgQNgfM7bff8pxYMFjionRbtAB8mOGuHc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CR7MnOVpKnc0SWYSnG7yiGEba8tE9Dnyb/HqVXow/SnFD+7iqx3nd4DTYR96+6kPF
	 dtKBmOf514bc+gQgkmXBcqE4zlXeeKHHn9XVB2dYGeEbaS2Rbq/2HW+fx3O/G0pqTp
	 kMn7fuFi9pZrokVUfcT4lNQoSM6oWmGejvltrMIl7eHzSiItqDzw0EUF0bbTA8BW/g
	 8fUYl2+9gy+v79usD8Z/BTo/4cQhm/ssWCuuie4+vdWa9fT//kcn0MsQ/5E+pWYB5s
	 8No2ty3hV7XRk2gOcTluBT5IlCnzJAdaTb9plJdQP4c7/qI2/SOGeJk6oMViS8kFfC
	 2osjLtn/ebjbw==
Subject: Re: [PATCH net-next v3 2/4] net: dsa: qca8k: drop MIB autocast frames
 once the request is over
From: netdev-bot+sashiko@kernel.org
To: kuncy7@gmail.com
Cc: ansuelsmth@gmail.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 yongzhao.derek@gmail.com, luixo-public@luixo.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 11:03:56 +0000
Message-ID: <179534543662.3135.202577949827301799@kernel.org>
In-Reply-To: <20261118104104.26684-3-kuncy7@gmail.com>
References: <20261118104104.26684-3-kuncy7@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In qca8k_get_ethtool_stats_eth()
  (drivers/net/dsa/qca/qca8k-8xxx.c), the patch now calls…

--

net: dsa: qca8k: drop MIB autocast frames once the request is over

This patch adds a spinlock shared by qca8k_get_ethtool_stats_eth() and the
rx handler to protect the MIB autocast request. The request is retired
(data set to NULL) on exit or once every port has reported, so late frames
no longer write into the freed ethtool buffer. It also replaces the
port_parsed refcount with a ports_seen bitmap, and waits for MIB_BUSY to
clear before sending a new autocast request.

> diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
> index 3c8044a4d1fa1..4de7da9c8ecbe 100644
> --- a/drivers/net/dsa/qca/qca8k-8xxx.c
> +++ b/drivers/net/dsa/qca/qca8k-8xxx.c

[ ... ]

> @@ -1721,13 +1737,25 @@ qca8k_get_ethtool_stats_eth(struct dsa_switch *ds, int port, u64 *data)
>  
>  	mutex_lock(&mib_eth_data->mutex);
>  
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* A request that timed out may have left the switch still sending
> +	 * its autocast. Let it finish before asking for another one, so
> +	 * that as few of its frames as possible are taken for ours.
> +	 */
> +	ret = qca8k_busy_wait(priv, QCA8K_REG_MIB, QCA8K_MIB_BUSY);
> +	if (ret) {
> +		mutex_unlock(&priv->reg_mutex);
> +		goto out;
> +	}

[Severity: Low]
Is it known when the switch clears MIB_BUSY for the QCA8K_MIB_CAST
function?

The commit message says:

  Wait for MIB_BUSY to clear before asking for the next
  autocast, as qca8k_mib_init() does after a flush, so that at most the
  frames already on their way to the host can be taken for the new
  request

That is only true if BUSY stays set until the switch has sent every
autocast frame. The only other user, qca8k_mib_init(), waits on BUSY
after QCA8K_MIB_FLUSH, and a flush sends no frames. Neither the driver
nor commit 5c957c7ca78c says how BUSY behaves for CAST.

Suppose BUSY clears as soon as the counters are captured. Could all seven
frames of a timed-out autocast then arrive after the new request is
published, and fill ports_seen on their own?

There is also a cost when BUSY never clears, for example if the MIB engine
is wedged or the CPU port cannot transmit. qca8k_busy_wait() polls with
sleep_us = 0 and a QCA8K_BUSY_WAIT_TIMEOUT of 2000 ms:

    return regmap_read_poll_timeout(priv->regmap, reg, val, !(val & mask), 0,
                                    QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC);

Here it runs with both mib_eth_data->mutex and priv->reg_mutex held.
Would each ETHTOOL_GSTATS call then poll back to back for up to 2 s
before falling back to register reads? Other reg_mutex users would be
blocked for that time. Before this patch, the same case cost one 5 ms
completion timeout per call.

>  
>  	reinit_completion(&mib_eth_data->rw_done);
>  
> +	spin_lock_bh(&mib_eth_data->lock);
>  	mib_eth_data->req_port = dp->index;
>  	mib_eth_data->data = data;
> -	refcount_set(&mib_eth_data->port_parsed, QCA8K_NUM_PORTS);
> -
> -	mutex_lock(&priv->reg_mutex);
> +	mib_eth_data->ports_seen = 0;
> +	spin_unlock_bh(&mib_eth_data->lock);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118104104.26684-1-kuncy7%40gmail.com
