Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993132;
	b=0Q4THspvZb3ghkBoRaDkakn0kKes1bS0XW2vy0relaCxN5JMw3VSrYLFM/bkcv/Fkm6T
	 oJSmixePn5zxS5vO54a7uQkupf+MupA+u/VeQcEIju99ql7PjOH9oN+Y+DQG/4M/0zkL/
	 ePwnSy73EXS9xR+zZ7v6T5EFBMKeRYPBTPqP4Few9y+Wq+XLBjJ6ee4xGyKtj4O9+AV5U
	 U/i/PbxDtcKVxoRxuKl72do4H5UCMSwVmBoCE+vmD+2V+Ut6ThlTv9HHbU7YhwD2M6E0q
	 /yPWmfCSWy05+ic65thu+PONWPYVEezfyEt3sL6WyIVY6aBjZ7DX0GmzzID/+lSb7aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993132;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1x0JvTH95xlVccUSIz+p1toU0TMB79EnxF+TvySYDik=;
	b=CCFPLxBYcTO909v/qOzm5Ta7sB3DspePUm8u7Pkhl/M0A8PoekX+TWpJYXmXgzuTAKDw
	 AsQicJ3PG6o8xft3sMGnaLQxU5/wyBuOcKM77CWx/02KukWhc4UBKoSvMgSUVnuFjoRPs
	 TQcosV4orM9viSgeqKU7VqyAmyrspdLkZM64pn8+HfMLVkY3FNZYl1IQshxRG6Bohr3QH
	 Dpf+H8lkoo9jK/4E4ZYQCGZxb6zPEIECdv+Aomja5hNE/GmCBKFnwwpRTBgdSERULzZss
	 Pt2T0GkhcwugfCXadY+dv9a1GfTrxz0iCWNAr2b/7QwY/RyummH/1oGpnFyKcARcoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1URnl7s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE9606A89A;
	Wed, 18 Nov 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1URnl7s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56601F000C4;
	Wed, 18 Nov 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993132;
	bh=1x0JvTH95xlVccUSIz+p1toU0TMB79EnxF+TvySYDik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O1URnl7samSzWAfKkFnwmg2lkOkTknHxowI0kSwtp9/Hs0N62CaLDELNm4wi7KP4G
	 6Kw3tMtk3B4+yph4HL2ex962gNz6zoDy7UyZ4qLUbDD4JK7Yne767Mtw3zqOcYvWOl
	 3OpogKjm6BL4GoVk6VBzBIQmwDkde8cS4YtbcP/CoOK1q7GgQ9i6VCDIOHjZ5yzBj5
	 wh+6llTmZn0bcq3jZ9p1CW8+6j3infvvcy4uC9suBlTrxEDg1uLGVxDCCdUaMhDqvm
	 7WvTD1w2buZVBfG3X7LVCgl4jcToK5yyJYS/qPXOJbQuThdSYhJUqON97HZlqAcqnm
	 1+sWLYh3ho06g==
Subject: Re: [PATCH net-next 2/4] eth: mpnic: add promiscuous and
 all-multicast filters
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, dimitri.daskalakis1@gmail.com, mohsin.bashr@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 09:12:11 +0000
Message-ID: <179499313144.3136.4262860920559871885@kernel.org>
In-Reply-To: <20261116-mpnic-l2-oot-v1-2-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-2-8dc6eb3582b0@gmail.com>
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

- [Low] On every ndo_stop, mpnic_clear_rx_mode()
  (drivers/net/ethernet/meta/mpnic/mpnic_netdev.c, called from…

--

eth: mpnic: add promiscuous and all-multicast filters

This commit implements IFF_PROMISC and IFF_ALLMULTI using the last DMAC
TCAM entry, which matches either every address or only the multicast bit.
It also changes the default action on TCAM misses from pass to drop.

> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
> index 16611813db555..43547a7d6e5c7 100644
> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c

[ ... ]

> @@ -54,6 +64,7 @@ static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
>  
>  	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
>  	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
> +	mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX].state = MPNIC_TCAM_S_DELETE;

[Severity: Low]
Should this check for MPNIC_TCAM_S_VALID before moving the promisc entry
to delete?

The broadcast and host address entries are always valid while the
interface is up. The promisc entry is usually MPNIC_TCAM_S_DISABLED,
though. That is its state whenever IFF_PROMISC and IFF_ALLMULTI are both
clear and the mc list is empty, and also after mpnic_promisc_sync() has
already removed it.

The state comment in mpnic_rpc.h only lists valid as a source of delete:

 *  Valid     1	-> Delete     3
 *  Delete    3	-> Disabled   0

The other place this patch adds that deletes the same entry follows
that rule:

mpnic_promisc_sync() {
    ...
	} else if (mac_addr->state == MPNIC_TCAM_S_VALID) {
		mac_addr->state = MPNIC_TCAM_S_DELETE;
	}
}

With ip link set dev X up and no promisc/allmulti flags set, followed by
ip link set dev X down, the path is mpnic_stop()->mpnic_clear_rx_mode()
->mpnic_write_macda(). This takes a disabled entry straight to delete,
and then issues an UNLOAD_TRIG for entry 1023 even though it was never
loaded.

The extra unload looks harmless, because mpnic_rxb_init() already
unloads every entry at init. The remaining problem is that the code no
longer matches the documented state ordering, and the two delete sites
behave differently.

This is still the case at the end of the series. The later commit "eth:
mpnic: sync unicast and multicast address lists" updates the same
comment to add "Delete 3 -> Add 2". It does not add a disabled to delete
transition, and it does not add a state check here.

Could this either check the state, the way mpnic_promisc_sync() does, or
document disabled to delete as an allowed transition?

>  
>  	mpnic_write_macda(mpd);
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0%40gmail.com
