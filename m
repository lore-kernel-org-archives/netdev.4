Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795058936;
	b=R8G67Wt4FYNb5iq1mdT2vgliabXuX9TCXPpMg4deTKxjlL/6RtC6zppQ65u8GmmPhXhl
	 ClBfsNluiTkLO16fdpv2xNpsKbE5kbiY+k1VGeAEINWCViNSbnEg8HGgVh0LyfYtVu9HJ
	 JX7E3Qmw5NFKTCV7CX4jKrRR5vE5ndqzGKArAmv8xaTviED+WqZPWCmiwk70KikPBAHiX
	 oeLIYMPFouL0Y6o9YK9qVIfbqE+x/nwLxKu2p3xMC++OAoioqrB4laeDJEle5vfHFoxwd
	 bIrqNoboVI8ROAWaTONkMcauGArwGeZKpFlKyStqM59KEs3UkJh0deBaRbECd+4Qf6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YFyouvz3aTL5YmEooqR9IW4GssDoTF6w/bciUs6p4j4=;
	b=BKRaUVlIUUMZP9St3ekXhKO6FT3m/I0mDFJ82/XMMosuD2oeLpPmvoTvvN01fRRl/7A+
	 ynYeOG3cYrMB7rRK2zc2YOBIMgSnXCdIrHjvZQhyWwF5EOtcHVI4VR/0eHrI5PuI/eZIo
	 f9AhZxyt+UNiCfKE+4+6xm9e3vvEu2dwjQopBF5kJcfiQt4dsaHvcBCl/JEzzlZ5cFTQm
	 vmcQHIftLTsN2CvBGW3WINlaWzKVosyTRXZxTJSsiTKsQIOLl9I6Gj0KEV7MnK5jsbEL+
	 jadDrP/A2I3DCNTsm4vl/sj2vJLRtIXsHH7XEEMHS2eammieG8WOdRkXArWIHKBU+oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eA2CTSNs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QHtx/m5I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B3606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB9B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eA2CTSNs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHtx/m5I
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B8nm3490670
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YFyouvz3aTL5YmEooqR9IW4GssDoTF6w/bciUs6p4j4=; b=eA2CTSNsrNbTwJxe
	fstwcB1ZX5UMYr54o64o8ddpa2I4qc/CM2mau/LxSou+x37/bvpN1SotPJMDr4H+
	OHk7rRkrzdcE+xYG5+zv4Vr+RZ/IxDXxG6b11J4P4vduAPSoRpbWnENoXdtbSCbs
	2zQqiBaSpPfZKEyus/tYZ4/xcAhb/iIIkBHOBizZUYPoQoyIRYPUAeREI8fz0CX9
	6LGRaDwrzVT5tFdThR9zPfFyjw5i1/hWpNI0rRr55xf/YuxiZ0WYrC/CeHGx1MPe
	KTtKu11xj34TYZaIVqHFc5by/JolX169eUTs50WvSLP3ju7NonW8NZOPg7Ak8P+9
	gj9ezg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3babr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:28:54 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4bfc0b441so26289227b3.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 19:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795058934; cv=none;
        d=google.com; s=arc-20260327;
        b=Gq/dlMvTrLT+cxhhaX/RK1E+IJ8LDXLqLgn3WekyBYClI9JP0J+0DfZTRFWr/q7f5B
         EITcdK0sVii29ASWvi0IyGNPcRerv+Ee3Zrg13iuDov78lsM6KhLeWED5gaJBF0BPxUh
         12jDU52Dwwq6vq/HDZOe3oHGLO+vtGFHhg8rBnF6Xx7jmlrQEloVJ44n0/FpG1wZiFFB
         EDPdiONZesKtx9d5gYerQ0Tpx6ji4e5/tyJKTrgG25DQDt53NBSx2lu+nmHR5b4AGXYw
         XD8+WOLDdWFlZVpDBxBYJkPRLy99vuCY08M+fq8aTfykKB3ZJzqQL3UEhM0EGl38Jw4d
         oZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YFyouvz3aTL5YmEooqR9IW4GssDoTF6w/bciUs6p4j4=;
        fh=RwQ/+0MUa4/SBDgEICFguger4lJbm3isSorOaMij0MM=;
        b=eBwKnCTbRpebQYNuOOFngkwjvHLxSKuobYbXS1arcnhtXwgnmtr47B6nKD8lX03J29
         S0eJdviCxWKWfyz1tEvOvPc5e2YuU033RltVgwe5nAaMaISysmzhfLKdKQPUEJvYzT1N
         MKZ+innoV/PmVH1/ucUnaOLOMz3xJZm5kGqfnlZkPqfkqIkWHVJsUyYcdwM5RhwyUN4g
         iuEpRENvdge1o3NJUNFYxNHKDJhO6Vva1PeZggN8qfyAOpAQ4FGD0bzMXPdCIk8Fe5YM
         vyt8/sUD8wOTx0vnFBFrisKDsbEigUMB76ErBrAtZuGnMXInhk1V/zFIdwleaiMIa/I5
         /Tyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795058934; x=1795663734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFyouvz3aTL5YmEooqR9IW4GssDoTF6w/bciUs6p4j4=;
        b=QHtx/m5I0QPzTE0JSlqTbBHFp1elhbMguxV3RNGotXlobbzm6NjmS9L5SYlGhSltvD
         9Shqf+Lo7WRwtFLa/RzAvVMcvbVQpAE74Bwasq5mvOsnBUhYAeANCWCUJI6UXYqC8nfj
         x3lFRG9CoAVvu5/MD0LxbeFKF+2dCbY7PQ92YACLs1YHK6e9U6a7stt1hEcHH/Rniti6
         oadr+HKfOgfx1L/R5r7wps31E5DXWcDmvSMc19WHEAghu5crpjs0a/Rxhh/dRqyDH12v
         yCjlOgbMXe6rgniUpu+HVwGu95947/ULgCgpLnQDLOfx5+oNhC/lpDMu0J7GSERZ39Ku
         maTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058934; x=1795663734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFyouvz3aTL5YmEooqR9IW4GssDoTF6w/bciUs6p4j4=;
        b=ZMzcFVxk6ts7NOJiLTJKhdS8W9ydCGk9UG6rKWNy2UT2AR+jegpr8IFoJsl01itdoY
         xjZ2c0PKhZ+XtP5D2WfTUOkOwQFEQtwGnbDQFzwVnDNcy3mWTe17ll/0Lx0iZH4APTHQ
         2hd5d/RxZ/bp4dvKpXARmrd6W5MbkSWOHBGK/tCgL1NC15Kv+MHdmsJN7chUW9NJ10Dn
         cg17zmoTPVOOx+z9iAY7xCNQVwpWU0dVPsPxjwjjriG2pBe3tczGoBbV8TCJ5cUJMVu/
         Sfsl3MgO0azfyOyyS9YfUJH4b+dvNotody4kln2hcXIQ0QDkXMYmdGv3xnVJmu8DIAX0
         6Tdg==
X-Forwarded-Encrypted: i=1; AL+hErExSR1k1g2Gnkg3htkjY6hA9c8WsJhxxyKJkX8IlL1fBn42M9NJtu/aYxQbBlkyLfVdKXFD7EM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aYn3KYqE1VxkGq0iUnpKavUI4XOrVq+On5I4b887N+y/zpNQv
	PCWW8mjbyZ/zPxJHXOI68Zw7P47KGGGLnZ3dAsd/GKbZg0kRwGYaZqNmBHFj1LcOMLZya35bCCz
	7sLIKeKqeDw1tO1tQ5gH1lGC2Ah36pvR9Ll1a5dVh4pmoa72opD+HBNVFXQ6E+i4/Fd+dpCeDs3
	0sv+2nnOhMk5gNNnmA1wwX25+1WXbX1vQNDQ==
X-Gm-Gg: AZFdTZeMVpyjKTDxvYX1JDmeipv1Km2rINud2zrR2dwfNs7py0+qHzT/5WlUhjkDpRI
	tL2GJfIqEBison5515YogpAvAO7rprF7IQKRBX1bzPLTCIq1nxPVNBtWj4n+y4zgwNlQuAYiYrU
	D0iM9uAAM2YoVFCGBzHIAQBqke3cY9ISmezxsXw4NByMBQLn5HO3u4NjOmCg==
X-Received: by 2002:a05:690c:68c:b0:8b4:dcd0:c84f with SMTP id 00721157ae682-8b4fed976c6mr20026157b3.47.1795058933892;
        Wed, 18 Nov 2026 19:28:53 -0800 (PST)
X-Received: by 2002:a05:690c:68c:b0:8b4:dcd0:c84f with SMTP id
 00721157ae682-8b4fed976c6mr20026067b3.47.1795058933448; Wed, 18 Nov 2026
 19:28:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
 <179502224211.3136.8031848811478345993@kernel.org>
In-Reply-To: <179502224211.3136.8031848811478345993@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:28:42 +0800
X-Gm-Features: Aa3M54rYS_-kM9k5ZBo9HrYZNuDzdQZ-gbmhVi2vE3pSG1q6bb7-EbiFzueLDa0
Message-ID: <CAPTcHHTCR_L_oQhEoC+hdqs=HVj1AJQfV7KBBhOEH8__zq-RHA@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: phy: aquantia: Poll global status
 register for provision ID
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, sagar.cheluvegowda@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TmK_odswJGByblUgWBBdxSQ4qbisea8E
X-Proofpoint-GUID: TmK_odswJGByblUgWBBdxSQ4qbisea8E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMyBTYWx0ZWRfX8c6tqo6HampI
 IWW2hWeHpT8yV6mbuxnVGoS05+7epJuE054Ah+titAIbrWNIBsNGKxdo5H7enpKZWdn/ig+OXi9
 QPUGfifTULY54Ny4VrzSJA20npNgNMA=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe6cf6 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=n1glWqedgGAeEDhQcX8A:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMyBTYWx0ZWRfX+RHISvVXUJ05
 DPteGLo+L+hXQ+h1ZspcjxPxLwCjP5bWx0KaTnDqfsPcCdmAmqbTQSAnyscvPETAFURqtuGMW8C
 auW0Q+90p6LTF5cCz7vGLtUsf5Z0dYlNpUKK++odXT/yyGrjkTKz35jsLgCkfee7ZhyjstdmxfL
 H7YMT2d+3ywysFXc2jygIWp9OIdCO4hJZ0Cgqj+T/wdNKfcP8Se7VHq4MwwxBEQIOSIWYWjdjIx
 fxwfusXF4XI5PZnO166dv5YHIVvrgAtYnDWeeRGe0pO3NDz1RNP1ETO220UPpu+J3pxhix/iIlG
 pTBe8FAv9XFiJIaZ+cbvawU9GBdB8kEgdPK8BnvFTUPMRR/BDGjwCW0xP2tP/WY7u+GnZNDSDi0
 e6uWKnB4SsVk9kFRS/GVc7sBEHnzhkJrPSD487b64lxcdb3K3H3HCKtCH7HxAvN+VHxVJdEJav2
 Bu88XfQW2DZG0u3S81A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190013

On Thu, Nov 19, 2026 at 1:17=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new poll in aqr_wait_reset_complete()
>   (drivers/net/phy/aquantia/aquantia_main.c, lines 720-734) treats=E2=80=
=A6
> - [Low] The commit message says the patch fixes a user-visible defect in
>   existing AQR113 support ('Starting subsequent firmware operations=E2=80=
=A6
> - [Low] aqr_need_provision_id_check() (aquantia_main.c:684-690) limits
>   the new wait to PHY_ID_AQR113 and PHY_ID_AQR113C.
> - [Low] When the new PROV_ID poll times out, aqr_wait_reset_complete()
>   logs a warning and returns 0 (aquantia_main.c:732-736).
>
> --
>
> net: phy: aquantia: Poll global status register for provision ID
>
> On AQR113 and AQR113C, aqr_wait_reset_complete() now goes on to poll the
> PROV_ID field of VEND1_GLOBAL_RSVD_STAT1 until it is non-zero, after the
> firmware ID check. A read error is returned to the caller. A poll timeout
> only logs a warning, and the function still returns 0.
>
> > Starting subsequent firmware operations before the provision ID is
> > valid leads to steady link failures; this has been observed during
> > AQR113 PHY bring-up.
>
> [Severity: Low]
> This describes a link failure with the existing AQR113 support. That
> support already goes through aqr_gen4_config_init()->
> aqr_gen1_config_init()->aqr_wait_reset_complete().
>
> Should this carry a Fixes: tag and possibly Cc: stable? Is it meant for
> net or net-next?
>
I think no need to tag a Fixes: tag as this is something new to the
bring up sequence. It is menat for net-next.

> > diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy=
/aquantia/aquantia_main.c
> > index e95d391a6dc23..a5bba9be0d069 100644
> > --- a/drivers/net/phy/aquantia/aquantia_main.c
> > +++ b/drivers/net/phy/aquantia/aquantia_main.c
> > @@ -681,12 +681,24 @@ static int aqr107_set_tunable(struct phy_device *=
phydev,
> >  #define AQR_FW_WAIT_SLEEP_US 20000
> >  #define AQR_FW_WAIT_TIMEOUT_US       2000000
> >
> > +static bool aqr_need_provision_id_check(struct phy_device *phydev)
> > +{
> > +     return phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113,
> > +                           phydev->drv->phy_id_mask) ||
> > +            phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR113C,
> > +                           phydev->drv->phy_id_mask);
> > +}
>
> [Severity: Low]
> This isn't a bug, but AQR114C, AQR115, AQR115C and AQR813 also go
> through aqr_gen4_config_init() and aqr_wait_reset_complete(), and they
> won't get this wait. The v4 changelog says the narrower scope is
> intentional.
>
> Were those parts checked for the same provisioning behaviour? If so,
> could the commit message say so?
>
We only encounter this issue for AQR113, didn't touch AQR114C.AQR115,
etc..., this patch will only focus on AQR113.
If in the future soemone see same issue, they can raise patch for othe
types phy.

> > +
> >  /* If we configure settings whilst firmware is still initializing the =
chip,
> >   * then these settings may be overwritten. Therefore make sure chip
> >   * initialization has completed. Use presence of the firmware ID as
> >   * indicator for initialization having completed.
> >   * The chip also provides a "reset completed" bit, but it's cleared af=
ter
> >   * read. Therefore function would time out if called again.
> > + *
> > + * On AQR113 and AQR113C, additionally wait for the provisioning ID to
> > + * become non-zero, indicating that firmware provisioning is complete.
> > + * Without this polling, link issue can be seen after phy boot.
> >   */
> >  int aqr_wait_reset_complete(struct phy_device *phydev)
> >  {
> > @@ -702,7 +714,26 @@ int aqr_wait_reset_complete(struct phy_device *phy=
dev)
> >               return val;
> >       }
> >
> > -     return ret;
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (aqr_need_provision_id_check(phydev)) {
> > +             ret =3D read_poll_timeout(phy_read_mmd, val,
> > +                                     val < 0 ||
> > +                                     FIELD_GET(VEND1_GLOBAL_RSVD_STAT1=
_PROV_ID, val),
> > +                                     AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT=
_TIMEOUT_US,
> > +                                     false, phydev, MDIO_MMD_VEND1,
> > +                                     VEND1_GLOBAL_RSVD_STAT1);
>
> [Severity: Medium]
> Is PROV_ID a reliable sign that provisioning is done? Elsewhere in the
> driver it looks like a fixed identifier of the firmware image. It sits
> next to FW_BUILD_ID and has no validity bit:
>
> drivers/net/phy/aquantia/aquantia.h:
> #define VEND1_GLOBAL_RSVD_STAT1_FW_BUILD_ID     GENMASK(7, 4)
> #define VEND1_GLOBAL_RSVD_STAT1_PROV_ID         GENMASK(3, 0)
>
> aqr_build_fingerprint() reads it only as one part of the image
> fingerprint:
>
>         build_id =3D FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_FW_BUILD_ID, val);
>         prov_id =3D FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID, val);
>
> The v4 changelog also says some PHYs use PROV_ID=3D0 as a valid value.
>
> aqr_need_provision_id_check() decides from the silicon ID. The PROV_ID
> value, though, comes from whichever image gets loaded, whether from flash=
,
> nvmem or the filesystem.
>
> What happens if an AQR113/AQR113C runs an image with provisioning ID 0?
>
> The poll could then never succeed. Every call would poll MDIO for the
> full AQR_FW_WAIT_TIMEOUT_US (2 seconds) and log "Firmware provisioning ID
> not ready". aqr_wait_reset_complete() is called from:
>
> aqr107_probe()->aqr_firmware_load()->aqr_wait_reset_complete()
>
> phy_init_hw()->aqr_gen4_config_init()->aqr_gen3_config_init()->
>   aqr_gen2_config_init()->aqr_gen1_config_init()->
>   aqr_wait_reset_complete()
>
> Would bring-up then take at least 4 seconds per PHY, plus 2 seconds on
> every attach and resume?
>
On PROV_ID reliability for AQR113/AQR113C:
According to the vendor databook for AQR113 and AQR113C, PROV_ID=3D0
specifically means "provisioning not yet complete" =E2=80=94 it is not a va=
lid
provisioned state. A non-zero PROV_ID indicates that firmware
provisioning has finished. This is why the check is gated to only
these two PHYs via aqr_need_provision_id_check(): for other PHY
variants, PROV_ID=3D0 may be a legitimate firmware-defined value, but
not for AQR113/AQR113C.
So the scenario you described =E2=80=94 an AQR113/AQR113C image with PROV_I=
D=3D0
as a valid provisioned state =E2=80=94 does not occur per the hardware
specification.

> The commit message also seems to contradict itself. It says that starting
> operations before the provision ID is valid "leads to steady link
> failures", but also that a timeout "does not necessarily prevent link
> establishment".
>
> It also says a timeout "indicates a hardware-level provisioning failure".
> Nothing in the driver appears to support that.
>
There is no contradiction. "Link issue can be seen" means link
establishment fails when configuration is applied before provisioning
completes. "Does not necessarily prevent link establishment" in the
timeout case means: if the timeout expires, we proceed anyway (with a
warning), and the link may still come up depending on hardware state =E2=80=
=94
but we cannot guarantee it. These are two different scenarios.

> The driver already polls readiness signals tied to hardware state. One is
> the wait_on_global_cfg poll of VEND1_GLOBAL_CFG_100M in
> aqr_gen2_fill_interface_modes(). Another is
> VEND1_GLOBAL_GEN_STAT2_OP_IN_PROG. Would one of those work for AQR113
> instead?
No, those are not enough, PROV_ID is the one we should check.

>
> > +             if (val < 0) {
> > +                     phydev_err(phydev, "Failed to read VEND1_GLOBAL_R=
SVD_STAT1: %pe\n",
> > +                                ERR_PTR(val));
> > +                     return val;
> > +             }
> > +             if (ret)
> > +                     phydev_warn(phydev, "Firmware provisioning ID not=
 ready\n");
> > +     }
> > +
> > +     return 0;
> >  }
>
> [Severity: Low]
> This isn't a bug, but the new comment above aqr_wait_reset_complete()
> says the function waits for the provisioning ID, "indicating that
> firmware provisioning is complete". On timeout it only warns and
> returns 0, so callers cannot tell that provisioning did not finish.
>
> Returning 0 here looks right. aqr_firmware_load() treats -ETIMEDOUT as
> "no firmware loaded" and would load a new image over the running one.
> Also, aqr_gen1_config_init() does the downshift, MDI and LED writes
> whatever this returns.
>
> Could the comment say that the provisioning wait is best effort? Could it
> also say that the link failure described in the commit message can still
> happen after a timeout?
>
This information is already reflected in the commit message, people
who check this patch should be able to fully get hte intention.

Regards,
Hongmei Xu
