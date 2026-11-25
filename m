Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618535;
	b=Wb7eL1DfQTxCKTrapo/fY1gEjtjoAs9RZG4BxL+w20wxMWPxIwEGowOSuhd+yeVen6e/
	 2AOzWVPuo9hKWLDEnRPA559kOOomrU9rcYFQdGfimTEHbZ1YH2+fBvhbRQ0I1a9BOT3+T
	 Jz+erFipNL4j/mcuJN026+gcaAYCWF9phxOZkzvM8p8yvQ4K77LyxyAyXULnjHTZcF9tp
	 MGc544hWZEgPDHY/4MUBQzASinIwkW+FScACdIgu+jb2fV5JmVV/zlQ9xa2SboDhHrALQ
	 TwlId7aEK9UrWVsSnWmjUh0/+I0dwQdPOdpEZJOSAOXtGT3ajQB5fFd84srM5kFuC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=;
	b=KC6n8C2MY1L2XorbkWH8eclIltSNYFQHQxHwqIuNm7B7tQid01eyyIRanbUMWZw3jC0B
	 HtWpQFRMKlCa24iuUdndoiyxaJ9LNQ/UoE6vyOOMK4EV+NTaNVO+ITk42RBl7E6xOtobw
	 nj6CSyq5bk2sPWD0ohxl+BlgH7l4eCJJopd5tNGS/4mScxiDJiLmOTVipPQKvuDcAl/py
	 jKw7V7SXYr9ODuE4Z8cm0AsG9PEzHfcaJiR0XxXof5Zn+ndvgaocNyXhjCusXZa+ns87Z
	 vazxNFt/m7FHBErGAKTQ2QTrfzlklR5EPCpu+o48YZwmFs+SlGUMLSWcqdeN6oz7pOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92Oq1gS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AM4eJFdg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7ED606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E7ED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J92Oq1gS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AM4eJFdg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM7312729796
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HnuTfte+mdhWwh+sJdUBLmYp
	GpD9aM7Wx4iTVLXkRUM=; b=J92Oq1gSARuaPSfcpRQMOvNtC8Hf2dCX4rSVcym5
	41JJcj3FNDY402mqYyzHECPWfinRkCIGDehEDT2TOa+GBYHO78vllqyGUFDT+UBp
	2BxLghhX3Ic2AsBehAJE/IBYkiAKtBxyu+GKRXZLIsSzJxaqc3elWDU4/gYaCGii
	r1ZAgZkjUWeWf4ia/EKuUFpLJvzkaZ2prDZksNxMy8QBO6uia1IZavyBofxq8jgO
	P24TC+IUL4L74OlfMl0QjH77xTSIYKZUTLGnEjWe0KbYMSc6mnT2JmJFeCLEzK0F
	Hpgm10g+/DaID5uDy3huplYb0QsIPrrVMBbjXnENn6nOQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksctx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:55:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so1009226185a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618529; x=1796223329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=;
        b=AM4eJFdghtOywac9dqczs1Q/UXSOWacvA6kk4zN4jbX135BmFTmBfMkmu84kJa3uHh
         AnB5ONxIXf2tjHgriFO53HvKuxTr6HY0zfsQLAx8INN1KoJZRo9D1ztC7HljQfoDRLUn
         eOJlwW9v5BXN1PoPFSLcr0glqeDyyaMTy35ArbmfrHcYa06Y+A1OOIwMs06UhOhwHnb9
         enfSk4rIWDlJSTCk01676Z4x5FGSARXrXQmlvDhjzBbu6kZSOYpFzrot0boxEAd54i5S
         Lt4obvqGyW4c+xBUZ0jqcQvPvC39Ya2z7bhz+U+pBq+1svk7yvgDmwWelhUDos6ItEXs
         X/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618529; x=1796223329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnuTfte+mdhWwh+sJdUBLmYpGpD9aM7Wx4iTVLXkRUM=;
        b=P/fClR+jS9Vfg15u2C3AwQ8e1VuO7iadmyxekYJwSE66TVxtG7vjaXuQePQifmDSPJ
         AqQpepGwx6OjwFNlBN137SPjt8NmC5xyVDQTeSiMbCpsSVsmtBStDbw0FaHEtoPQ9rG9
         E4/+eSI3Ot01gD+LfpPvf//N5DOVnyfsKonhceHRXkvL1GAv+MJzIuJVrSZ5kn1vOlHx
         rP9d7T1qhJN3WmVuDb1HE/z41hM9BVr+J4f15j0rDVJIR23t77+YMuoPyuDDOOX5W629
         5//tDUzduZdlqTRukWlBc9N+d1yTYPLpiWF7YB1mXaKat9/yyb+JmHvjUmY3UqQ730Bt
         UBjw==
X-Forwarded-Encrypted: i=1; AL+hErFEGCr1Q3g+2DQ65qS263crjM1n8HKDoo8V4afMh1Sht0E5DDt0OtiI75M6dgDATd1F1VvpO+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z//E+VqyZ5UYqkGzU2bnbG2A53GbrXNlBD0fuBBbCcOv5qe92fq
	xCWQjqXaI6HessVZE4S/rymGg+lfoaSeJw6Splc//bDIv6oJNJtoXz+B0CPo3ppwUE1vUWQ1KC8
	m7U3K77MwOmXvqP0EBqHJbVEutkoUX8NhTA6Qi8x/vraBxqNWzDymZPuoL1kWdgpmGi0=
X-Gm-Gg: AZFdTZfOqUTO+fYpspWowqgNoNzFpzplKIKyfQJHKkFDZYmCwZCxz3hcfIdbxw4ecUc
	ZR/4GeNCd5RE92JsAiDjLxsTnEpodpWwu5ebXVix2uRya45iaYV857dLaiBqvHI5eh2vhYiZ5p5
	UR8JwpNILHOiRkKxVg0B4xO9cpUI/T0b7544KVNG5CBPtKYXlCNzXkdNmzXWfAtwm5krzmrPz12
	yzlcL1K3g+FCbK3gsZeogswoQsL6Li5bg1q0xz5CI4RTYtnDFnRSBLiCg8DAgQiiqdfNVyX5XBA
	boNz6EvyKWhAd3TDx1X6JSs91y49g0Mlu24n+B8FldVxMdWda3AvyD98LmmQGkjQZWtI83nPU70
	OJxTwBBys90CKxRvSA+rsG81gz7qvuOaYsqhojsTveazynVBopzL8jzElMjgwNLI=
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3228580685a.3.1795618529249;
        Wed, 25 Nov 2026 06:55:29 -0800 (PST)
X-Received: by 2002:a05:620a:2792:b0:93e:64ac:5dfd with SMTP id af79cd13be357-949b3402246mr3228572285a.3.1795618528540;
        Wed, 25 Nov 2026 06:55:28 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm41168546f8f.21.2026.11.25.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:55:27 -0800 (PST)
Date: Wed, 25 Nov 2026 15:55:26 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, Jose.Abreu@synopsys.com,
        boon.leong.ong@intel.com, horms@kernel.org, andrii@kernel.org,
        eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
        emil@etsalapatis.com, ihor.solodrai@linux.dev, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        nb@tipi-net.de
Subject: Re: [PATCH net-next v12 4/4] net: stmmac: rework stmmac_rx to
 support XDP rx multi-buff
Message-ID: <awb23jFbMuiQLhzO@lore-desk>
References: <20261121-stmmac-rx-mb-v12-4-3ae2f3bce174@oss.qualcomm.com>
 <179560987080.3135.9418981958235641169@kernel.org>
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
	protocol="application/pgp-signature"; boundary="LYnRZCeMiM17E6jE"
Content-Disposition: inline
In-Reply-To: <179560987080.3135.9418981958235641169@kernel.org>
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06f6e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qj33YrL6L9DSmQYm-pYA:9 a=wPNLvfGTeEIA:10
 a=cKRSO90NwK-mRX7MwXcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: JAXyTXmVelQwumUUSbMm_87seqKabkW0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX0s4+B7LsIwAI
 5748gO+T/qD7nk8Py3K7VzzfZki4R+iT+o13qPTvuom8yaROZi1Mv/viUJ1l+N2Ln7Iv+uINivJ
 jmHpdMAdN6INdVoM5TFJPvjUf5lAEys=
X-Proofpoint-GUID: JAXyTXmVelQwumUUSbMm_87seqKabkW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX42vFfzIPTn8t
 QDZGzTzCCF1mBCoJ6iPpQS5bwrivKfoZiXTuZJv4s5M0Y2Ax+BWIo6jhPICB4Hh+S59aNy8fUkY
 zA8H38+sn11g09Mfikx1TVYvySPdMj1BPpn6Esjc0U1Z5v08rGOH/hCKZVFhK2y5uEfUHdSjcK+
 0efbAN5o2V4VQ4L2DzaG8Z2PRzZsBI4ZiGCPQlloW4rGjya+R8dKbu1t8m6E5Rf+LuqOe5COuSN
 s/jZbOggpbUv4D4U5x9TqlVtCs/LKiW2LQem1TMKKj1f7zzoz0dfgVWpvBkrwcvrv7EyTcUu2tA
 /kfLe17LKdQRUaGqIWshHMAwY9MYyZ2c29l6Qgys844KHWQ1bqWjpQG2XznqMeicDOiNJYxKQi7
 lRYCIiGbN8JISnJJeuu4dvDZSnoo2ReXxJULPNs5ahQPp1K5Rzb3g9ZVt5Luehx+oMzBTTfIuST
 SxTrxEqVjlWRIrAyE4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250059

--LYnRZCeMiM17E6jE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =B7 High: 0 (1) =B7 Medium: 1 =B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The patch makes __stmmac_dvr_probe() always add
>   NETDEV_XDP_ACT_RX_SG to ndev->xdp_features.

ack, I will fix it in v13.

Regards,
Lorenzo

>=20
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch
>   extends it.
>=20
> --
>=20
> net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
> This reworks stmmac_rx() to collect every descriptor of a frame into an
> xdp_buff. The XDP program now runs on the whole frame, which may be
> fragmented, and the skb is built with __xdp_build_skb_from_buff(). It also
> saves the in-progress xdp_buff across NAPI polls and advertises
> NETDEV_XDP_ACT_RX_SG.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca4c7fb11b73f..b657701f51f90 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> [ ... ]
>=20
> > @@ -6023,120 +6038,79 @@ static int stmmac_rx(struct stmmac_priv *priv,=
 int limit, u32 queue)
>=20
> [ ... ]
>=20
> > +		ctx.desc =3D p;
> > +		ctx.ndesc =3D np;
> > +
> > +		skb =3D stmmac_xdp_run_prog(priv, &ctx.xdp);
> > +		/* For Not XDP_PASS verdict */
> > +		if (IS_ERR(skb)) {
> > +			unsigned int xdp_res =3D -PTR_ERR(skb);
> > +
> > +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> > +				__xdp_return_buff(&ctx.xdp, true);
> > +				rx_dropped++;
> > +			} else if (xdp_res & (STMMAC_XDP_TX |
> > +					      STMMAC_XDP_REDIRECT)) {
> > +				xdp_status |=3D xdp_res;
> > +			}
> > +			goto next;
> > +		}
>=20
> [Severity: High]
> This is a pre-existing issue, but now that multi-buffer frames can reach
> XDP_TX, does it widen a race on the RX page_pool's lockless alloc cache?
>=20
> XDP_TX frames go to a TX queue picked by CPU number, not by the RX queue
> that owns the page_pool:
>=20
> stmmac_xdp_xmit_back()
>   stmmac_xdp_get_tx_queue(priv, smp_processor_id())
>       while (index >=3D priv->plat->tx_queues_to_use)
>           index -=3D priv->plat->tx_queues_to_use;
>=20
> Completion then runs in that TX queue's tx_napi:
>=20
> stmmac_tx_clean()
>   xdp_return_frame_rx_napi(xdpf)
>     __xdp_return(..., napi_direct=3Dtrue)
>       page_pool_put_unrefed_netmem(allow_direct=3Dtrue)
>         page_pool_recycle_in_cache()
>=20
> allow_direct is already true, so page_pool_napi_local() is skipped. That
> means pool->alloc.cache and pool->alloc.count are written without a lock.
>=20
> Meanwhile the owning rx_napi on another CPU uses the same cache through
> stmmac_rx_refill(), __xdp_return_buff(&ctx.xdp, true), and
> page_pool_put_full_page(..., true) in stmmac_build_xdp_frags().
>=20
> Here is one example. With multi-MSI and ethtool -L rx 4 tx 2, rx_napi 2
> (hinted to CPU2) sends XDP_TX on TX queue 0. The tx_napi for TX queue 0
> runs on CPU0 and recycles pool 2 pages while rx_napi 2 refills from pool 2
> on CPU2. IRQ affinity changes can cause the same overlap.
>=20
> Can these unsynchronized updates give the same page to two RX descriptors,
> or lose pages? Before this patch only the linear head page went through
> this path. Now every buf1/buf2 frag page of a multi-buffer XDP_TX frame
> goes through it as well.
>=20
> [ ... ]
>=20
> > @@ -8218,6 +8199,7 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >  	ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M |
> >  			    NETIF_F_RXCSUM;
> >  	ndev->xdp_features =3D NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT=
 |
> > +			     NETDEV_XDP_ACT_RX_SG |
> >  			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
>=20
> [Severity: Medium]
> Should NETDEV_XDP_ACT_RX_SG be advertised while the driver still refuses
> the setups where multi-buffer XDP is needed?
>=20
> stmmac_xdp_set_prog() in stmmac_xdp.c still rejects every program once the
> MTU is above ETH_DATA_LEN, including programs loaded with
> BPF_F_XDP_HAS_FRAGS. It also still turns SPH off:
>=20
> 	if (prog && dev->mtu > ETH_DATA_LEN) {
> 		...
> 		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
> 		return -EOPNOTSUPP;
> 	}
>=20
> stmmac_change_mtu() also refuses a jumbo MTU while XDP is attached:
>=20
> 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
> 		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
> 		return -EINVAL;
> 	}
>=20
> The commit message says as much:
>=20
>   "it does not enable XDP jumbo support by itself."
>=20
> The in-tree AF_XDP selftest in tools/testing/selftests/net/lib/xsk/test_x=
sk.c
> turns on its multi-buffer tests based on this flag:
>=20
> 	if (query_opts.feature_flags & NETDEV_XDP_ACT_RX_SG)
> 		ifobj->multi_buff_supp =3D true;
>=20
> Those tests include testapp_send_receive_mb(), testapp_xdp_metadata_mb(),
> testapp_adjust_tail_grow_mb() and similar ones. They set the MTU to
> MAX_ETH_JUMBO_SIZE (9000) and attach a program in DRV mode. On stmmac one
> of those two steps is refused, depending on which comes first. So these
> tests would go from SKIP to FAIL with this patch.
>=20
> Could NETDEV_XDP_ACT_RX_SG be left out until the MTU and program checks
> accept frags-capable programs at jumbo MTU?
>=20
> --=20
> Sashiko AI review =B7 https://netdev-ai.bots.linux.dev/sashiko/#/patchset=
/20261121-stmmac-rx-mb-v12-0-3ae2f3bce174%40oss.qualcomm.com

--LYnRZCeMiM17E6jE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawb23gAKCRA6cBh0uS2t
rCvPAPoC4m8jjdCyw5WZEYtK9dSI2EDVXvglOa/zOj3NzADSzgEAsFVmZA/rFSEp
Cio3T/KZyMuT/vFhPXffsWOsllsfSQY=
=QSMA
-----END PGP SIGNATURE-----

--LYnRZCeMiM17E6jE--
