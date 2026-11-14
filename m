Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677734;
	b=nC/u4KG1TpS7H6BD/4m8zpxD+U64IpZ26xS3R4BDrEs/YU8z1SMog2gydajjWbHBjphp
	 IFaP7wMSn8bQrSHbB40SC04t4Dc8vuBdhIv14cbCIvMQ/g30StnvkSkBOO3qoDBwnQwif
	 E3djfH4E1wgDVa+6LboZB1dNB0zmnyafXcju0nUzWiuLF9Uh2bNzRkTtALJxo08miXGlu
	 GM+RGyji+xkLZL+M4crZVMnrFQ61Et7nf+AAG7CZosPo4p+cP46HY/OSMGBU1JdAV8U53
	 GkoJm/PMnHjbri9o0sJLiSoYMuVwzRQYwwrJM7AlkY40XW3CS3YLaOLGELnzjlo2cLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ya1SkaOxN+nS5fikk2w3MoZXNnvyzLHOp+OqqLQDueM=;
	b=HliCT7qLAfdvCe0BteS4ItwX4gmVw6u40q1OUzHMpbCogeZ+SkLMSyoCl8Dlpi57WRAT
	 mFNJRXpX7sxp4W+fHyjWkAIEVkyy1vjYx4Og8QEhEDP6sW/ToIChF4bZ2tptNQC8putYy
	 82uCQSLTpgJ+Sr+eBhPPaNEz0c7KEWYB4j7C2mXpefHtuLV93wGrDEwfyVk4Uu6wjQquk
	 aUjFS/LYSwn22iT3HlTNNi+sHc/fBzeUxKOvdliz+JjQa9tyK+bn0BA8Bh1bYIy9pTufx
	 7hSycMximXIXRHwseT40LGCHxPTXEL6jnQLosatUOIU4SlHxbX0Lp+dFYyd8HAYbl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LugsiSZs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j66U9PhL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F48606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F48606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LugsiSZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j66U9PhL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDmQLK2218791
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 17:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ya1SkaOxN+nS5fikk2w3MoZX
	NnvyzLHOp+OqqLQDueM=; b=LugsiSZsik90iK3dBFx3l+VUGOfHWx7eatFVAfqS
	+KIfOQdGvqZabGJzU6ZqlxjefnYB+dtqoW1+A1ZrlFHQzsnfdUakG2v8cWa7Ppou
	a8jYG3E8BOE0MfZuO+vN7Xt4wTii41bXBaLJipaY8wQ9lDfN94P87aJBYvF8ZoUQ
	sfE1pSOS+jJx7TOStiUFz1iVuqi4uYXmp8WEjFVSj9hYQjDzjAW80YUUNgYpbVTB
	uDEiHjcEFhpZF2Bk+CmR/2Kerubb8Oj3xKqt0C5hCU2Mi7mWvqZOhiwptK4x1aWt
	nxBpsWFUu8cPWm5GdyYSHF7D8OsUbo5evNTvtViXsxLceQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj41c8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 17:35:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495876f8beso219813085a.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794677732; x=1795282532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ya1SkaOxN+nS5fikk2w3MoZXNnvyzLHOp+OqqLQDueM=;
        b=j66U9PhLIZTGAOOCdCWa8oyE+pYGJbR7inhVetMOjq9Mhmxww8hYKoweoUK0JbxnXP
         os+GpJkmd3rzBdZbSMqEVKUIk1oHsm7EqC5TbN7smIYz9W4TTw0gTnd+jKQX/5rLHsiT
         TD9MAI8zpYO+ILIu9w6XLBMiMQmo2rAP59a9ROJMFJZSVH1Wcx4zxFbcfh7uMGoSykpt
         dpEzhFKJVUTZ4Xg3bW/Yh1IB0aWUqUmvQM9icpKFB2/Fs20UMi0Ex6BgQkNCd6HIXosx
         uEYtzSfzDQNhxJ3rP1mkENui7V2eTPUc0bUfEwPi46SC4vGnobZa8BWUit2KEuV7O49G
         Kx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677732; x=1795282532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ya1SkaOxN+nS5fikk2w3MoZXNnvyzLHOp+OqqLQDueM=;
        b=2zI3o1jAuyVVRpQJi7XeeU01F4sqCPqKa5HgULqjmD19s7gFtD/4SFgLAZZS1gAnIx
         bpORoPMeciDVBzPDiTk/E/r/CiNM+rDhNJKeDfr79xobZ8XJLp1kNCjBQSvR5XOEc+Zw
         1k94z1Z4XB6i5uu16pIe3S8Lk2R86H9e/UJXe0x9FtxzjBIib5/QHUiwWLyAF6w2sdAe
         VBQNsh7gx1ObA0FKtyKq3YORVkufeo6FxTIj2THBDr/elTzxNH9O8bgMHvpoba4Goa5w
         LHdqNMtDQQ72Ij9JPrcsANnick7a8kyAQqtPOR97GnJsDpA5mksZXCrV3f+Rtg8YLrsD
         w0qQ==
X-Forwarded-Encrypted: i=1; AL+hErExuaS5oq+E3xm2VqIeSPPv7vEyIGbNGkoe11xz6ZLMefQjzl67F8sAWXxYdw5KRFxOgUwh7oI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cyVd3TB6eYDJwLWCKejfY/IsCFzeotZkOXRqbg95P96be2Uwn
	aeZyb7mD6p0JyBGAJmlIjI4JlnPDzrbNkS8R4WphTSXTGDk4TQ15TJUJBJtK6/7IhCgsPpfm9Ln
	gkSpxtP0rp9B476a5R+/mFQn1stXx3ljgiiEvNghAnj23aBmtAuPQ0+PeRCM=
X-Gm-Gg: AYBFou1V4B1F7d1ImK8XIIbXZDEdoI3AF1nVKAqq4hxzUL6KHtqTylAe/7kk9SckvPW
	Eb/pB4kBMOUzn5eSCdlmf3Of5ynGuU9ALF7NytxMaUWFyfkG8y2MaOXIN+x7rDnLe7WOK9X/LDw
	SpE1dHfRwmo/p/Gc522LPXwYgkesUuJVG7mtUg00QxzH19+87BwOm9uvq5YoW8EKSJQmL+9GA3Y
	LoGDx131aajmUXaryOwNAASu9bO7TNbu8PQ+QnR8nawdJIhSziHwMPBsi5OinR7DQCUKGhGf//G
	8zjc5rqYBkQ6AY0xCYVnSl9s1dXJMROblsrTA0VkZW7ITi+jMVp0BNIxPKevZY0FppHrGCeoU/r
	Ioq4WvBQlfk1jVPdla9bK8uw6ZTG1Na1cr27uAVBH9d8JjoyFB1Z3tr4hYofD2g==
X-Received: by 2002:a05:620a:2a14:b0:93c:6534:d04d with SMTP id af79cd13be357-9494bbcd0ebmr940946785a.35.1794677731491;
        Sat, 14 Nov 2026 09:35:31 -0800 (PST)
X-Received: by 2002:a05:620a:2a14:b0:93c:6534:d04d with SMTP id af79cd13be357-9494bbcd0ebmr940941885a.35.1794677730859;
        Sat, 14 Nov 2026 09:35:30 -0800 (PST)
Received: from localhost ([93.66.91.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e3fsm125451425e9.5.2026.11.14.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:35:29 -0800 (PST)
Date: Sat, 14 Nov 2026 18:35:28 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, Jose.Abreu@synopsys.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
Message-ID: <avib4GD-_vySRw70@lore-desk>
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
 <179461436943.2199510.3966572269599982119@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZBwauAhLgdMSXs7"
Content-Disposition: inline
In-Reply-To: <179461436943.2199510.3966572269599982119@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2OSBTYWx0ZWRfX5NQHMJgo2+vU
 C4L4M2S8IM3TT4/eoWk4HXuRrsUdGkY+eVqfPYyzwS1+1mv/0NtXWv+SNOWCg+hgUl3Gog7rziG
 CuyfrJ/nsxS8yWegEJM1Lp09CIgXkNFWvkg/+HtqOWXznxL60vuOIQbBm5NHxF2y9FRDEyqF9ac
 LYfWxXDyw9joI/95PqSKNGftP9x1Gndn851flWgVrtDYjhOtCnj9Qan1X0R2JUlpFqdn187RbPv
 4QXD9909bRC/d3KtxUBxA4MMFLOKuAiWIStUts0iAC/p71LUXkpXuVnv4nEZ6UsZ45BPhqXZhZf
 6dfEWdTrglfYaNScjkikBcAO8frx5LjfQJkO78jqjy+3URbLQllUHzakRGdBz/dnOxoIqYoce1p
 ImkeZyWLEwssDiElID4b4ztJEpZJy3VKha/mtwYUqgAf+qKDbtXw1WUg385SIxORQDKZ78qTxaY
 zxFVqywSQT5mzkv0xCg==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af89be4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8zQ3sPA27H7dy4zktjPBAQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=9R54UkLUAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=WSH4S4wLhjpOz4qybXQA:9 a=QEXdDO2ut3YA:10 a=wVBckmvFIwzeoRS6_l8A:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=YTcpBFlVQWkNscrzJ_Dz:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: cq4ZGZbO5iJDUEk-sCsrsr9rwg4Vbuqq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2OSBTYWx0ZWRfXzQ8umDor0hL6
 yRCHc4DdWStTfQGBYj/WHrzG0AeHn1cntIeCK3SesXOMVCHvpSrDsQBLhZCOBet9MYD10hnJinN
 9T+ZLdLeK8ysIyXgslQ3fSPEfUsRuLI=
X-Proofpoint-ORIG-GUID: cq4ZGZbO5iJDUEk-sCsrsr9rwg4Vbuqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140069

--7ZBwauAhLgdMSXs7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message gets stmmac_adjust_time() wrong, and it
>   uses that function as the model for the new code.
> - [Medium] stmmac_adjust_time() and stmmac_set_time() are the .adjtime
>   and .settime64 callbacks in the same ops tables (stmmac_ptp.c lines=E2=
=80=A6
> - [Medium] In stmmac_set_time() the new code ignores the return values of
>   both stmmac_est_configure(..., false) and __stmmac_setup_est(), and=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: re-base EST after PTP settime64
>=20
> This patch makes stmmac_set_time() take est_lock and disable EST before
> it steps the PHC with stmmac_init_systime(). Afterwards it re-bases EST
> through __stmmac_setup_est(). The goal is to stop EST from running with
> a stale base time after clock_settime() on the PHC.
>=20
> > stmmac_set_time() initializes the PTP clock through
> > stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> > takes est_lock nor disables and re-bases EST around the step, unlike
> > stmmac_adjust_time(), which performs TSUPDT through
> > stmmac_adjust_systime() under est_lock.
>=20
> [ ... ]
>=20
> > Take est_lock for the whole disable/step/reprogram sequence, as
> > stmmac_adjust_time() does: disable EST before initializing the clock and
> > call __stmmac_setup_est() afterwards so the base time is recomputed from
> > the reserved taprio base time and the new clock.
>=20
> [Severity: Medium]
> Does this match what stmmac_adjust_time() does? In stmmac_ptp.c,
> stmmac_adjust_time() releases est_lock before the step and takes it
> again afterwards:
>=20
> stmmac_adjust_time() {
>     ...
> 	mutex_lock(&priv->est_lock);
> 	if (priv->est && priv->est->enable)
> 		stmmac_est_configure(priv, priv, priv->est,
> 				     priv->plat->clk_ptp_rate, false);
> 	mutex_unlock(&priv->est_lock);
>=20
> 	write_lock_irqsave(&priv->ptp_lock, flags);
> 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
> 	write_unlock_irqrestore(&priv->ptp_lock, flags);
>=20
> 	mutex_lock(&priv->est_lock);
> 	if (priv->est && priv->est->enable)
> 		__stmmac_setup_est(priv);
> 	mutex_unlock(&priv->est_lock);
>     ...
> }
>=20
> So TSUPDT runs under ptp_lock only, not under est_lock. The new
> stmmac_set_time() holds est_lock across the write side of ptp_lock, and
> stmmac_adjust_time() never nests the locks that way.
>=20
> The est_lock -> ptp_lock (read) ordering does already exist through
> __stmmac_setup_est()->gettimex64(), and stmmac_init_systime() does use
> readl_poll_timeout_atomic(). That part of the ordering argument holds. The
> precedent of stmmac_adjust_time() holding est_lock across the step does
> not.
>=20
> Could the commit message describe what stmmac_adjust_time() actually
> does?

This issue is already fixed in the following commit:

commit b0816917a4f7194cca81288fd339d285d8d793b5
Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date:   Mon Nov 2 18:37:56 2026 +0100

    net: stmmac: keep est_lock across PTP clock adjustment

    stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
    and then reacquires the lock to reprogram EST using a base time computed
    from the new clock value.

    That leaves a window where a concurrent tc_taprio_configure() can progr=
am
    EST enabled with a base time derived from the pre-step clock.  The gate
    schedule then runs across the PTP step with a stale base time until
    stmmac_adjust_time() reprograms it.

    Keep est_lock held for the whole disable/step/reprogram sequence so no
    other EST user can program the block while the clock is being stepped.

    This does not introduce a new lock ordering: __stmmac_setup_est() alrea=
dy
    takes ptp_lock through gettimex64() while holding est_lock, and
    stmmac_adjust_systime() uses readl_poll_timeout_atomic(), so it does not
    sleep under ptp_lock.

    Cc: stable+noautosel@kernel.org # LLM report + LLM fix, not seen in rea=
l life
    Fixes: 23d96de472f7 ("net: stmmac: re-apply taprio offload in __stmmac_=
open() and stmmac_resume()")
    Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
    Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
    Link: https://patch.msgid.link/20261102-stmmac-ptp-est-lock-v1-1-76fbc0=
cb230d@oss.qualcomm.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>

>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 31a66e855d6b1..6370bdc6c58b5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -129,10 +129,19 @@ static int stmmac_set_time(struct ptp_clock_info =
*ptp,
> >  	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
> >  	unsigned long flags;
> > =20
> > +	mutex_lock(&priv->est_lock);
>=20
> [Severity: Medium]
> stmmac_set_time() now holds est_lock for the whole disable/step/re-base
> sequence. Its sibling .adjtime callback, stmmac_adjust_time(), still
> releases est_lock between disabling EST and the TSUPDT step (see the
> snippet above).
>=20
> Can tc_taprio_configure() still get into that window?
>=20
> CPU1                                  CPU2
> stmmac_adjust_time()
>   mutex_lock(&priv->est_lock)
>   stmmac_est_configure(..., false)
>   mutex_unlock(&priv->est_lock)
>                                       tc_taprio_configure()
>                                         mutex_lock(&priv->est_lock)
>                                         gettimex64()  /* pre-step clock */
>                                         stmmac_est_configure(..., true)
>                                         priv->est->enable =3D true
>                                         mutex_unlock(&priv->est_lock)
>   write_lock_irqsave(&priv->ptp_lock)
>   stmmac_adjust_systime()  /* EST enabled in hardware */
>   write_unlock_irqrestore(&priv->ptp_lock)
>   mutex_lock(&priv->est_lock)
>   __stmmac_setup_est()
>=20
> In that case EST is running in hardware while the clock is stepped. That
> goes against the "If EST is enabled, disabled it before adjust ptp time"
> comment in stmmac_adjust_time(). The later __stmmac_setup_est() re-base
> corrects the base time, so the effect lasts only as long as the window.
>=20
> The commit message treats stmmac_adjust_time() as already covering this
> case. Should stmmac_adjust_time() also hold est_lock across the step, so
> that the .adjtime and .settime64 paths behave the same way?

This issue is already fixed in the following commit:

commit b0816917a4f7194cca81288fd339d285d8d793b5
Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date:   Mon Nov 2 18:37:56 2026 +0100

    net: stmmac: keep est_lock across PTP clock adjustment

    stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
    and then reacquires the lock to reprogram EST using a base time computed
    from the new clock value.

    That leaves a window where a concurrent tc_taprio_configure() can progr=
am
    EST enabled with a base time derived from the pre-step clock.  The gate
    schedule then runs across the PTP step with a stale base time until
    stmmac_adjust_time() reprograms it.

    Keep est_lock held for the whole disable/step/reprogram sequence so no
    other EST user can program the block while the clock is being stepped.

    This does not introduce a new lock ordering: __stmmac_setup_est() alrea=
dy
    takes ptp_lock through gettimex64() while holding est_lock, and
    stmmac_adjust_systime() uses readl_poll_timeout_atomic(), so it does not
    sleep under ptp_lock.

    Cc: stable+noautosel@kernel.org # LLM report + LLM fix, not seen in rea=
l life
    Fixes: 23d96de472f7 ("net: stmmac: re-apply taprio offload in __stmmac_=
open() and stmmac_resume()")
    Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
    Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
    Link: https://patch.msgid.link/20261102-stmmac-ptp-est-lock-v1-1-76fbc0=
cb230d@oss.qualcomm.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>

>=20
> > +	if (priv->est && priv->est->enable)
> > +		stmmac_est_configure(priv, priv, priv->est,
> > +				     priv->plat->clk_ptp_rate, false);
> > +
> >  	write_lock_irqsave(&priv->ptp_lock, flags);
> >  	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
> >  	write_unlock_irqrestore(&priv->ptp_lock, flags);
> > =20
> > +	if (priv->est && priv->est->enable)
> > +		__stmmac_setup_est(priv);
> > +	mutex_unlock(&priv->est_lock);
> > +
> >  	return 0;
> >  }
>=20
> [Severity: Medium]
> Should the return values of stmmac_est_configure(..., false) and
> __stmmac_setup_est() be checked here?
>=20
> est_configure() in stmmac_est.c writes each register through est_write().
> est_write() polls with readl_poll_timeout() and can return -ETIMEDOUT. On
> any failure, est_configure() returns early, before it writes EST_CONTROL
> and EST_INT_EN:
>=20
> est_configure() {
>     ...
> 	if (ret)
> 		return ret;
>=20
> 	for (i =3D 0; i < cfg->gcl_size; i++) {
> 		ret =3D est_write(est_addr, i, cfg->gcl[i], true);
> 		if (ret)
> 			return ret;
> 	}
>     ...
> }
>=20
> If the disable call fails, EEST stays set and stmmac_init_systime()
> steps the clock while EST is still running. That is the situation this
> patch is meant to avoid.
>=20
> If the disable succeeds but the re-enable inside __stmmac_setup_est()
> fails, EST stays off in hardware. __stmmac_setup_est() only logs the
> error:
>=20
> __stmmac_setup_est() {
>     ...
> 	if (err) {
> 		netdev_err(priv->dev, "failed to re-configure EST\n");
> 		return err;
> 	}
>     ...
> }
>=20
> priv->est->enable is still true and stmmac_set_time() returns 0. Taprio
> then believes the gate schedule is active until taprio is reconfigured.
> On a similar failure, tc_taprio_configure() clears priv->est->enable, and
> stmmac_setup_est() passes the error up.
>=20
> stmmac_adjust_time() already ignores these return values in the same way.
> This patch adds the same pattern to the settime64 path.

I implemented the same approach used in stmmac_adjust_time() where we do not
consider the stmmac_est_configure()/__stmmac_setup_est() return value.
I think we can address it with a follow-up patch for both stmmac_adjust_tim=
e()
and stmmac_set_time().

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6%40oss.qualcomm.com

--7ZBwauAhLgdMSXs7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavib4AAKCRA6cBh0uS2t
rKeBAQC2Gvy2hZlkLB8Y7T5dOa/LBcq3pba1rqG796bNNAgMYQD+LHsnF5ayVxiw
CcoIJH2dEgoUduex0WUA4duoBGSdUAM=
=ORkf
-----END PGP SIGNATURE-----

--7ZBwauAhLgdMSXs7--
