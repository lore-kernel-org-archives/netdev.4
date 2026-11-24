Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511098;
	b=tcUmfWiGPVSIttXN7cH8umqw/tOMB++kSRJzhSSiQGZSVSTuq8/tni5ZXLTEQv/boCac
	 Zthf1JP97uCTfmXOuhoQoomYwRPGn9pYi0hn/fdzlmGROPfaBQH1aj1pST55VXoxBd+Uo
	 p22uQ+HlvlDe6hRGr/7b5l5SfuEixqhWWNV/qeclo0sEea3Xl1QOKoO3k+p3GPUrwyoXs
	 ooiZ2cQCzuxx9f3PlRVoaBfdFoxAfT+c6wmiC8BvXs5lIJLfpGomKlJa0Uv+GwoNTzACV
	 RG9Jeg3s2QcgSzG6i+8ukz2LDgKobSfwM0NZkJLFkcQItenN6I4fzihGoHKSmc5xx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=;
	b=qg5Op/zmbOl3Hj1JN6quVqbas3TMy7rzksk3ECI6kB3ZyhRS6Cokl5PjW6Ti6TV4S1o8
	 +FZrGQ8eYnMdWn+OZi9R2LSossBV4T10oskOpK2A6Jh4Ex3u3dCfZn//D2xHDjWafDnRG
	 am6XYeDhjQDPcNPx0/Q7ODUIQWblmLXlUv0Wwawo+CE+lIfU8rJRR7Xyjtj4cAPW/fK0I
	 mHEKwuA+sMgQBgL2ySjd+XkSVC/iMxefBCxJy5w97tk1eD2xW+3Mq6fLhC0ZTrM0/nbcS
	 +Oe6fkgOM4Yzp0bcA9JNb35rTxIwHpRiZJgc+i/jlvymifart0bQ7C9LuQqbb3UaI6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2OPOlRv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXyrUN9q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D6606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2OPOlRv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXyrUN9q
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m2Zs2848316
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xhoLzvSdgCRdRzB82i9PymJ0
	nI+RzUMdCmK32Pdr6Ho=; b=d2OPOlRvfISVk7J6Wumi6zrZaA3PIkLQKXZwGaUG
	MbxzPORarotTEVHKI9q/7zAQVuy5UMOPIvtI+osYwYXhzTrVn9Qj90ZXvDahgTk5
	UVdXwPMaIIq3kn+rdE+38PUCNI0WevjLptazGn7FaT0YaKhVQ0WdJxeQngjAumu0
	N4Kd2PRVleyW8wZ6EoGhdR+A3tyY/PJpXB37FXia0ReP+c0cqoHjIaOM0sVL1y6U
	osuJce3d/MvXnISyo7klEX6dU1CIF1KATAgyaoQrn+c4yi4AMh6xnHppnx2ZPh/J
	f/Ini72giDWQDVsJC79jVr9GeusNXELzoUPG6GONTbzUNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8rep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:04:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso751769585a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511097; x=1796115897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=;
        b=LXyrUN9qIWLMxWIKJD1j5aWF3NoShxjbuUIH5Vh+Y3gGbDkcxBbpJwxArboT9w/nyD
         pmmV7zkDl54IeRiYg5U2CWPIkSmrQbTNlg+O1KW9btNsl1rfzQudXtD5Hojc0A5R3R0p
         qdWmVu2IiVpuQMjrzqahbYgiIy98Ns7Sb/YAuCKEZZ1rxGQp/X0zwj8HsDNX16MLCK3H
         BBVvdwKH8Ehh+Z3u6edI/g2m+p/MYUFoCJ1ILfA5WgVDUozTj6HtrO3jUBYlp0yIpChr
         7O/mHfQb9X5DVvnS1xY126W1EBhq+weulyIpa+Sjk0uljgJq+7nr71YOAkB01PprjO4/
         UGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511097; x=1796115897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhoLzvSdgCRdRzB82i9PymJ0nI+RzUMdCmK32Pdr6Ho=;
        b=g2rAQM64/Y/V+XW5EPykVDjxm05XrvFi/5sDjWNck3EZlHZ7Ghp4XT7X532qjVbC8i
         +c+po44pDCph3LHi9dOULPxdJuRGMo++Q9ao2bsURmqTmambFiPgnoLVP9CP7tS1i4WC
         rVmwfeEsEVtWxEGCJCUYAei8S+1lZoX7FK6ugOL90VJPqOYg0JOLcfxhXWCojUckIAFN
         WvSHGNNaAWPhry+NXmURX/9287ruhGu1TAmlToDKcBzF7ZtqREjceZVPHZns4ilkF+RH
         VL2owPonSCv1PaoOreEs4OlZN3yLdil99nfArWjfq39l8QwvqTBDs7TGZY2OuW7sCXep
         rL3A==
X-Forwarded-Encrypted: i=1; AL+hErFWUN87keZx953coxZuRmc/XT8H58TxS8kcuUrNbM2q0oW0ZLxHhjccgrmIm6JgCBtt4X/7N/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GAq+jokMlI+5OHR0ak29C4940PHT2SGqswFChg/CqcDbLDCSh
	A+SRU43ainPGWIPfF5i+OxYPNbL/P44dOD0DtAF9R9l3BQA2Ip4hNakYSmuxrN5dhOmTw31kdNr
	LOooGa7Y0MXK3OgLcx8p1/YS3sPe1h3Qx9R/XWxJMgXA1dM2/FBXkgTX/h6s=
X-Gm-Gg: AZFdTZenh1ltP+BctpmQHu2/yKkyRtWmf9IsNks5SvrC7To1ZbVv/9219cRiQd/fS1E
	/7cvFcUard7/Xd8fE2lp8/hClqQElmniIPgNvjR5CvmjrQRIEqEKcmKV1OzN15P5UqPXFwQY6Eb
	u+oVmG0Ghorm28vol6IaOMGnm3wTV6duXx5OWL2nZyfC7IDsyLfLB/H407nKUWB3oLU+L80CX/h
	y4V6K9ftK2M16pEjSa1ExQDkWPljbun6Ii2b13vwsarBaS3TFqtZEjDxqkeN8HzGkVxVS4vTB3h
	JigpJmekjgc7Pb/74z5yIX1SYUUYVxZuWVKwwc9kUzvqgGXxCdmkilQppLT0i9qlJEF73Cs4vGF
	m7ZtABQG3uWYIfPagn/ERNJ2KLmrjvC3OV6oK8VNtWJZ0KVzik4hJG4qtt0rUTOU=
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2446120985a.22.1795511096530;
        Tue, 24 Nov 2026 01:04:56 -0800 (PST)
X-Received: by 2002:a05:620a:6c18:b0:949:6841:2ba2 with SMTP id af79cd13be357-949ba96e544mr2446115485a.22.1795511095866;
        Tue, 24 Nov 2026 01:04:55 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm180427535e9.4.2026.11.24.01.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:04:54 -0800 (PST)
Date: Tue, 24 Nov 2026 10:04:53 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>, peilinhe2020@163.com,
        Peilin He <he.peilin@zte.com.cn>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v12 1/4] net: xdp: add
 __xdp_build_skb_from_buff() helper
Message-ID: <awVTNSYCD-_5gE4D@lore-desk>
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
 <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
 <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="4rmTEbZeDTuovlI+"
Content-Disposition: inline
In-Reply-To: <9997f4e9-9453-4511-af3e-4be664a09281@bootlin.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b055339 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=wBYCl_nSamdfdyxXmbgA:9 a=CjuIK1q_8ugA:10
 a=NyyH46NNO2n4llnjC44A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX1BAOvbfp8wtp
 MzyO+JBNai1JWI7Vun+Vz3aGMfkMLF9WPAFMoX+lhC0x9TyZ9Dce1buOqMH02yags0Lc3Vz4rBV
 wuD8oDPRKHJI1Gl8twoza5IhWX5pnzw=
X-Proofpoint-GUID: 8sNktjLsmdjSzN8YfY1lqDVlrVubEbVX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX4O9L7WGLhSbQ
 jN9/AfVy0RvgEfSPhbI8YSaIsMz8ki+4oxu3mfcRmN5CsuxeMuZRRuQhnGXCPWCYlFc3eaJSGnZ
 mtfL4eCxRZVgfrd+STqFfP0c2euyHvfGABs8jENk4LiGbkTBSU4yTUwdYNDvYnWkO7e7FYfnAxK
 W3UVLHWBzWMqXvXztxklHosAgfQl4vYAFdXMkIsj5foYPB5S4EMtGXG5e1P/G/F3bK7jdO7Cn2v
 keV1HAHPZMvNXFALWEnqB7X7UeRixl33JMgQ00yJKUkdDbwZd9EjeZdKhDGzgmyXkWN3PLvOXuN
 jIrsKf8DFkQ1sZVygKuoywqggMVvtmkjsiyp6OE/OO8rgqC9zV9GecbPwO6a35xucTA/coolEjG
 MkmHNbMEPBhZ1CoO9mi65sAAY8vVFRwE20IIh1jb9GLEHLaaVdjfOFX3sDvFTqkn5GTUu1Z7Utd
 Et9fhh5WlU3fmelRCkQ==
X-Proofpoint-ORIG-GUID: 8sNktjLsmdjSzN8YfY1lqDVlrVubEbVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

--4rmTEbZeDTuovlI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On 11/21/26 18:28, Lorenzo Bianconi wrote:
> > xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
> > builds, which pulls the Ethernet header and advances skb->data. Drivers
> > that still need to process the L2 header before protocol parsing
> > therefore cannot use the helper.
> >=20
> > stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
> > the VLAN tag at skb->data and shifts the MAC addresses over it, so it h=
as
> > to run before eth_type_trans().
> >=20
> > Split the implementation into __xdp_build_skb_from_buff(), which builds
> > the skb (including the recycle mark, the Rx queue index and the frags
> > info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
> > header unset, so the caller must initialize them, usually by calling
> > eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
> > that still calls eth_type_trans() as before, preserving the behavior of
> > existing in-tree users. A follow-up patch will let stmmac use it.
>=20
> I've been questionning why we even do that in stmmac in the first place
> actually. This pretends to offload, but it's just to deal with the tag
> in the driver instead of later down the road.
>=20
> The original idea was for GRO back when it didn't handle vlan tags, but
> this isn't necessary anymore.
>=20
> There was a series in-flight to remove stmmac_rx_vlan altogether, but it
> seems to have stalled [1]:
>=20
> [1]: https://lore.kernel.org/all/20260914150612.9798-3-peilinhe2020@163.c=
om/
>=20
> Peilin He, do you have any plans to continue this ? If not, it may be good
> to pick this up instead of working around this.

I am fine to rebase my series on top of that one or pick the required patch.

Regards,
Lorenzo

>=20
> Maxime
>=20

--4rmTEbZeDTuovlI+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawVTNQAKCRA6cBh0uS2t
rHPZAQCKAGP+HxkZclzwJBS529Ya17YdjUFEqrcVdO8FnqTQYAD/WTWY/zFW4UQM
meWv9CThxP6DrZ3uuHCcz2TqrxwnlwE=
=40vj
-----END PGP SIGNATURE-----

--4rmTEbZeDTuovlI+--
