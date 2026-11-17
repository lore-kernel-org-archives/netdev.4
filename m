Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920138;
	b=zEZLmGxq2f76xE+5FVttMshLh/TQPnBgOyszDj9F6pJYCe7QcHv/s3yacLyTVssUanNo
	 ySpampZcqfB1oK8rRloS/DkWddP06KXXmd3RoK29FSMFSqs8fVqrJjWt1Omh7uw9YCJ6Z
	 zLNwlnakPFP6zQwHzjvEcmDE28FKL1l6PV3E1y4BztOiJ4GxGvG1N5ZJiOXl15c+H+tjQ
	 m3R9CWmSV4QUbCn2ht+WEIy3ST8q+ZifTrG6mDz4cRSSMjh1CN3mGJhyrVMCrPaCPs+k6
	 8vAulMztHGKyUSGaK+x5Rsj3sKH80zVcY3Jat8+OP0E4s6b+zyxyha96BP+LrP93sGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=;
	b=aZhXZauFTkWhcIvk5SKW9S8YTJ7vHgCN26TY9W9H+bXahk9+pyw2xh+9NcEXXRvgX34J
	 al55lQ8yxZ9gfSDNsDO0r9FkP6R83/Oe1TIHvQXp4XqEYBsNUnDvXR/BeLcv240DjTf9+
	 VEiNsMDp8qv5xsAb2gaKexwVR7qDGCC62slgwp47X4/5qmII3mx9pWRJkfMFqJ5Hxrikp
	 LUyPLvDGU/HHlUuHKJxdMYP+9SmRSg+bq02nDzyeCBNcPtzkHdaIjPPWzyyc73XKifuL6
	 LvTk5/693b5swHBnA/zqBcJ2CQPKXXcuj4fuwG8BWr2orcyNJDeHMMnXtLsQQGuipug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu1Zs6O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SrP6a0mJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B6606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu1Zs6O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SrP6a0mJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1Mpu2756095
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z4dX78GuYSiPqA2FlATo7FmV
	UT99P1UESYr9b7xa8HQ=; b=UVu1Zs6O5pjQrgl8jVoF/KSh952CKn4Mxao/SNKs
	kqd8b2qwDynvMxUsmaLrYj6z2BVYlmzQLy+CMsa5df9q5YFmgNcD88e53Vl3WoAu
	jiOj3LPr0c3oRHbnw7Xuu7bifE9RYQ/7/MCa3H8UEMqxMY1e/Zn6cAY1UfBlSiXx
	E15H98yH5J51/dNLeorOkf6Rpy7dzNn5KZtDQQp2WnPb6nbgReyzSmSvVjO7q0HS
	fK5bJhNLcfvjKzhKbTPRpWQuKkx/iLoJVzpDaSaRdxscycDH0+UVJvdMUFsc1gu3
	eGkWUBMWQUfiWLeFIksrtmBIBLh/ZJPJIoYhq7woprUJ7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuhy5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:55:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso803726185a.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920136; x=1795524936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=;
        b=SrP6a0mJSjBcZuXgQDPpoOBc1I7pTOgrlj+E10MHI7O86ryc4KAdBLQoEI/m0X5QUy
         E7ff4E8yBebQMVr5Pv9TlIallK+5Z1Ow1/E+v/08Zu8GeecnbPcLZINDMFnVaqdjTNge
         CyDcetpJ+mgT92eQZNRUcjenXefnimtgvhmy7JYmy6ONktL1lDcX1lL4F66F1oRioQ/5
         ybj2VM3PJtpNLT7zwxKlU3BtmgejzmBiR+g0+zcePAOQMpb2SfVey/CcsKfSvrRwWSFC
         tBACEOAeZYYIh9wT5W/3MUyBhsi7lJZVd+HY7MOjQIsbT6v0IjRmnaoa4HjfXwNv6jt3
         KvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920136; x=1795524936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4dX78GuYSiPqA2FlATo7FmVUT99P1UESYr9b7xa8HQ=;
        b=nE2oMgfwni2v1LtDjuFHwgIsq4vXplB8blpy3txBB0e/uyzF7/fDsxTfCS8VGWpGs6
         bs6uemuaL1n3vVokrSLX71ocrfbZ7XRYgjm1u672UoSegqQnrj0wxHws5rOfk0JAPmcS
         I2UUzTD+nBA7ECXPvzXZIMO3vPKaR4Hex4ee37r/Ta8B1Fw2Xczin59qU4mlXyQQSMCl
         bzemQatO7OP8pQcs/ah27NKKbEkt+NWLcD4b7IflmgrHl3yobXMetDRszNq56hLYnV91
         im1bUM3hCa2ayVo4OnmrnT8/i4BsRMX8EauCPxGOhS+uUOYBB4rhAZOvK+r/hp9IXtR2
         ukdA==
X-Forwarded-Encrypted: i=1; AL+hErHuXP5DpdUzm4aJ9prUJUADB4WDXIdadL8js6ly5XQ0tN4MxazsaiRBD06pkGoVOiWbtW5NjEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wW3PzYifuc5We3lpX9QY95MmmsrZXn78Vea0YE9b7ZxUe4uS8
	WSfupJgNTAyV/e9TZlRIXA84NpAc9FTXnrvtIZKASBTdhSoUrRkruJ5jQVYA3yXJha7O5UkpBLK
	/WQ6tvFk3y+RvJvlW6H2El2czDsX7UscbDcoo79w6TwMwiy3QBoOKW/6HElw=
X-Gm-Gg: AYBFou1JzGiFlzAvrlRUOKvE5GzCz7z9ASl0xm2UcNQNX9Q5GGqGcLoQEf2WXUCzSYL
	PyYVUiwW8werweY3qnbacMeEiZrZeOBZ0PFoJz6GgBhj2iAB3FECYhcJZHriBp1ghUyUExJD5Mb
	1Sv0iBAilgr691JKXG66/lAQvckd6o73PoY65T99sYVv/OE0MN93/Ws8367OplhLUDG/PF1esHU
	ZjwOcpiMFcfVMdd0ZAAwjsw7itKWPCP09fErMey6hzIdT3VEtf4/SqAVTeRwAphE4w8Yde9ncv6
	29HvappXn+weN5fFthuGVWnQZafYnmN4bvC6UKl3vupz/ya66+qGM7oH+TvGAI0D0a1aKZVZCnA
	WQ4rYUC3+k54tOBujn05YENAZUxPKjuroCVz8sIMzAOSlpwdW+tP5VWnkU04zNJs=
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr2188195585a.40.1794920136289;
        Tue, 17 Nov 2026 04:55:36 -0800 (PST)
X-Received: by 2002:a05:620a:2a14:b0:93e:d364:c9fe with SMTP id af79cd13be357-9494bbcc105mr2188189285a.40.1794920135649;
        Tue, 17 Nov 2026 04:55:35 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm5159093f8f.58.2026.11.17.04.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:55:34 -0800 (PST)
Date: Tue, 17 Nov 2026 13:55:33 +0100
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
Subject: Re: [PATCH net-next v10 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
Message-ID: <avxOxc3sU3bd29-t@lore-qca>
References: <20261112-stmmac-rx-mb-v10-1-d3d04b65c6bc@oss.qualcomm.com>
 <179484961485.3136.18371294575845722948@kernel.org>
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
	protocol="application/pgp-signature"; boundary="IgpR4FCbaFWOr+d8"
Content-Disposition: inline
In-Reply-To: <179484961485.3136.18371294575845722948@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX5I/O7PmnghkW
 Lyoh9YECNEDRs9nTwuQ0EDUWh8F2FExi/IkL+dCRx4D3OSwwCD3sty/UGV5cdan3u+EwW4aXbkS
 iXhC4m8RJ1rr2s2cpQrd5UvUCmv9GoIT9IipjawmeI/ASnbbeDzljHLLa/GtqxUNbN0h9t/+zJP
 X7Gy9pt2iga/NA2T613xS2/azHBEIz6YD35PdXk+aznCyEfFfZm0NTjkMHJW3NvUcBViGd+7PG5
 mj44xMTVLTmCTq2QdAUVz4Ec+KDy1975JcqmKTiyAtlm2gP/2AM8Q9epCQqyD8CvoDde0VD9LZy
 V5t0pXe4wAn2RAQXCRf0TcoV2R4yHMMrKeruKueEM8Oy7VEeFhiB1G8Q+WH8nb1h2ffjlX3y/gL
 erqkJXsAYI8vl47NDdJ8d6s/z3T1Guhie945KjLWBpX4j7xj8EWHsitXBR/y3I17UPp+DnvlIkc
 2W4QxxQs9x/iCXGbeig==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc4ec9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=--SqLFdaUOMV0DsZRZ8A:9 a=QEXdDO2ut3YA:10
 a=CvoAkVhk7Y3g_VbaP6MA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: UWtznqlnWlQ__aWJLrtSUcBxY4aUVkT8
X-Proofpoint-GUID: UWtznqlnWlQ__aWJLrtSUcBxY4aUVkT8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX/yUO9Hm4g19D
 SM1+KzGAEKKvaTQEo68zr/W5WgaFe0b1DqEpi6Ceb4x/pqRYiYYGi96jspqSDaZ9Cl5utaXHB8/
 b7Q9PSJ1g957keuVQBM0iI/1KIIquzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051

--IgpR4FCbaFWOr+d8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>=20
> Low priority / nit picks for your consideration:
>=20
> - [Low] The kerneldoc for the newly exported __xdp_build_skb_from_buff()
>   (net/core/xdp.c:622-633) says only "Protocol parsing is left to the=E2=
=80=A6
>=20
> --
>=20
> net: xdp: add __xdp_build_skb_from_buff() helper
>=20
> This patch splits xdp_build_skb_from_buff() in two. The new exported
> __xdp_build_skb_from_buff() builds the skb without calling
> eth_type_trans(). A static inline wrapper in include/net/xdp.h keeps the
> old behaviour and still calls eth_type_trans(). The goal is to let stmmac
> process the L2 header (software VLAN) before protocol parsing.
>=20
> > diff --git a/net/core/xdp.c b/net/core/xdp.c
> > index 1d679e8fd6493..470bf90d93ef2 100644
> > --- a/net/core/xdp.c
> > +++ b/net/core/xdp.c
> > @@ -620,17 +620,18 @@ void xdp_warn(const char *msg, const char *func, =
const int line)
> >  EXPORT_SYMBOL_GPL(xdp_warn);
> > =20
> >  /**
> > - * xdp_build_skb_from_buff - create an skb from &xdp_buff
> > + * __xdp_build_skb_from_buff - create an skb from &xdp_buff
> >   * @xdp: &xdp_buff to convert to an skb
> >   *
> >   * Perform common operations to create a new skb to pass up the stack =
=66rom
> >   * &xdp_buff: allocate an skb head from the NAPI percpu cache, initial=
ize
> >   * skb data pointers and offsets, set the recycle bit if the buff is
> > - * PP-backed, Rx queue index, protocol and update frags info.
> > + * PP-backed, record the Rx queue index and update frags info. Protocol
> > + * parsing is left to the caller.
>=20
> [Severity: Low]
> Does "Protocol parsing is left to the caller" fully describe what the
> caller now has to do?
>=20
> Moving eth_type_trans() out of __xdp_build_skb_from_buff() also moves out
> the other work it does:
>=20
> net/ethernet/eth.c:eth_type_trans() {
> 	skb->dev =3D dev;
> 	skb_reset_mac_header(skb);
>=20
> 	eth =3D eth_skb_pull_mac(skb);
> 	eth_skb_pkt_type(skb, dev);
>     ...
> }
>=20
> So the skb returned by __xdp_build_skb_from_buff() has skb->dev =3D=3D NU=
LL
> and no mac header, and protocol and pkt_type are not set. This is true
> even though rxq->dev is available inside the helper.
>=20
> The peer helper __xdp_build_skb_from_frame() still sets these:
>=20
> 	/* Essential SKB info: protocol and skb->dev */
> 	skb->protocol =3D eth_type_trans(skb, dev);
>=20
> As a result, the two __xdp_build_skb_* helpers now return different
> minimal skb state.
>=20
> Nothing breaks today. The only in-tree user of the underscore variant
> later in the series is stmmac_rx(), and it calls
> eth_type_trans(skb, priv->dev) before napi_gro_receive(). A future caller
> that does its own L2 handling and reads "protocol parsing" as just
> skb->protocol could pass an skb with no dev to napi_gro_receive() or
> netif_receive_skb().
>=20
> Could the kerneldoc say that the caller must also set skb->dev and reset
> the mac header, for example by calling eth_type_trans()?
>=20
> A smaller point: the public xdp_build_skb_from_buff() wrapper in
> include/net/xdp.h no longer has any kerneldoc. The kerneldoc for
> xdp_build_skb_from_zc() still refers readers to it:
>=20
>  * Similar to xdp_build_skb_from_buff(), but for XSk frames. Allocate an =
skb
>=20
> [ ... ]

I will fix it in v11.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc%40oss.qualcomm.com

--IgpR4FCbaFWOr+d8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxOxQAKCRA6cBh0uS2t
rN8KAP9n5nAt1PRZw9UtpxsfE+nfrsPd8jBTaqd/v/2xmf0JLgD+LNQ8PQVLXBEM
4iO7vZYN47HIhryG3h5wueYeqlLIewo=
=S4jk
-----END PGP SIGNATURE-----

--IgpR4FCbaFWOr+d8--
