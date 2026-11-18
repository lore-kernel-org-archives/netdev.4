Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996267;
	b=ETyqdV9y8KeEfR+OoKmgeggJPgfrpWVJVAqjod/LaX+VyNW1gviHUf0PED17Quvwgjz8
	 B2EEqtvHVvQyV5nIENGqWNKnuCikJVKl1cdEfmPIqhW2mC2+boEbLkFgoWYejXKzRo+55
	 6dZEBIoIwoxNH7HXHVBT6u9XdRnrNnrp8ztx4zpFF6c/Favg2cKO5QRRxO9Kk8QLpSd6A
	 YcFVLmacd2E2oJTmrX9Ip4B55oCKVOsqzlWcP4x7BwoYk4TlkutM7oZIKYODKSKPvLtTX
	 gOHwPI7TmVbKVXcISSiKTh0ebEE8G6bcxOZ9MnO3M4qwVsCJyRRgVgAFVAKOWLqUuvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=Q3ss+bMAywcoTR+sv0KAcM3aywyzYmassgWdS2br2Xg=;
	b=OeiTZ2ezf0F69OprH0r/NtqZe4y9d3GywuK0A0mB0RZDkBQuDKTnrPxb3LR0z+LzFB1T
	 VGGfmx6wPw+p6+sw8xDcKO9QK7R3D1AAQx7cDFkeW9Get6yY0bKLOzznqBQexFppXHrQA
	 3m42uIbkCNa3NxGW6qbzzdihH1KvaOh846bRCXmgBXlcCUcPsQZYRFSlHb0iwUc95o8G+
	 HJ0CR+PXjdZaMBtddxIb6/W5CtEbZI+c/8HKR6iRdCUSs7BP9YpwnchzGMc5boEHEtAL2
	 ecE7ecnkGQkAD3BPenYTYwGK41UIFKushoG4IH4Gjh1x4TT028Z2a1p23jMaafzvS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V7COnju1;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF07606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BF07606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V7COnju1
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d03bfd477so8360451cf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996266; x=1795601066; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3ss+bMAywcoTR+sv0KAcM3aywyzYmassgWdS2br2Xg=;
        b=V7COnju1jRjM9JtJL2wiAUsC9gP1sU+i5NBC4oK3EFqERfMEnn/Gqiyz6wLAv3X3JW
         6FjO7//qLwCCl1QNaSV7fRnn13bLbqbCrH+vlCba4zEcb61hqZ+/u7xK2jnUqcfSLqUm
         ZrizwfanSAFZOmFJVd8zemdSaMioUQ/7O+8N+wYXMAhF5Ue45HAPjRw6PJ9FADnSsqvu
         fRUTBtmJgSJ23wnLszuwG/3Z2RDKdqqtkoc9cBQ0KAz1rqiXI3U1zNpZNkvUet9Lo4gL
         nJwT9rynfQ2f+Sre2co+j57mLjssJbzrIm+VSJenkLNnUL56tV2aHu2wSyNKz3FTiatK
         F3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996266; x=1795601066;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3ss+bMAywcoTR+sv0KAcM3aywyzYmassgWdS2br2Xg=;
        b=nAqjFR674OShtoMvsrXYcIuzL6rBBeYVQnekslnPf8ENiuSSkYhO6zkGvLVPC0a8oF
         J+kULj2hHR84wv46cxvfllXnnc39rLpovNKXbEZi2GRB/a/1sa79IVT9G5yr/LnAlMXg
         FksGpJChVqny3bRELNW8GJezgSUVrG8EirFEVnMNNa73BUmsX/OZFHr+T18dclbuLTye
         f9UHEXyOYyO+6kwncabiTc5Pn/wgsezMDLSYZD5dKKKSVZPPfilJI9l2sQ+BhxqOi6rz
         c4B0pVj+3xXjSazbu3aTgFe03CBX+yxc2y2PS6h4Kcrpf8Y6VHedTM/1ytLL9wsyXbTW
         qj/g==
X-Forwarded-Encrypted: i=1; AL+hErHc+MyFwk9ZS/UZ86QqDIdw86HVhKvvSFeSbNqJjoudRxA07B+PKBi/xI3TA1EDGkof9mKmxg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oGpF/7BRLCauoYuieVyCoyAMfuqTEF6gMOT5PfVh3opiomM0L
	udcJ9DejBBQvfz/mjSuP/4p2zsUmEGd1k4ARmMLFuACmrCZ5YtJYunFj
X-Gm-Gg: AYBFou0rGb3IAmIm951+MiYH7eGZWPbtitHGSP1A3mIANfqpnxPoR8hIuQ0JbNqwWH7
	JbLozP2mBKf1dkK6sfjHXiO4qyw91EhS2xHpkIvmrYjlZdxubvGap+CkgXIUknDM2hhC62ZiLod
	rywgTPc+eEHzg5uU+vDxqaXK3bYLJ6dJgA186W+CFh5jmvKLFBp+foJDnEUuJkgyUSonzZhVaXF
	wYQqk8b4UA8xNPTdirnV0R75O9oouukOaRHQTfUdufflREWRIvYAPiA6ZxI6jr7VXPpkoi86eB8
	ctLgS/EFfdVHJE9fTxK3R3QxBtWzWErtMjzjeAUOUlPiJPM8Cb7jazesPfzHviE8Tm4ADkEpibs
	nFvi+w66lngwJMle8hyV9/RpYZxRsjVTTSJOtzqszj7kUCEktQ1mrPEgzRokcANwzWR4fyR1f4l
	zXNyZTPE2yQ5ZKV58RrPFbU+ki0WGJX9bo+gCfy+/zuSC/CPb/SN9XXK7OnYXH3L12rkqnw0sl2
	iO08X6T39J/cK4gKRujadf/3kCE4cH4ptOs6DbfLF534+4UAAhMm+GJO6GoiTZmCAGMcjlgX1z0
	+ROMoe6pxINJx8uQknsM8Co2fXtEzx9r+A==
X-Received: by 2002:ac8:5a91:0:b0:55c:7769:9a0a with SMTP id d75a77b69052e-55d5a3224bfmr33606021cf.5.1794996265839;
        Wed, 18 Nov 2026 02:04:25 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d638cesm17505736d6.29.2026.11.18.02.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:04:25 -0800 (PST)
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
Date: Wed, 18 Nov 2026 05:04:24 -0500
Message-Id: <DMY92K13JB4A.2KW6B4PA2L6A1@gmail.com>
Subject: Re: [PATCH net-next 2/4] eth: mpnic: add promiscuous and
 all-multicast filters
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <dimitri.daskalakis1@gmail.com>,
 <mohsin.bashr@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-mpnic-l2-oot-v1-2-8dc6eb3582b0@gmail.com>
 <179499313144.3136.4262860920559871885@kernel.org>
In-Reply-To: <179499313144.3136.4262860920559871885@kernel.org>

On Wed Nov 18, 2026 at 4:12 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] On every ndo_stop, mpnic_clear_rx_mode()
>   (drivers/net/ethernet/meta/mpnic/mpnic_netdev.c, called from=E2=80=A6
>
> --
>
> eth: mpnic: add promiscuous and all-multicast filters
>
> This commit implements IFF_PROMISC and IFF_ALLMULTI using the last DMAC
> TCAM entry, which matches either every address or only the multicast bit.
> It also changes the default action on TCAM misses from pass to drop.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/ne=
t/ethernet/meta/mpnic/mpnic_netdev.c
>> index 16611813db555..43547a7d6e5c7 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>
> [ ... ]
>
>> @@ -54,6 +64,7 @@ static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
>> =20
>>  	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state =3D MPNIC_TCAM_S_DELETE=
;
>>  	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state =3D MPNIC_TCAM_S_DELETE=
;
>> +	mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX].state =3D MPNIC_TCAM_S_DELETE;
>
> [Severity: Low]
> Should this check for MPNIC_TCAM_S_VALID before moving the promisc entry
> to delete?
>
> The broadcast and host address entries are always valid while the
> interface is up. The promisc entry is usually MPNIC_TCAM_S_DISABLED,
> though. That is its state whenever IFF_PROMISC and IFF_ALLMULTI are both
> clear and the mc list is empty, and also after mpnic_promisc_sync() has
> already removed it.
>
> The state comment in mpnic_rpc.h only lists valid as a source of delete:
>
>  *  Valid     1	-> Delete     3
>  *  Delete    3	-> Disabled   0
>
> The other place this patch adds that deletes the same entry follows
> that rule:
>
> mpnic_promisc_sync() {
>     ...
> 	} else if (mac_addr->state =3D=3D MPNIC_TCAM_S_VALID) {
> 		mac_addr->state =3D MPNIC_TCAM_S_DELETE;
> 	}
> }
>
> With ip link set dev X up and no promisc/allmulti flags set, followed by
> ip link set dev X down, the path is mpnic_stop()->mpnic_clear_rx_mode()
> ->mpnic_write_macda(). This takes a disabled entry straight to delete,
> and then issues an UNLOAD_TRIG for entry 1023 even though it was never
> loaded.
>
> The extra unload looks harmless, because mpnic_rxb_init() already
> unloads every entry at init. The remaining problem is that the code no
> longer matches the documented state ordering, and the two delete sites
> behave differently.
>
> This is still the case at the end of the series. The later commit "eth:
> mpnic: sync unicast and multicast address lists" updates the same
> comment to add "Delete 3 -> Add 2". It does not add a disabled to delete
> transition, and it does not add a state check here.
>
> Could this either check the state, the way mpnic_promisc_sync() does, or
> document disabled to delete as an allowed transition?
>

A check is not necessary. If I respin a v2, I'll adjust the comment, but
I think overall this isn't an issue.

>> =20
>>  	mpnic_write_macda(mpd);
>>  }
>
> [ ... ]

