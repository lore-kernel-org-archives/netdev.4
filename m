Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997307;
	b=fcszzHexM9qQSaGxUfLtp6YoNYg83X5Fx3lIjWiI5pk3LTP0+o1jMRViML8s9c/yMSIT
	 WvzSYPPF56HDtpJuOJDYNLw9IsB4Tff8M5RSrwblf2CWTETYHlUXuZF/tR1DVgr2o3rcY
	 5IiorE5LS1TJae+65PFTtH+t19gJn/YQ9cm+rgqUEIEsXtYd6SWZMvxYrZPj1NY5tcIpd
	 3GBvZQZF0YKVdTLB5mdHcAjL9WuGJm4RqAz2eaNSmWLv4kjafbC5VqMUlMMrCPVZQJaFd
	 Dsx1+b3vnlaoxXuZNgTWd1MiAupu6Vrn5bXRzYWGpw5Pj07tPhhWq390F3EQQmL8qLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
	b=xCK3WzkCY5Tpv/rD1lymTyeiM/292bY3WLPcCbFqGNwsLmS9QDp1NmS71zk2QU4bjLlN
	 qDAFjAZZ4nYcC26y93Lh86SFM8JXuguoDGvx3PI9UhPS9QSjM69Cu//Hkn7iGhDgiQetp
	 4F1MT7YeqFNP6pylZmE5tp3Hmek1WxIAZpqDd2XmE9tv68+VlW8lSNjLtuS3R7rS8W/zb
	 /wK6njAZVlSWL8HsBluxFikYpYBnxjOL4N4kK5o31gQ8jXua79KCzXoZJACzOW6q5aScz
	 rR8lxTHQQS+EVN5HTOSq46Iwrvdx/lSe+MZ0PZEZ9U3oGfo7VuZ0zHUr/N9bK8+yvYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU4bYpyz;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C83606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C83606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU4bYpyz
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-920fed989b2so6410186d6.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997306; x=1795602106; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
        b=BU4bYpyzpln6vZPMuIQM2DiZhzvlWv3UrOF8HiTMlCx9epoczmdAlqona7iT71/xPK
         xQZcHXmpkmOGqbS+IqrsIi4I/vCGTDwE0ogByZ1KhpwjzRyOSxcTbzBa7WpJzxFiS1Zd
         Il/HokkCS/e1n6/KvDdLx+eUywc8IYUJT/iKUz3QRnQVbBnlAGC76FdapV+y4hAFp/8T
         eELeXTSkXEO+Tx/nBx+i3Zxul1hACemoZj94gmtP2cItO4JSwtx7iDyzOZ8wdYwiG1CT
         t2aOGZ6hRwvNzznHQKCQBZsQYFh2d5I2WmSu/yHKMC1vSut5dj3bAkKFWBc2FKvh9icf
         E80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997306; x=1795602106;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
        b=ptblOPcabBf1cCCcEzmC/CNWYYOzFE5Si8neQ2EfxMbqRm+QeesyyGPZbxK1U4312K
         CX2KOYlaNz1GxZ1soXnftKx6dfxCM1iXfAcjy5rTOMBuH5GtxfzOQqeXkO/US6f5lkE2
         1JG3KpisTgwtKOn+NeAKO403uarxxh/6zKocLcQ0BYd4WXlbTiOByZfoNPs7605QK5Jj
         /uARTN1dSIG5OoAM7jIudjZQ9tQD0MtoogmNGu4Q3dMyahmrkhoEBCYPg3dMkfHuze0u
         piNV9yUpczrZQyh6x6E4z8rm+niY2vknZ5JtEeHJo8/U3ivg04E1uDB7fHspLLPIeAqy
         B3uw==
X-Forwarded-Encrypted: i=1; AL+hErHD6UXSaeGf0IrYGDub+SeWGJmi/eTfxBsh5haqB1bW4t3qWCZ6B97mdDQSE9v1H8aI6wyOql0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ObGHuGubl5bUBUOZVSf7dX08+5yAAtpf4mhPc3K4Yb/97bwCS
	W5uzbJvMHP5UreSt+p+loorLx2DtsKuvu6RPomyP2NLdP0R63eaIy3Vq
X-Gm-Gg: AZFdTZfW/RtpQdSBSPA0yUjF21GDm11e1o3VIyve9SMFn7oPMz5BLTbSygQMRtVJqic
	/cRsOfvy435Wr5uJmkSgVAQir/5b83LytW1+LYaBwN9hlbR9Of7SfJdDPWg/DaG9MJU0usj2Jfy
	ruTFl7O+EeMFI8giSrveDKuaLqQJBQRqYtyAhxjyRv19aioWtpD3ysA2U5gr/fyCR9RaHfP3wPx
	mS5WdoqxZqiGGCUqmCYbfAFCdj0S8U9mOSVWqwA+gldHv/nD5DumosGsaXJJWtRKWnt9jBDSofj
	EjdpFhvy+S842km0YqgVert+WA3QHdJiM+3o8NP8wjPhV16KhO/ol54q5IafrmTyxdn+dW2Xheu
	die5dM5qebwo2Rh8a/l9hXTqOc3CyixQzddQ0jPvGGJnRGR17eEXRZOQIiZXx1LblXjtghv3JEK
	r9L6j69qwRHAoIJXK3ySQK4QJNxTEqUryAR02F6iSns/iqIWhsacYkqeH7g5dCfBrMG9RekzISP
	F7D3hTCyj2q7cDroYsUTCsGNJ84SGX8JMpQVMjKhq2uC2RjBZIm9tBSPYLgonftvzCYjCh1SFaa
	sE3NAS0qrtZG8cEXqoKyf0s9Mn9fAG/+0Q==
X-Received: by 2002:a05:6214:3f88:b0:91e:9811:7a2e with SMTP id 6a1803df08f44-92114f415c1mr27630356d6.13.1794997306087;
        Wed, 18 Nov 2026 02:21:46 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c5csm17918346d6.31.2026.11.18.02.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:21:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 05:21:44 -0500
Message-Id: <DMY9FTQ22U8T.JKYB4HL8J8PH@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <dimitri.daskalakis1@gmail.com>,
 <mohsin.bashr@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast
 address lists
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
 <179499313262.3136.12811016164943625265@kernel.org>
In-Reply-To: <179499313262.3136.12811016164943625265@kernel.org>

On Wed Nov 18, 2026 at 4:12 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The unicast and multicast lists are synced in the wrong order
>   in __mpnic_set_rx_mode()=E2=80=A6
>
> --
>
> eth: mpnic: sync unicast and multicast address lists
>
> This commit adds the secondary unicast and multicast addresses to the
> MACDA TCAM and advertises IFF_UNICAST_FLT. When either list outgrows the
> table, the driver falls back to promiscuous or all-multicast mode. A
> per-slot users count is kept so the same address can sit in both dev->uc
> and dev->mc.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/ne=
t/ethernet/meta/mpnic/mpnic_netdev.c
>> index 43547a7d6e5c7..c01e276c4a74d 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>
> [ ... ]
>
>> @@ -35,7 +53,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd=
,
>>  		mac_addr->state =3D MPNIC_TCAM_S_ADD;
>>  	}
>> =20
>> -	if (!netdev_hw_addr_list_empty(mc))
>> +	err =3D __hw_addr_sync_dev(uc, netdev, mpnic_addr_sync,
>> +				 mpnic_addr_unsync);
>> +	if (err =3D=3D -ENOSPC)
>> +		uc_promisc =3D true;
>> +
>> +	err =3D __hw_addr_sync_dev(mc, netdev, mpnic_addr_sync,
>> +				 mpnic_addr_unsync);
>> +	if (err =3D=3D -ENOSPC)
>>  		mc_promisc =3D true;
>
> [Severity: Medium]
> Can the device get stuck in unicast promiscuous mode here, even though a
> TCAM slot is free?
>
> The uc and mc lists share the same MACDA slots (between
> MPNIC_TCAM_MACDA_BROADCAST_IDX and MPNIC_TCAM_MACDA_HOST_ADDR_IDX). The
> whole uc pass, both its flush and its add phase, runs before the mc pass
> flushes stale multicast entries.
>
> Consider this sequence:
>
> 1. The table is full of multicast entries and a secondary unicast
>    address U is added. mpnic_macda_sync() returns -ENOSPC, U stays at
>    sync_cnt =3D=3D 0, and mpnic_promisc_sync() enables unicast promisc.
>
> 2. A multicast address M is then removed. The core runs
>    netif_rx_mode_run()->mpnic_set_rx_mode()->__mpnic_set_rx_mode().
>
> 3. The uc pass retries U. M's slot is still MPNIC_TCAM_S_VALID, so
>    mpnic_macda_free() rejects it, mpnic_macda_sync() returns -ENOSPC
>    again, and uc_promisc is set.
>
> 4. The mc flush runs only after that. It calls mpnic_macda_unsync() on M:
>
> 	if (!--mac_addr->users)
> 		mac_addr->state =3D MPNIC_TCAM_S_DELETE;
>
>    mpnic_write_macda() then frees the slot.
>
> The reverse case works. A unicast removal can make room for a pending
> multicast address, because the uc flush runs before the mc add.
>
> Would it make sense to flush stale entries from both lists before either
> add phase runs?
>

I see this more as a low severity issue, because having the device be in
promiscuous mode when a slot is free is not incorrect, just not optimal.

If anything I would probably just rerun __hw_addr_sync_dev() on the uc
list again after the mc one, if the first call returned -ENOSPC. I
didn't think that was really worth it when this same comment came up in
local review though.

> [ ... ]
>
>> @@ -53,7 +78,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev=
,
>>  	struct mpnic_net *mpn =3D netdev_priv(netdev);
>> =20
>>  	if (netif_running(netdev))
>> -		__mpnic_set_rx_mode(mpn->mpd, mc);
>> +		__mpnic_set_rx_mode(mpn->mpd, uc, mc);
>> =20
>>  	return 0;
>>  }
>
> Because mpnic_set_rx_mode() always returns 0, netif_rx_mode_run() never
> calls netif_rx_mode_schedule_retry() for the case above.
>
> mpnic_service_task() doesn't re-run the rx mode sync either. So U stays
> unsynced and the promisc entry (zero mask) stays installed until some
> unrelated rx-mode event happens. The commit message says:
>
>   Advertise IFF_UNICAST_FLT so we don't need to use promiscuous mode to
>   handle extra unicast addresses.
>
> The later patch in the series, "eth: mpnic: support changing the MAC
> address", keeps the same uc-then-mc ordering.

