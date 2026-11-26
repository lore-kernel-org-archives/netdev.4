Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682925;
	b=WF2eh1VseFAqNURhh6VsQcG0O2UuQzraSY956mSUOmCmzpmZQR+pJ5iqeTZosoGHlJqO
	 jruKs8P8q11YCb3q/vZusLgEMFKbPH9Y9fNbREkjdOzAG3uXMqli5cQuS8KmTk162Zoyc
	 tKRm1W1p1QXTFxg1K6BYECTTVauaUQ2VYeHeNCFysFmOkO43iOdxcLRJI5f5dcHcMHnbx
	 j+i9Q+Sr1Colx0hmoMO9jq11s4/vj4n4K18E3+QDO6iXbTCooDqutWUGw4eCLHlUinP+G
	 Ri3PEDCH0eXjycqksf+tHQJj06iyZXzCVAVJq0dDPWeMrdlBBtahpJiahPPK0WdvXmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=;
	b=ddNUjhOXoBiuE5c1+oO/K46Eymqt0Nlq4g6tC9FZ28vH/HKx5Y3bc45VmAakL5wHg7KN
	 lGv/OB/DxrvOXORndyiYcQVXLiDro0l+jv/nXe9jwB1zPxQkUWmJ5WdEu5RV7yL2ozTeV
	 El8VJCUNlZj+y3qbAvgHmjn6RDgTtGU7A4qSAEnRIUN49QfxwU9H8qTpG4UR/qSOYcbWF
	 Goszyx8kLP033xQBtc0jjMXz4gYljGYFo7zkk/82XgcAaveOD9lGeOSnAGO0fMMHlOMl4
	 Bu3ATXHgyCHRJAuxIypIdbyb47FQPNQq/NXqlCV+5Z++1kywo/FjuZOBLFd96TRWfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiNtauQU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJvWSTBf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D91606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiNtauQU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJvWSTBf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4SR2335348
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PqoyykxduRZqHh/+n1fjoPJ1
	dR9TtXkyxrARIp0l8l4=; b=JiNtauQUQFwzRoWkbgRJH8J+Bv91W4qwoISIePXT
	p0hjqPVm5pTANPXG1/jIR4SBuAIOK5onipHQxTcbkj1VI6q2dPJqjPMpiYAdcpcf
	PxKqNrVReayav0BAQuh8xVFCbRXhKHgikBMz8GPXZkHhCbXwizx2FSocWIf6tMgf
	FCawkgtnJFImef+KDyFs/sj5eZUiVTqyZdI7Vtgk25yAzKFc29onTwKJkzVbPq0T
	8t6YJq45NDFmLdu1T6NmM52zaMN6iQBrzlk/qzJfp99FeDZqJUUT1F+72C9RT+Qf
	AVTFc/LU1AvzHccFxXnD98ye4rBp0zVfSZq2lGMnq0D63Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak01ekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:48:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso1157970285a.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682922; x=1796287722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=;
        b=YJvWSTBfKiJukyIsx39mEIjxfiJbH25+6MISDSNpN9G+wAYG4IzvwOvf7p7yI12SEV
         KEeUZOtyF20A5WHE46qjSZ18iHS8zJd2n/n2mrjw8L3xTNvEh+23ELE3a7Px/fEfL1iQ
         q3DYUAhA6kQ0v7XAfuat4zn0ix2lOX8GZVaPHWGQfzUxojQW8ddiW9UpNdnxpfRFHpgq
         K97YBOVEmVfvJs4ZatjaXeYSUef1rSv8JafjyoUUiRDIzPcZZrjilp8gBQRC8eqzli69
         0AQEeHqk+NPGkmUUn8zolXSSioAXzYBfn1XuUzbgivI/L+Ocjj2jZ9T0oGap1yMam3X3
         5naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682922; x=1796287722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=;
        b=ga2D2t1R6N0r6PXc7EfEgtrTd7Id8RNxQbyubex2KEuNb59j2KAdftKuPfbpzu7XX+
         RnPKbER3ongjvY9lT/0xUEgwf9Q9oUGDHWCzTmBPAabY0TGzAllkNNNoiraMoQM6VDSE
         KGIU/a3osSBjNUWIW5V4WiKH+gQ04wc7shwkGlV+1SHA52o9ObaSkVCRHqZzraoBcRA3
         10uABctxMc2a735QKiASLWiMYAYP+qz18IaRzjPvhDx7VVqRIhCpT0aio8GIVqEl3Bme
         DX1fdEWZ7fOFrtUmzzdQJ2C2n40hGbetTobza4w6F+rVbCcs1IXYooAOHz0BKb+ej5Od
         XGPA==
X-Forwarded-Encrypted: i=1; AL+hErH0L3kqLc1yBMPikL63oHGcxjwHiTSg6PkaaOGhyYEigdXdhiZdt6m/cXgqwV9i4I2kd3ouykQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a+l1AtKMLUmz0a7zRl+srBaGN8cZ5YpOlFGC2AUsADCYk+gJi
	uCtED2vSjU4V7nP+bIN1cXytsejMiyoYt7YlZJlhod5pauJSGX267trgp1P5B1f60ZzTEDQgMrI
	pNOV1ZKTX9llXfCtMWFMQBs9aA7Uo1+Zxriwpw7DzFl8aSfoqW7/iL+MCOmY=
X-Gm-Gg: AZFdTZfzCcTymZfVHLaL2BtvJswOvsIbJ+XoMbTOiJ4nKO4KUfbuA6XI3gv2FK9W6Sf
	SNmLrL4NC3kV5ZEctDXFtWk4cMpYCTyMeqE9ZotPUSjducHsGBTxQbZQPysx4s9BSfbczo1eoXm
	KIjYW0614vNtLPJ+CJAN87EJzinsX0HfQEzqQeqU6bwUeuGr/FAHcNAk7Sg1sFve6WRuelPDFbP
	OglSPMHby6saAovEweWckw9L7PbwQcnLUJ5rdkWh39bF/xQef1GfrwOoO/IG6OaN5wVMqVOBDpG
	seEBnWS3Di27byrsWste4fo09G6lyI2DJYzTzC/EYPegUupvNPtuOWQVvLjzcrICkdsZcbUDPzd
	sbCPGID346me5p7+9Fwalvx1An6Bv/2aS97QC37ZTHkQI3v8QED8fPHVH1zX1MTQIJuW5dZeRwR
	3HDRA2PZ+xJqEJi7lKgri4bSD9VPg=
X-Received: by 2002:a05:620a:4722:b0:93f:5ab9:fda7 with SMTP id af79cd13be357-949bab13ec8mr3826736185a.42.1795682922017;
        Thu, 26 Nov 2026 00:48:42 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93f:5ab9:fda7 with SMTP id af79cd13be357-949bab13ec8mr3826734185a.42.1795682921501;
        Thu, 26 Nov 2026 00:48:41 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm486755395e9.9.2026.11.26.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:48:40 -0800 (PST)
Date: Thu, 26 Nov 2026 09:48:39 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
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
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Peilin He <he.peilin@zte.com.cn>, Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v13 0/5] net: stmmac: introduce XDP rx
 multi-buff support
Message-ID: <awfyZw_KPtBbL4Hv@lore-desk>
References: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
 <179561841924.3294.5101937008242312303@kernel.org>
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
	protocol="application/pgp-signature"; boundary="21Ds69qcq4+cHuSi"
Content-Disposition: inline
In-Reply-To: <179561841924.3294.5101937008242312303@kernel.org>
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07f26a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=njfGP3QAHdpSEUKGj5kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pneYqlD8-M0spnmYsuNZ8VImrhRNQfOS
X-Proofpoint-GUID: pneYqlD8-M0spnmYsuNZ8VImrhRNQfOS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX0Vo/IG6Xox/Z
 yCcR/TslFrK+8k4Nu7NPHIDLPbiAYe7l63lfYwTfU+yYp6taOGtBC48tZi4RogkXVBaqMlMYs6T
 WshcKEBWhvWYLnlLbY2KAYhS+FLQ1n6stmstbZXpZ+zdmR3c9eiDREi2jFpJy7Ir/txSpsqGvyK
 WcHuMeDNLdNip4ZrCAq0eZogup2CfgrEN++2s3XadmYscM4lQqW60P6u+JsY1um1KMEPQB7VivX
 6ePYx4IYFjc4AGlbVCgY/eHI7t8sNdoeih7gZZvSrt5DtrBKylkPUXphEva5VQshE3VqLdXraXE
 6+Ho3sdv1Ztxq1Rl31lD9jjRkdnojwlr3zXLdau68z7X01mlD0PDdrWXKE1rKLD4uSJRX+hjW+B
 HXXqLtPPXtRtbSMdbOwG6mGduZvGFYk7wEDtNMZ5DNpxsuaH3cKgFslVJ+228nv/LWp9iWgSWmy
 1az6OZgVXikh/IJ+tRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX9Is2481p63ae
 EGf6hTBFEQ4t4YsVwwGdDOJrlAG8wCfQCHzlgFQRuuPX99amgIIBmEGqu2UEKbmHuVXfxxSM6c1
 jBJCCnJC42+xX2pr4rWQrmSZpbo1pfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033

--21Ds69qcq4+cHuSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue has been discovered during code development.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

This is a theoretical issue spotted during code development.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested this patch using a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--21Ds69qcq4+cHuSi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawfyZwAKCRA6cBh0uS2t
rEunAQD6nl/VLCn+I8bSqRZkXf09LIErn40/UwJE7r4eCWDJDAD/VfwnrMJKYCca
oaGdT3AhfeLSpSBeDENyGX4j0s2yPAo=
=Ssfi
-----END PGP SIGNATURE-----

--21Ds69qcq4+cHuSi--
